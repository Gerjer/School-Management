/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.9 : Database - djemfcst_hris
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
  `is_deleted` int(11) DEFAULT '0',
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0' COMMENT '0 = for approval, 1 = hired, 2 = rejected',
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `applicants` */

insert  into `applicants`(`id`,`full_path`,`file_ex`,`position`,`first_name`,`middle_name`,`last_name`,`created_at`,`status`,`is_deleted`) values (1,'storage/uploads/applications/12_03_2021_21_40_40_application_15.jpg','jpg','Quality Management Representative','Rochelle','L','Caculba','2021-12-04 05:40:40',0,0);

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
  `is_deleted` int(11) DEFAULT '0',
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
  `balance` double DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cost_center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cost_center` */

insert  into `cost_center`(`cost_center_id`,`cost_center_code`,`cost_center`,`address`,`balance`,`remarks`) values (1,'CC1','ADMIN & SELLING','Main Office',1000000,''),(2,'CC2','INDIRECT LABOR','MAIN OFFICE',1000000,''),(3,'CC3','MANUFACTURING','MAIN OFFICE',1000000,'');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cost_center_details` */

insert  into `cost_center_details`(`cost_center_detail_id`,`cost_center_id`,`trans_type`,`current_balance`,`amount`,`new_balance`,`date_save`,`save_by_id`,`save_by`) values (1,1,'DEPOSIT',1000000,1000000,1000000,'2019-06-12',1,'MARK CHIN'),(2,2,'DEPOSIT',1000000,1000000,1000000,'2019-06-12',1,'MARK CHIN'),(3,3,'DEPOSIT',1000000,1000000,1000000,'2019-06-12',1,'MARK CHIN'),(4,4,'DEPOSIT',NULL,NULL,NULL,'2019-09-25',1,'MARK CHIN');

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
  `isCostCenter` tinyint(1) DEFAULT '0',
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `extra_zero` double DEFAULT '0',
  `required_days` double DEFAULT '0',
  `required_hours` double DEFAULT '0',
  `actual_hour` double DEFAULT '0',
  `actual_day` double DEFAULT '0',
  `absent_hour` double DEFAULT '0',
  `paternity_leave_hour` double DEFAULT '0',
  `sil_hour` double DEFAULT '0',
  `late_min` double DEFAULT '0',
  `ut` double DEFAULT '0',
  `ot` double DEFAULT '0',
  `nd` double DEFAULT '0',
  `sun_hr` double DEFAULT '0',
  `sun_ot` double DEFAULT '0',
  `sun_nd` double DEFAULT '0',
  `spl_hr` double DEFAULT '0',
  `spl_ot` double DEFAULT '0',
  `spl_nd` double DEFAULT '0',
  `hol_hr` double DEFAULT '0',
  `hol_ot` double DEFAULT '0',
  `hol_nd` double DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `emp_dependent` */

insert  into `emp_dependent`(`dependent_id`,`emp_id`,`dependent_full_name`,`dependent_bday`) values (30,17,'JAE BRENT D.BORJA',NULL),(31,25,'NERILYN A. COSCOS',NULL),(32,47,'MARY GRACE P. LETIGIO',NULL),(33,81,'KYLE ALEXANDER A. URBUDA','2020-03-12'),(34,81,'CLAIRE ANNE A. URBUDA','1995-11-24');

/*Table structure for table `emp_displinary_actions` */

DROP TABLE IF EXISTS `emp_displinary_actions`;

CREATE TABLE `emp_displinary_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `discp_date` date DEFAULT NULL,
  `cases` varchar(255) DEFAULT NULL,
  `severity` varchar(30) DEFAULT NULL,
  `remarks` text,
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
  `job_description` longtext,
  `jd_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1790 DEFAULT CHARSET=latin1;

/*Data for the table `emp_job_description` */

insert  into `emp_job_description`(`job_description_id`,`emp_id`,`job_description`,`jd_image_path`) values (72,90,'job','storage/uploads/employees_job/10_02_2019_11_44_17_job_desc_6.png'),(73,90,'job2','storage/uploads/employees_job/10_02_2019_11_44_17_job_desc_7.png'),(74,90,'job3','storage/uploads/employees_job/10_02_2019_11_44_38_job_desc_8.png'),(1785,91,'yow1','storage/uploads/employees_job/10_03_2019_05_31_47_job_desc_21.png'),(1786,91,'yow2','storage/uploads/employees_job/10_03_2019_05_32_18_job_desc_23.jpg'),(1787,91,'yow3','storage/uploads/employees_job/10_03_2019_05_32_18_job_desc_24.png'),(1788,112,'TEST','storage/uploads/employees_job/12_11_2021_07_23_48_job_desc_25.jpg'),(1789,113,'TEST','storage/uploads/employees_job/12_11_2021_07_24_56_job_desc_26.png');

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
  `organizational` longtext,
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
  `issued_by` int(11) DEFAULT '0',
  `is_deleted` int(11) DEFAULT '0',
  `deleted_by` int(11) DEFAULT '0',
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `emp_other_loan` */

insert  into `emp_other_loan`(`loan_id`,`loan_date`,`emp_id`,`emp_name`,`loan_amount`,`amount_deduction`,`date_from`,`date_to`,`remarks`,`issued_by`,`is_deleted`,`deleted_by`) values (1,'2022-06-01',1,'ABING, HACELJEN INCIPIDO',300,100,'2022-01-01','2022-08-31','Test Loan',81,0,0);

/*Table structure for table `emp_other_loan_details` */

DROP TABLE IF EXISTS `emp_other_loan_details`;

CREATE TABLE `emp_other_loan_details` (
  `loan_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) DEFAULT NULL,
  `date_deducted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` double DEFAULT '0',
  `current_deduction` double DEFAULT '0',
  `current_balance` double DEFAULT '0',
  `remaining_balance` double DEFAULT '0',
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
  `issued_by` int(11) DEFAULT '0',
  `is_deleted` int(11) DEFAULT '0',
  `deleted_by` int(11) DEFAULT '0',
  PRIMARY KEY (`pagibig_loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `emp_pagibig_loan` */

insert  into `emp_pagibig_loan`(`pagibig_loan_id`,`pagibig_loan_date`,`emp_id`,`emp_name`,`loan_amount`,`amount_deduction`,`date_from`,`date_to`,`remarks`,`issued_by`,`is_deleted`,`deleted_by`) values (1,'2022-06-06',30,'EMPINADO, ETHEL ALEGADO',10000,384.8,'2022-05-01','2022-08-31','test',88,0,0);

/*Table structure for table `emp_pagibig_loan_details` */

DROP TABLE IF EXISTS `emp_pagibig_loan_details`;

CREATE TABLE `emp_pagibig_loan_details` (
  `pagibig_loan_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `pagibig_loan_id` int(11) DEFAULT NULL,
  `date_deducted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` double DEFAULT '0',
  `current_balanace` double DEFAULT '0',
  `current_deduction` double DEFAULT '0',
  `remaining_balance` double DEFAULT '0',
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
  `monthly_rate` double DEFAULT '0',
  `basic_pay` double DEFAULT '0',
  `late` double DEFAULT '0',
  `ut` double DEFAULT '0',
  `absent` double DEFAULT '0',
  `gross_pay` double DEFAULT '0',
  `honorarium` double DEFAULT '0',
  `sss` double DEFAULT '0',
  `philhealth` double DEFAULT '0',
  `pagibig` double DEFAULT '0',
  `wtax` double DEFAULT '0',
  `sss_loan` double DEFAULT '0',
  `pagibig_loan` double DEFAULT '0',
  `other_loan` double DEFAULT '0',
  `canteen` double DEFAULT '0',
  `coop` double DEFAULT '0',
  `total_deduction` double DEFAULT '0',
  `net_pay` double DEFAULT '0',
  `yr` int(11) DEFAULT NULL,
  `period` varchar(255) DEFAULT '',
  `sss_er` double DEFAULT '0',
  `philhealth_er` double DEFAULT '0',
  `pagibig_er` double DEFAULT '0',
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
  `goal` text,
  `remarks` text,
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
  `issued_by` int(11) DEFAULT '0',
  `is_deleted` int(11) DEFAULT '0',
  `deleted_by` int(11) DEFAULT '0',
  PRIMARY KEY (`sss_loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_sss_loan` */

/*Table structure for table `emp_sss_loan_details` */

DROP TABLE IF EXISTS `emp_sss_loan_details`;

CREATE TABLE `emp_sss_loan_details` (
  `sss_loan_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sss_loan_id` int(11) DEFAULT NULL,
  `date_deducted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` double DEFAULT '0',
  `current_deduction` double DEFAULT '0',
  `current_balance` double DEFAULT '0',
  `remaining_balance` double DEFAULT '0',
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
  `DoleRate_Empl` double DEFAULT '0',
  `PhotoPath_Empl` text,
  `picture_path` varchar(255) DEFAULT '',
  `BirthDate_Empl` date DEFAULT NULL,
  `RatePerDay_Empls` double DEFAULT '0',
  `DeductCashBond_Empl` double DEFAULT '0',
  `CashCard_Empl` double DEFAULT '0',
  `DateHired_Empl` date DEFAULT NULL,
  `DatTerminated_Empl` date DEFAULT NULL,
  `Status_Empl` varchar(50) DEFAULT '',
  `Type_Empl` varchar(50) DEFAULT '',
  `Remarks_Empl` varchar(255) DEFAULT '',
  `Honorarium_Empl` double DEFAULT '0',
  `BasicSalary_Empls` double DEFAULT '0',
  `Group_Empl` varchar(50) DEFAULT '',
  `deduction_effectivity` varchar(50) DEFAULT '',
  `withHolding_effectivity` varchar(50) DEFAULT '',
  `Allowance` double DEFAULT '0',
  `Restday` varchar(255) DEFAULT '',
  `philhealth_no` varchar(255) DEFAULT '',
  `pagibig_no` varchar(255) DEFAULT '',
  `weight` varchar(255) DEFAULT '',
  `height` varchar(255) DEFAULT '',
  `gender` varchar(255) DEFAULT '',
  `resident_certificate_no` varchar(255) DEFAULT '',
  `civilStatus` varchar(255) DEFAULT '',
  `dependent` tinyint(4) DEFAULT '0',
  `gp_sss_ee` double DEFAULT '0' COMMENT 'sss employee share',
  `gp_sss_er` double DEFAULT '0' COMMENT 'sss employer''s share',
  `gp_phealth_ee` double DEFAULT '0',
  `gp_phealth_er` double DEFAULT '0',
  `gp_pagibig_ee` double DEFAULT '0',
  `gp_pagibig_er` double DEFAULT '0',
  `gp_wtax` double DEFAULT '0',
  `dept_id` varchar(100) DEFAULT '',
  `is_classified` tinyint(1) DEFAULT '0',
  `biometric_id` varchar(20) DEFAULT '',
  `transpo_allowance` double DEFAULT '0',
  `mobile_allowance` double DEFAULT '0',
  `osa_allowance` double DEFAULT '0',
  `meal_allowance` double DEFAULT '0',
  `no_of_days` double DEFAULT '0',
  `email` varchar(255) DEFAULT '',
  `contact_no` varchar(255) DEFAULT '',
  `emp_level_id` int(11) DEFAULT '0',
  `bank` varchar(255) DEFAULT '',
  `rate_type` varchar(255) DEFAULT '',
  `updated_at` datetime DEFAULT NULL,
  `cost_center_id` int(11) DEFAULT '0',
  `cost_center` varchar(255) DEFAULT '',
  `require_dtr` int(11) DEFAULT '1',
  `sick_leave_credit` double DEFAULT '0',
  `vacation_leave_credit` double DEFAULT '0',
  `maternity_leave_credit` double DEFAULT '0',
  `paternity_leave_credit` double DEFAULT '0',
  `medical_allowance_dependent` double DEFAULT '0',
  `cloathing_allowance` double DEFAULT '0',
  `laundry_allowance` double DEFAULT '0',
  PRIMARY KEY (`SysPK_Empl`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

/*Data for the table `employees` */

insert  into `employees`(`SysPK_Empl`,`UserID_Empl`,`Name_Empl`,`FirstName_Empl`,`MiddleName_Empl`,`LastName_Empl`,`Address_Empl`,`Position_Empl`,`Department_Empl`,`SSS_Empl`,`TIN_Empl`,`BloodType_Empl`,`EmergencyName_Empl`,`EmergencyAdd_Empl`,`EmergencyTelNo_Empl`,`AccountNo_Empl`,`TimeStart_Empl`,`TimeEnd_Empl`,`DoleRate_Empl`,`PhotoPath_Empl`,`picture_path`,`BirthDate_Empl`,`RatePerDay_Empls`,`DeductCashBond_Empl`,`CashCard_Empl`,`DateHired_Empl`,`DatTerminated_Empl`,`Status_Empl`,`Type_Empl`,`Remarks_Empl`,`Honorarium_Empl`,`BasicSalary_Empls`,`Group_Empl`,`deduction_effectivity`,`withHolding_effectivity`,`Allowance`,`Restday`,`philhealth_no`,`pagibig_no`,`weight`,`height`,`gender`,`resident_certificate_no`,`civilStatus`,`dependent`,`gp_sss_ee`,`gp_sss_er`,`gp_phealth_ee`,`gp_phealth_er`,`gp_pagibig_ee`,`gp_pagibig_er`,`gp_wtax`,`dept_id`,`is_classified`,`biometric_id`,`transpo_allowance`,`mobile_allowance`,`osa_allowance`,`meal_allowance`,`no_of_days`,`email`,`contact_no`,`emp_level_id`,`bank`,`rate_type`,`updated_at`,`cost_center_id`,`cost_center`,`require_dtr`,`sick_leave_credit`,`vacation_leave_credit`,`maternity_leave_credit`,`paternity_leave_credit`,`medical_allowance_dependent`,`cloathing_allowance`,`laundry_allowance`) values (1,'1','ABING, HACELJEN INCIPIDO','HACELJEN','INCIPIDO','ABING','P-6 AURELIO, SAN JOSE, DINAGAT ISLANDS','15','Basic Education','08-2996726-9','755-185-648',NULL,NULL,NULL,NULL,'2039482039',NULL,NULL,0,NULL,'','1998-06-24',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','18-250868174-8','1212-5759-6128','61kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'116',0,0,0,0,21.77,NULL,'09203345465',1,'Land Bank','Monthly','2022-07-13 09:46:08',0,'',0,0,0,0,0,0,0,0),(2,'2','AGOCOY, MONALIZA PESTANO','MONALIZA','PESTANO','AGOCOY','P-5 GARCIA LIBJO, DINAGAT ISLANDS','16','Basic Education','08-2965470-5','755-777-878','O','PAULINO A.  AGOCOY','P-5 GARCIA, LIBJO, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1997-08-12',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','18-050184590-4','1212-5326-3810','36','149','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'74',0,0,0,0,21.77,NULL,'09071471738',1,'Land Bank','Monthly','2034-05-19 16:30:55',0,'',0,0,0,0,0,0,0,0),(3,'3','RITA  AMPATIN','RITA','','AMPATIN','','31','ADMIN','','','','','','','','','',0,NULL,'',NULL,0,0,0,NULL,NULL,'REGULAR','','',0,10000,'','1-15','',0,'SUNDAY','','','','','Male','','Single',0,0,0,0,0,0,0,0,'1',0,'46',0,0,0,0,0,'','',0,'Land Bank','Monthly',NULL,0,'',0,0,0,0,0,0,0,0),(4,'4','ANDRIN, ARNEL ROMERO','ARNEL','ROMERO','ANDRIN','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','16','Basic Education','08-2996725-6','745-154-569','O+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-08-20',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','13-250755453-2','1212-5760-6106','59.7','4\'11','Male',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'109',0,0,0,0,21.77,'andrinromeroarnel88@gmail.com','09502785144',1,'Land Bank','Monthly','2034-05-19 16:35:58',0,'',0,0,0,0,0,0,0,0),(5,'5','ARCALA, RITA TABAMO','RITA','TABAMO','ARCALA','P-6 Don Ruben, San Jose, Dinagat Islands','7','Business Education','08-19334207','190-714-905','A','MR. LUCAS P. ARCALA','P-1 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','09126984363','',NULL,NULL,0,NULL,'','1955-11-15',0,0,0,NULL,NULL,'REGULAR','','',0,26500,'','1-15','',0,'SUNDAY','18-050015958-6','1210-4988-1332','115kls','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'7',0,'24',0,0,0,0,21.77,NULL,'09126894363',1,'Land Bank','Monthly','2034-05-19 16:37:50',0,'',0,0,0,0,0,0,0,0),(6,'6','ARNOCO, ELMA MORENO','ELMA','MORENO','ARNOCO','P-6 Don Ruben, San Jose, Dinagat Islands','14','Art and Sciences','34-2485533-3','745-663-466',NULL,'PETER JAN M. ESPARTERO',NULL,NULL,'',NULL,NULL,0,NULL,'','1992-05-10',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18-200783121-9','1212-8040-9929',NULL,'5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'10',0,'138',0,0,0,0,21.77,NULL,'09385411330',1,'Land Bank','Monthly','2034-05-19 16:40:07',0,'',0,0,0,0,0,0,0,0),(7,'7','ARRAJI, FATIMA ESPINIDO','FATIMA','ESPINIDO','ARRAJI','P-2 RIZAL POBLACION, SAN JOSE, DINAGAT ISLANDS','15','Basic Education','08-2762454-6','336-544-987-000',NULL,'MILA E. ARRAJI','P-2 RIZAL POBLACION, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1993-02-16',0,0,0,NULL,NULL,'PROBATIONARY','','',0,11000,'','1-15','',0,'SUNDAY','18-201023455-8','1212-5328-3060','47kg','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'101',0,0,0,0,21.77,NULL,'09105537872',1,'Land Bank','Monthly','2034-05-19 16:42:21',0,'',0,0,0,0,0,0,0,0),(8,'8','ARTIZUELA, RUTCHILLE BARRIOS','RUTCHILLE','BARRIOS','ARTIZUELA','P-3 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','26','ADMIN','35-0181260-0','389-326-734',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1996-01-25',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-251199487-0','1212-8014-8427','50','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'137',0,0,0,0,21.77,'rutchilleartizuela22@gmail.com','09467192930',1,'Land Bank','Monthly','2034-05-19 16:45:01',0,'',0,0,0,0,0,0,0,0),(9,'9','GUADALUPE INSON BABATID','GUADALUPE','INSON','BABATID','','31','ADMIN','','','','','','','','','',0,NULL,'',NULL,0,0,0,NULL,NULL,'REGULAR','','',0,13000,'','1-15','',0,'SUNDAY','','','','','Male','','Single',0,0,0,0,0,0,0,0,'1',0,'18',0,0,0,0,0,'','',0,'Land Bank','Monthly',NULL,0,'',0,0,0,0,0,0,0,0),(10,'10','BANUELOS, KHAREN GRACE MALALIS','KHAREN GRACE','MALALIS','BANUELOS','P-7 Cabunga-an, Cagdianao, Dinagat Islands','16','Basic Education','35-1636709-8',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-05-29',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','18-025300983-5','1212-9427-5405','49','158','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'156',0,0,0,0,21.77,NULL,'09461055561',1,'Land Bank','Monthly','2034-05-19 16:49:07',0,'',0,0,0,0,0,0,0,0),(11,'11','BELINARIO, KEVIN LERTIDO','KEVIN','LERTIDO','BELINARIO','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','31','REGISTRAR','08-2643648-9','755-246-038',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-07-10',0,0,0,NULL,NULL,'REGULAR','','',0,9000,'','1-15','',0,'SUNDAY','182512125132','1212-5328-2072','60','5\'5','Male',NULL,'Single',0,0,0,0,0,0,0,0,'4',0,'83',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2034-05-19 16:52:45',0,'',0,0,0,0,0,0,0,0),(12,'12','BERINO, DIANE BACOLOD','DIANE','BACOLOD','BERINO','P-5 Justiniana Edera, San Jose, Dinagat Islands','14','ADMIN','35-1875389-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1994-08-15',0,0,0,NULL,NULL,'PROBATIONARY','','',0,8000,'','1-15','',0,'SUNDAY','182010503230',NULL,'48','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'161',0,0,0,0,21.77,'dianna.j316@gmail.com','09708753701',1,'Land Bank','Monthly','2022-07-13 09:47:46',0,'',0,0,0,0,0,0,0,0),(13,'13','BERNADOS, JUNREY IGONG-IGONG','JUNREY','IGONG-IGONG','BERNADOS','P-4 POBLACION, SAN JOSE, DINAGAT ISLANDS','15','Basic Education','34-0898220-6',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1989-04-06',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','132024369351','1060-0224-3633','65','5\'2','Male',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'105',0,0,0,0,21.77,NULL,'09506682661',1,'Land Bank','Monthly','2034-05-19 17:01:54',0,'',0,0,0,0,0,0,0,0),(14,'14','BERTE, HAZEL RAMOS','HAZEL','RAMOS','BERTE','P-6 Don Ruben, San Jose, Dinagat Islands','8','Hospitality and Tourism Management','08-2099507-8','711-935-409',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1981-05-21',0,0,0,NULL,NULL,'REGULAR','','',0,24500,'','1-15','',0,'SUNDAY','182006292799','1211-4133-1459',NULL,NULL,'Female',NULL,'Married',0,0,0,0,0,0,0,0,'9',0,'48',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2034-05-19 17:05:33',0,'',0,0,0,0,0,0,0,0),(15,'15','BLANCO, JASMEN OCAY','JASMEN','OCAY','BLANCO','P-6 Don Ruben, San Jose, Dinagat Islands','36','Basic Education','35-0186304-4','747-256-042','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-10-21',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','180501886511','1212-8043-4710','55','5\'5','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'129',0,0,0,0,21.77,'jasmenblanco@gmail.com','09306981206',1,'Land Bank','Monthly','2034-05-19 17:08:13',0,'',0,0,0,0,0,0,0,0),(16,'16','BOHOL, CHANRAH MAE OCA','CHANRAH MAE','OCA','BOHOL','P-2 Bonifacio, Poblacion, San Jose, Dinagat Islands','16','Basic Education','08-2965474-7','755-246-760',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-12-07',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','18-050184591-2','1212-5228-9907','47','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'71',0,0,0,0,21.77,NULL,'09120730451',1,'Land Bank','Monthly','2034-05-19 17:13:15',0,'',0,0,0,0,0,0,0,0),(17,'17','BORJA, EDILBERTO IV BURAY','EDILBERTO IV','BURAY','BORJA','BRGY POBLACION, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','08-1797888-8','934-144-525','O+','JULIET D. BORJA','BRGY SAN JOSE POBLACION',NULL,'',NULL,NULL,0,NULL,'','1982-09-28',0,0,0,NULL,NULL,'REGULAR','','',0,10000,'','1-15','',0,'SUNDAY','18-000045776-9','1830-0028-9988','75','5\'7','Male',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,NULL,0,0,0,0,21.77,NULL,'09485976653',1,'Land Bank','Monthly','2034-05-19 17:15:45',0,'',0,0,0,0,0,0,0,0),(18,'18','BRIONES, MERALYN ALEGADO','MERALYN','ALEGADO','BRIONES','P-3 AURELIO, SAN JOSE DINAGAT ISLANDS','14','Art and Sciences','35-1117047-1','600-878-323-000','O','MELBA A. BRIONES',NULL,NULL,'',NULL,NULL,0,NULL,'','1990-08-29',0,0,0,NULL,NULL,'RESIGNED','','',0,9000,'','1-15','',0,'SUNDAY','182008211001','1212-8863-2662','55kgs','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'10',0,'148',0,0,0,0,21.77,'mherbriones1435@gmail.com','09506768439',1,'Land Bank','Monthly','2022-06-21 03:31:19',0,'',0,0,0,0,0,0,0,0),(19,'19','BUSANO, MARYLAND ESNARDO','MARYLAND','ESNARDO','BUSANO','P-7 MABINI PUBLACION, SAN JOSE, DINAGAT ISLANDS','14','Business Education','08-2555074-8','755-779-951','B','JULIOS A. BUSANO','P-7 MABINI PUBLACION, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1991-08-12',0,0,0,NULL,NULL,'REGULAR','','',0,18000,'','1-15','',0,'SUNDAY','18-050152929-8','1211-4147-3502','47kg','5\'0','Female',NULL,'Married',0,0,0,0,0,0,0,0,'7',0,'9',0,0,0,0,21.77,NULL,'09463621996',1,'Land Bank','Monthly','2034-05-19 17:20:16',0,'',0,0,0,0,0,0,0,0),(20,'20','CABITANA, BERLYN TABAMO','BERLYN','TABAMO','CABITANA','P-4 CUARENTA, SAN JOSE, DINAGAT ISLANDS','33','Information and Communication Technology (ICT)','08-1853563-1','286-026-966-000','B+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1987-01-10',0,0,0,NULL,NULL,'REGULAR','','',0,14500,'','1-15','',0,'SUNDAY','18-050099392-6','1210-8457-1510','60','5\'7','Female',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'5',0,0,0,0,21.77,NULL,'09506682944',1,'Land Bank','Monthly','2034-05-19 17:22:53',0,'',0,0,0,0,0,0,0,0),(21,'21','CALLORA., MARRYFOL RETUBES','MARRYFOL','RETUBES','CALLORA.','P-4 DELA CONCEPTION,  STO. NIÑO,  LIBJO, DINAGAT ISLANDS','14','Business Education','08-2992797-9','718-133-378','O','SAMUEL S. CALLORA','P-4 STO. NIÑO, LIBJO, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1999-06-22',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','182516762757','1212-6012-9856','58','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'7',0,'120',0,0,0,0,21.77,NULL,'09502059977',1,'Land Bank','Monthly','2034-05-19 17:25:25',0,'',0,0,0,0,0,0,0,0),(22,'22','CANOY, CHERYL UDTUJAN','CHERYL','UDTUJAN','CANOY','P-5 WILSON, SAN JOSE, DINAGAT ISLANDS','14','Art and Sciences','08-1575875-4','004388541000','A+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1987-01-24',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','180252121224','1212-8043-1146','132 LBS','4\'9\"','Female',NULL,'Married',0,0,0,0,0,0,0,0,'10',0,'135',0,0,0,0,21.77,'cherylcanoy26@gmail.com','09516812694',1,'Land Bank','Monthly','2034-05-19 17:26:39',0,'',0,0,0,0,0,0,0,0),(23,'23','CREENCIA, ANAMAE TIAMZON','ANAMAE','TIAMZON','CREENCIA','P-4 SAN JOSE LIBJO(ALBOR II), DINAGAT ISLANDS','16','Basic Education',NULL,'600-805-096-000','O','ALADIN B. CREENCIA','P-4 SAN JOSE LIBJO(ALBOR II), DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1997-10-20',0,0,0,NULL,NULL,'PROBATIONARY','','',0,11000,'','1-15','',0,'SUNDAY','180253040155',NULL,'38kg','147cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'153',0,0,0,0,21.77,NULL,'09094650254',1,'Land Bank','Monthly','2034-05-19 17:31:34',0,'',0,0,0,0,0,0,0,0),(24,'24','COMBESTRA, EMIE CANETE','EMIE','CANETE','COMBESTRA','P-6 AURELIO, SAN JOSE, DINAGAT ISLANDS','26','Technical Vocational','08-3008679-9','755-250-355',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-05-28',0,0,0,NULL,NULL,'RESIGNED','','',0,0,'','1-15','',0,'SUNDAY','180501858909','1212-5330-7292','45kg','150cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'13',0,'110',0,0,0,0,21.77,NULL,'09466528641',1,'Land Bank','Monthly','2022-06-21 03:28:58',0,'',0,0,0,0,0,0,0,0),(25,'25','COSCOS, DENNIS AVERGONZADO','DENNIS','AVERGONZADO','COSCOS','P-2 LLAMERA LIBJO, DINAGAT ISLANDS','31','ADMIN','08-2723778-4','495381191000','B','AURELIO B. COSCOS SR.','P-2 LLAMERA LIBJO',NULL,'',NULL,NULL,0,NULL,'','1992-04-05',0,0,0,NULL,NULL,'REGULAR','','',0,22500,'','1-15','',0,'SUNDAY','182008944998','1211-9076-0500','60','5\'5','Male',NULL,'Single',-2,0,0,0,0,0,0,0,'1',0,'69',0,0,0,0,21.77,NULL,'09100891678',1,'Land Bank','Monthly','2034-05-19 17:36:29',0,'',0,0,0,0,0,0,0,0),(26,'26','DE LUIS, DARWIN OMAC','DARWIN','OMAC','DE LUIS','P-5 DEL PILAR, POBLACION, DINAGAT ISLANDS','16','Basic Education','08-2337798-1','004-388-541-000','O+','JIMMY O. DE LUIS',NULL,NULL,'',NULL,NULL,0,NULL,'','1992-10-16',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-200895771-2','1211-8130-8239','65 kls','5\'5\'\'','Male',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'140',0,0,0,0,21.77,NULL,'09305982590',1,'Land Bank','Monthly','2034-05-19 17:38:30',0,'',0,0,0,0,0,0,0,0),(27,'27','DIVINAGRACIA, BEATRIZ CARREON','BEATRIZ','CARREON','DIVINAGRACIA','P-3 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','33-4331814-2','000-407-203-000','A+','FELIPE E. DIVINAGRACIA, SR.',NULL,NULL,'',NULL,NULL,0,NULL,'','1959-10-05',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','19-051526058-0','1210-7863-4699','40 KLS','4\'11\"','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'7',0,0,0,0,21.77,NULL,'09098628735',1,'Land Bank','Monthly','2034-05-02 02:39:23',0,'',0,0,0,0,0,0,0,0),(28,'28','DUMAJEL, ERLYN ADOREMOS','ERLYN','ADOREMOS','DUMAJEL','P-6 POBLACION, SAN JOSE, DINAGAT ISLANDS','31','Business Education','04-2805619-9','505-844-042','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1996-02-11',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','152518006244','1211-0242-9076','53','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'7',0,'149',0,0,0,0,21.77,'erlynduamjel116@gmail.com','09301954678',1,'Land Bank','Monthly','2034-05-19 17:40:37',0,'',0,0,0,0,0,0,0,0),(29,'29','EDRADAN, ARNAN ANTALLAN','ARNAN','ANTALLAN','EDRADAN','P-4 LUNA, SAN JOSE, DINAGAT ISLANDS','14','ADMIN','08-1094763-8','915-469-933','AB','ARTURO B. EDRADAN','P-4 LUNA DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1976-05-16',0,0,0,NULL,NULL,'REGULAR','','',0,16000,'','1-15','',0,'SUNDAY','190902078227','1830-0011-8024','85','5\'7','Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'49',0,0,0,0,21.77,NULL,'09129862856',1,'Land Bank','Monthly','2034-05-19 17:42:31',0,'',0,0,0,0,0,0,0,0),(30,'30','EMPINADO, ETHEL ALEGADO','ETHEL','ALEGADO','EMPINADO','P-5 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','17','ACCOUNTING','08-1719380-9','732-080-558',NULL,'RIZALINO V. EMPINADO',NULL,NULL,'',NULL,NULL,0,NULL,'','1985-11-14',0,0,0,NULL,NULL,'REGULAR','','',0,18500,'','1-15','',0,'SUNDAY','18-050076817-5','1211-3419-4226','48 kg','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'3',0,'23',0,0,0,0,21.77,NULL,'09093246682',1,'Land Bank','Monthly','2034-05-19 17:43:45',0,'',0,0,0,0,0,0,0,0),(31,'31','ENTRINA, ANGEL GUALDAJARA','ANGEL','GUALDAJARA','ENTRINA','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS','31','ACCOUNTING','35-1054946-9','505-643-782-00000','B','EGMEDIO L. ENTRINA','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1998-12-07',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','08-050190217-7','1212-8863-4793','51kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'3',0,'146',0,0,0,0,21.77,'angelkimentrina@gmail.com','09207418657',1,'Land Bank','Monthly','2034-05-19 17:45:32',0,'',0,0,0,0,0,0,0,0),(32,'32','ENSOY, HERMENIA BARNISO','HERMENIA','BARNISO','ENSOY','P-5 Aurelio, San Jose, Dinagat Islands','31','ADMIN','35-1267036-5',NULL,'B+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1996-07-29',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18-025288154-7','1212-9470-9856','61kls.','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'155',0,0,0,0,21.77,'hermeniaensoy@gmail.com','09480649630',1,'Land Bank','Monthly','2034-05-19 17:47:17',0,'',0,0,0,0,0,0,0,0),(33,'33','ESNARDO, MARICHU MANTE','MARICHU','MANTE','ESNARDO','P-7 MABINI, SAN JOSE, DINAGAT ISLANDS','4','ADMIN','08-1090935-9','190-717-689','B','MR. RONALDO E. ESNARDO',NULL,NULL,'',NULL,NULL,0,NULL,'','1964-11-14',0,0,0,NULL,NULL,'REGULAR','','',0,27000,'','1-15','',0,'SUNDAY','18-050015972-1','1210-4661-6817','49klg','5\'1','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'13',0,0,0,0,21.77,NULL,'09123947055',1,'Land Bank','Monthly','2034-05-19 17:49:36',0,'',0,0,0,0,0,0,0,0),(34,'34','ESNARDO, RAYMART MANTE','RAYMART','MANTE','ESNARDO','P-7 MABINI, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','35-0172475-6',NULL,NULL,'MR. ROLANDO E. ESNARDO','P-7 MABINI, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1995-03-22',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-050188654-6','1212-8041-1520',NULL,NULL,'Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'128',0,0,0,0,21.77,'reymartesnardo@gmail.com',NULL,1,'Land Bank','Monthly','2034-05-19 17:51:27',0,'',0,0,0,0,0,0,0,0),(35,'35','FERNAN, ALEX RELACION','ALEX','RELACION','FERNAN','P-5 RUBEN E. ECLEO SR. CAGDIANAO, DINAGAT ISLANDS','31','ACCOUNTING','08-1387214-0','931-105-151',NULL,'ROSIE C. FERNAN','P-5 RUBEN E. ECLEO SR. CAGDIANAO, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1972-04-27',0,0,0,NULL,NULL,'REGULAR','','',0,19000,'','1-15','',0,'SUNDAY','180500744195','1210-1486-0006','68kgs','5\'5\'\'','Male',NULL,'Married',0,0,0,0,0,0,0,0,'3',0,'42',0,0,0,0,21.77,NULL,'09468286094',1,'Land Bank','Monthly','2034-05-19 17:53:47',0,'',0,0,0,0,0,0,0,0),(36,'36','FLORES, ESTELLA GEMAO','ESTELLA','GEMAO','FLORES','P-3 STA.CRUZ, SAN JOSE, DINAGAT ISLANDS','14','Art and Sciences','08-1846590-5','388-555-573-000','A+','GEONALD B. FLORES',NULL,NULL,'',NULL,NULL,0,NULL,'','1992-12-15',0,0,0,NULL,NULL,'RESIGNED','','',0,0,'','1-15','',0,'SUNDAY','12-051089631-4','1210-2304-8827','63 KLS','5\'5\'\'','Female',NULL,'Married',0,0,0,0,0,0,0,0,'10',0,NULL,0,0,0,0,21.77,NULL,'09382000558',1,'Land Bank','Monthly','2022-06-21 03:31:41',0,'',0,0,0,0,0,0,0,0),(37,'37','JAIRO  GARCIA','JAIRO','','GARCIA','','31','ADMIN','','','','','','','','','',0,NULL,'',NULL,0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY','','','','','Male','','Single',0,0,0,0,0,0,0,0,'1',0,'',0,0,0,0,0,'','',0,'Land Bank','Monthly',NULL,0,'',0,0,0,0,0,0,0,0),(38,'38','GAVIOLA, SHARIZOL LAPENIG','SHARIZOL','LAPENIG','GAVIOLA','P-5 LUNA, SAN JOSE, DINAGAT ISLANDS','31','Criminology','08-2997977-8','338-771-187',NULL,'ADELING L. GAVIOLA',NULL,NULL,'',NULL,NULL,0,NULL,'','1996-01-09',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','1500254700071','1212-0292-0328',NULL,NULL,'Male',NULL,'Single',0,0,0,0,0,0,0,0,'11',0,NULL,0,0,0,0,21.77,'gsharizol@gmail.com','09488612926',1,'Land Bank','Monthly','2034-05-19 17:56:28',0,'',0,0,0,0,0,0,0,0),(39,'39','GISMAN, CAREN BUAL','CAREN','BUAL','GISMAN','AURELIO, SAN JOSE DINAGAT ISLANDS','27','Technical Vocational','34-2323845-6','732-113-746',NULL,'CERELINA AMORA BUAL',NULL,NULL,'',NULL,NULL,0,NULL,'','1988-07-30',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','182007620528','1211-4540-1687','48 kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'13',0,'84',0,0,0,0,21.77,NULL,'09486252971',1,'Land Bank','Monthly','2034-05-19 17:58:01',0,'',0,0,0,0,0,0,0,0),(40,'40','GRAVANZA, ADELAIDA RAFAEL','ADELAIDA','RAFAEL','GRAVANZA','P-4 POBLACION, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','09-1006849-1','188-569-864','A+','BERNARDOM. GRAVANZA','P-4 POBLACION',NULL,'',NULL,NULL,0,NULL,'','1959-07-03',0,0,0,NULL,NULL,'REGULAR','','',0,22000,'','1-15','',0,'SUNDAY','180500744187','1210-4582-8353','90','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'12',0,0,0,0,21.77,NULL,'09305491202',1,'Land Bank','Monthly','2034-05-19 18:00:00',0,'',0,0,0,0,0,0,0,0),(41,'41','INSON, MERIAM DAGCUTAN','MERIAM','DAGCUTAN','INSON','P-3 AURELIO, SAN JOSE, DINAGAT ISLANDS','36','Basic Education','08-1835466-3','503-021-097','B+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1985-05-23',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-025239430-1','121288740334','45 kg','153 cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'141',0,0,0,0,21.77,NULL,'09995666104',1,'Land Bank','Monthly','2034-05-19 17:47:48',0,'',0,0,0,0,0,0,0,0),(42,'42','JANGALAY, JUDELYN MEDINA','JUDELYN','MEDINA','JANGALAY','P-3 AURELIO, SAN JOSE, DINAGAT ISLANDS','15','Basic Education','08-2996722-7','755-791-981','0',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1997-11-05',0,0,0,NULL,NULL,'PROBATIONARY','','',0,11000,'','1-15','',0,'SUNDAY','180501859085','121257921333','41','153','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'108',0,0,0,0,21.77,'judelynjangz@gmail.com','09484728557',1,'Land Bank','Monthly','2034-05-19 17:49:07',0,'',0,0,0,0,0,0,0,0),(43,'43','LAID, JHESORLEY MAGANA','JHESORLEY','MAGANA','LAID','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS','9','Information and Communication Technology (ICT)','08-265153-5',NULL,NULL,'JOSEROLLY S. LAID','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1989-12-23',0,0,0,NULL,NULL,'REGULAR','','',0,22000,'','1-15','',0,'SUNDAY','182008215007','121172271911','50','167cm','Male',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'1',0,0,0,0,21.77,NULL,'09466732212',1,'Land Bank','Monthly','2034-05-19 17:51:07',0,'',0,0,0,0,0,0,0,0),(44,'44','LASTIMOSO, DINO ROSALES','DINO','ROSALES','LASTIMOSO','P-4 LLAMERA DISTRICT I','31','ADMIN','08-2842365-2','399-245-667-000','A+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1999-08-17',0,0,0,NULL,NULL,'PROBATIONARY','','',0,8000,'','1-15','',0,'SUNDAY','182012604875','121224198436','61','5,4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'157',0,0,0,0,21.77,'dino_lastimoso@yahoo.com','09306873930',1,'Land Bank','Monthly','2034-05-19 17:54:16',0,'',0,0,0,0,0,0,0,0),(45,'45','LAPINID, MARIBEL SOLANO','MARIBEL','SOLANO','LAPINID','P-4 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','14','ADMIN',NULL,'399-852-986','B+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1995-12-22',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','182010456488','121287556603','47','158','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'139',0,0,0,0,21.77,NULL,'09703748135',1,'Land Bank','Monthly','2034-05-19 17:53:01',0,'',0,0,0,0,0,0,0,0),(46,'46','LECCIONES, DONALD GONZAGA','DONALD','GONZAGA','LECCIONES','P-7 RIZAL MELGAR, BASILISA, DINAGAT ISLANDS','14','Criminology',NULL,'755-251-437',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1989-11-05',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','182010427011','121257072789','53','5\'4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'11',0,'52',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2034-05-19 17:55:54',0,'',0,0,0,0,0,0,0,0),(47,'47','LETIGIO, REJOY POGADO','REJOY','POGADO','LETIGIO','P-1 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS','16','Basic Education','08-2964864-3','755-794-587-000',NULL,'JOVEN D. LETIGO','P-1 MAHAYAHAY',NULL,'',NULL,NULL,0,NULL,'','1992-02-19',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-200895724-0','1212-5331-9271','45','5\'2\'\'','Female',NULL,'Married',-2,0,0,0,0,0,0,0,'12',0,'103',0,0,0,0,21.77,'Letigiorejoy@gmail.com','09073759704',1,'Land Bank','Monthly','2034-05-19 18:03:22',0,'',0,0,0,0,0,0,0,0),(48,'48','LICO, ROZYL ROMA','ROZYL','ROMA','LICO','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','14','Basic Education',NULL,'503-021-350',NULL,'AURELIO M. LICO','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1998-07-24',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','142508631838','121294725021','46','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'142',0,0,0,0,21.77,'rozyllico@gmail.com','09510486705',1,'Land Bank','Monthly','2034-05-19 17:57:12',0,'',0,0,0,0,0,0,0,0),(49,'49','LOPEZ, NORA LUMIARES','NORA','LUMIARES','LOPEZ','P-6 AURELIO, SAN JOSE, DINAGAT ISALANDS','5','ADMIN',NULL,'129-118-459','O','DELFIN C. LOPEZ','P-6 AURELIO, SAN JOSE, DINAGAT ISALANDS',NULL,'',NULL,NULL,0,NULL,'','1956-10-02',0,0,0,NULL,NULL,'REGULAR','','',0,26000,'','1-15','',0,'SUNDAY','13600116801','1700-0064-7793','130lbs','5\'4','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'143',0,0,0,0,21.77,'nora.lopez@ssu.edu.ph','09187085678',1,'Land Bank','Monthly','2034-05-02 03:20:19',0,'',0,0,0,0,0,0,0,0),(50,'50','LULAB, AEYMH ZHAYL LAUSA','AEYMH ZHAYL','LAUSA','LULAB','P-1 IMELDA TUBAJON, DINAGAT ISLANDS','36','Basic Education','08-296-5403-5','738-162-169',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1997-03-31',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18050184920','121253324833','48','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'81',0,0,0,0,21.77,NULL,'09303097087',1,'Land Bank','Monthly','2034-05-19 17:59:13',0,'',0,0,0,0,0,0,0,0),(51,'51','LUMPAY, MARGIE LYN LACUMBES','MARGIE LYN','LACUMBES','LUMPAY','GUMATO STREET MABINI, TUBAJON, DINAGAT ISLANDS','14','ADMIN',NULL,'505-843-890-000','O-','MARIVIC L. LUMPAY','GUMATO STREET MABINI, TUBAJON, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1998-03-27',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18-251214056-5','121289337263','60','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'150',0,0,0,0,21.77,'margielynlumpay@gmail.com','09106910341',1,'Land Bank','Monthly','2034-05-19 18:00:58',0,'',0,0,0,0,0,0,0,0),(52,'52','MABANAG, RUTHCELYNE SALUDO','RUTHCELYNE','SALUDO','MABANAG','P-2 DONA HELEN, LIBJO,DINAGAT ISLANDS','16','Basic Education',NULL,'729-778-467-000',NULL,'COSME E. MABANAG','P-5 POBLACION, SAN JOSE, DINAGAT ISLANDS','09126864941','',NULL,NULL,0,NULL,'','1993-03-26',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18-025276500-8','121257646028','56klg','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'115',0,0,0,0,21.77,'ruthcelynemabanag@gmail.com','09489969532',1,'Land Bank','Monthly','2034-05-19 18:04:24',0,'',0,0,0,0,0,0,0,0),(53,'53','EVELYN BAJAR MALLERNA','EVELYN','BAJAR','MALLERNA','P-4 JACQUEZ ','31','ADMIN','','','','','','','','','',0,NULL,'',NULL,0,0,0,NULL,NULL,'REGULAR','','',0,7000,'','1-15','',0,'SUNDAY','','','','','Male','','Single',0,0,0,0,0,0,0,0,'1',0,'66',0,0,0,0,0,'','',0,'Land Bank','Monthly',NULL,0,'',0,0,0,0,0,0,0,0),(54,'54','MAMALIAS, JOAN MABOLIS','JOAN','MABOLIS','MAMALIAS','JACQUEZ, SAN JOSE, DINAGAT ISLANDS','31','ADMIN',NULL,'505-843-733',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1994-04-07',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','180501903165','121288463565','48','153 cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'159',0,0,0,0,21.77,NULL,'09502785825',1,'Land Bank','Monthly','2034-05-19 18:07:26',0,'',0,0,0,0,0,0,0,0),(55,'55','MANEJA, JERSON OCON','JERSON','OCON','MANEJA','P-5 AURELIO, SAN JOSE, DINAGAT ISLANDS','14','Information and Communication Technology (ICT)',NULL,'703-005-974','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1992-07-14',0,0,0,NULL,NULL,'REGULAR','','',0,16000,'','1-15','',0,'SUNDAY','180501772621','121252825404','50','151 cm','Male',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'20',0,0,0,0,21.77,NULL,'09105227009',1,'Land Bank','Monthly','2034-05-19 18:09:53',0,'',0,0,0,0,0,0,0,0),(56,'56','MANEJA, NELIA MANGUBAT','NELIA','MANGUBAT','MANEJA','P-1 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS','20','ACCOUNTING',NULL,'497-689-275',NULL,'JERSON O. MANEJA',NULL,'09106227009','',NULL,NULL,0,NULL,'','1993-10-17',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','0826672544','121178008714','49','5\'0','Female',NULL,'Married',0,0,0,0,0,0,0,0,'3',0,'88',0,0,0,0,21.77,NULL,'09464337218',1,'Land Bank','Monthly','2034-05-19 18:11:38',0,'',0,0,0,0,0,0,0,0),(57,'57','MANGUBAT, JONALY DESPI','JONALY','DESPI','MANGUBAT','P-1 POBLACION, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','34-02272365','432-948-727','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1988-07-29',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','03-050567609-9',NULL,'75','5\'4','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'144',0,0,0,0,21.77,'jonalymangubat88@gmail.com','0977933087',1,'Land Bank','Monthly','2022-05-13 03:30:59',0,'',0,0,0,0,0,0,0,0),(58,'58','CHRISTIAN IAN MARILLA MANTE','CHRISTIAN IAN','MARILLA','MANTE','','31','ADMIN','','','','','','','','','',0,NULL,'',NULL,0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY','','','','','Male','','Single',0,0,0,0,0,0,0,0,'1',0,'100',0,0,0,0,0,'','',0,'Land Bank','Monthly',NULL,0,'',0,0,0,0,0,0,0,0),(59,'59','MANTE, JESSERIE ANN','JESSERIE','ANN','MANTE','P-7 MABINI POBLACION, SAN JOSE, DINAGAT ISLANDS','14','Business Education','08-2848609-7','707-864-180-000',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1996-12-14',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','180252836053','121233357928','57','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'7',0,'134',0,0,0,0,21.77,'mantejayann@gmail.com','09308581204',1,'Land Bank','Monthly','2034-05-19 16:31:52',0,'',0,0,0,0,0,0,0,0),(60,'60','MARTINES, SUSAN MORTAL','SUSAN','MORTAL','MARTINES','P-1 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','19','ADMIN','35-0438076-0','509-227-559',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1969-12-25',0,0,0,NULL,NULL,'PROBATIONARY','','',0,7000,'','1-15','',0,'SUNDAY','020261422884',NULL,'50','5\'1','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'63',0,0,0,0,21.77,NULL,'09466531918',1,'Land Bank','Monthly','2034-05-19 16:48:09',0,'',0,0,0,0,0,0,0,0),(61,'61','MARZAN, JANETH ALGABRE','JANETH','ALGABRE','MARZAN','P-2 AURELIO, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','08-1388216-9','704-267-577','\"O\"','DONATO S. MARZAN','P-2 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1976-05-25',0,0,0,NULL,NULL,'REGULAR','','',0,19500,'','1-15','',0,'SUNDAY','18-050074420-9','121054879465','60','5\'0','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'14',0,0,0,0,21.77,NULL,'0912708863',1,'Land Bank','Monthly','2034-05-19 16:35:12',0,'',0,0,0,0,0,0,0,0),(62,'62','MARZAN, MARK BENN VILOAN','MARK BENN','VILOAN','MARZAN','P-3 QUIRINO, AURELIO, SAN JOSE, DINAGAT ISLANDS','14','Hospitality and Tourism Management','35-0255770-2','750-227-885-000',NULL,'MARIANO S. MARZAN','P-3 QUIRINO, AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1995-05-14',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18-251680051-9','121280464939','57kg','1.70m','Male',NULL,'Single',0,0,0,0,0,0,0,0,'9',0,'130',0,0,0,0,21.77,'markbennmarzan@gmail.com','09468638256',1,'Land Bank','Monthly','2034-05-19 16:37:34',0,'',0,0,0,0,0,0,0,0),(63,'63','MONATO, RAVELYEN CALIPAYAN','RAVELYEN','CALIPAYAN','MONATO','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS','24','Basic Education','08-2849224-3','742-427-116-000','AB+','RAMILO E. MONATO SR.','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1985-01-30',0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY','18-050177264-8','121252986799','45kg','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'3',0,0,0,0,21.77,NULL,'09306951029',1,'Land Bank','Monthly','2034-05-19 16:40:51',0,'',0,0,0,0,0,0,0,0),(64,'64','MONTES, GENERICK GROTES','GENERICK','GROTES','MONTES','P-3 STA.CRUZ, SAN JOSE, DINAGAT ISLANDS','14','Information and Communication Technology (ICT)','35-1673382-6','385-168-366',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1991-10-06',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY',NULL,'121296036292','54','164','Male',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'160',0,0,0,0,21.77,'generickmontes@gmail.com','09501810252',1,'Land Bank','Monthly','2034-05-19 16:43:45',0,'',0,0,0,0,0,0,0,0),(65,'65','NOVA, JENIFFER LANDICHO','JENIFFER','LANDICHO','NOVA','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS','14','ADMIN','35-0180213-1','515-534-794',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1997-04-06',0,0,0,NULL,NULL,'RESIGNED','','',0,0,'','1-15','',0,'SUNDAY','180252770117','121280428024','60','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,NULL,0,0,0,0,21.77,'bananaagapito9@gmail.com','09385926295',1,'Land Bank','Monthly','2022-06-21 03:33:10',0,'',0,0,0,0,0,0,0,0),(66,'66','NOVO, JUDYVIE EYANA','JUDYVIE','EYANA','NOVO','P-1 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','14','Information and Communication Technology (ICT)','35-0360016-6','387-595-668-000',NULL,'ONOR NOVO','P-1 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','09502884911','',NULL,NULL,0,NULL,'','1997-07-24',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','182517711005','121281392304','48kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'136',0,0,0,0,21.77,'dyviegoodemon@gmail.com','09485640812',1,'Land Bank','Monthly','2034-05-19 16:52:31',0,'',0,0,0,0,0,0,0,0),(67,'67','PACULBA, EMMALEN SALDIVAR','EMMALEN','SALDIVAR','PACULBA','P-2 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS','11','ACCOUNTING','08-1386096-1','746-301-383-000',NULL,'ERIC MARIO L. PACULBA','P-2 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1977-08-15',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY',NULL,'1211-5743-3370','55kgs','4\'9\"','Female',NULL,'Married',0,0,0,0,0,0,0,0,'3',0,'95',0,0,0,0,21.77,NULL,'09466995940',1,'Land Bank','Monthly','2022-05-13 05:32:30',0,'',0,0,0,0,0,0,0,0),(68,'68','PALTIQUERA, ROSLYN MABANAN','ROSLYN','MABANAN','PALTIQUERA','P-1 LLAMERA LIBJO, DINAGAT ISLANDS','16','Basic Education','08-29654226','755-254-584-000','O','JOCELYN M. PALTIQUERA','P-1 LLAMERA, LIBJO, DINAGAT ISLANDS','09187054011','',NULL,NULL,0,NULL,'','1998-06-23',0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY','18-050184589-0','121253351290','49klg','153cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'82',0,0,0,0,21.77,NULL,'0930784248',1,'Land Bank','Monthly','2034-05-19 16:56:22',0,'',0,0,0,0,0,0,0,0),(69,'69','PAREJA., THELMA POLANCOS','THELMA','POLANCOS','PAREJA.','P-4 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','33-5089286-8','760-527-402',NULL,'ROMAN ROSAL POLANCOS',NULL,NULL,'',NULL,NULL,0,NULL,'','1965-01-26',0,0,0,NULL,NULL,'REGULAR','','',0,13000,'','1-15','',0,'SUNDAY','18-050137337-9','121141486170','64','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'15',0,0,0,0,21.77,NULL,'09491652539',1,'Land Bank','Monthly','2034-05-19 16:57:55',0,'',0,0,0,0,0,0,0,0),(70,'70','PASQUIL, REX TEMPLATORA','REX','TEMPLATORA','PASQUIL','P-4 STA. CRUZ, SAN JOSE, DINAGAT ISLANDS','14','Hospitality and Tourism Management','08-2965595-3','714-673-117-000',NULL,'ENCARNACION T. PASQUIL',NULL,NULL,'',NULL,NULL,0,NULL,'','1997-05-29',0,0,0,NULL,NULL,'REGULAR','','',0,12000,'','1-15','',0,'SUNDAY',NULL,'121253453007','75klg','5\'8\'\'','Male',NULL,'Single',0,0,0,0,0,0,0,0,'9',0,'47',0,0,0,0,21.77,NULL,'09079524184',1,'Land Bank','Monthly','2034-05-19 17:00:09',0,'',0,0,0,0,0,0,0,0),(71,'71','RAMIREZ, EVELINDA PARADERO','EVELINDA','PARADERO','RAMIREZ','P-5 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','39','REGISTRAR','08-0938795-3','190-717617','B','EDGAR N. RAMIREZ','P-5 DON RUBEN, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1960-12-25',0,0,0,NULL,NULL,'REGULAR','','',0,18000,'','1-15','',0,'SUNDAY','18-050015991-8','1210-4937-3076','164 kls','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'4',0,'27',0,0,0,0,21.77,NULL,'09485319888',1,'Land Bank','Monthly','2022-05-13 06:02:09',0,'',0,0,0,0,0,0,0,0),(72,'72','SALARDA, CONIE PIODO','CONIE','PIODO','SALARDA','P-3 MAGSAYSAY, DINAGAT, DINAGAT ISLANDS','14','Teacher Education','0111-3518597-0','442-776-480-000','O','MR. DEXTER E. SALARDA',NULL,'09108067942','',NULL,NULL,0,NULL,'','1987-12-13',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','0302-5480-1379','1211-0245-0762','68kgs','5\'2\"','Female',NULL,'Married',0,0,0,0,0,0,0,0,'8',0,'151',0,0,0,0,21.77,NULL,'09096916503',1,'Land Bank','Monthly','2034-05-01 17:59:15',0,'',0,0,0,0,0,0,0,0),(73,'73','SAPID, ANALYN CAPILITAN','ANALYN','CAPILITAN','SAPID','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','39','Basic Education','08-1719383-8','467-874-178',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1983-11-16',0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY',NULL,'121141247589','43','4\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'8',0,0,0,0,21.77,NULL,'09305562038',1,'Land Bank','Monthly','2034-05-19 17:04:20',0,'',0,0,0,0,0,0,0,0),(74,'74','SAPID, MERNELITA CAPILITAN','MERNELITA','CAPILITAN','SAPID','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','08-2397051-1','467-085-758',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1986-05-27',0,0,0,NULL,NULL,'REGULAR','','',0,12500,'','1-15','',0,'SUNDAY','18-050137341-7','121141247590','43','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'6',0,0,0,0,21.77,NULL,'09126898787',1,'Land Bank','Monthly','2034-05-19 17:06:08',0,'',0,0,0,0,0,0,0,0),(75,'75','SAYSON, DELBERT ORTEGA','DELBERT','ORTEGA','SAYSON','P-1 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','16','Basic Education','08-2965531-9','004-388-541','A+','ALBERTO A. SAYSON','P-1 SAN JUAN, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1998-03-06',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18-050184588-2','121253291920','48.9 klg','5\'4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'102',0,0,0,0,21.77,NULL,'09501793392',1,'Land Bank','Monthly','2034-05-19 17:07:54',0,'',0,0,0,0,0,0,0,0),(76,'76','SIAREZ, JOEL LARIOSA','JOEL','LARIOSA','SIAREZ','P-5 JUSTINIANA EDERA, SAN JOSE, DINAGAT ISLANDS','10','Criminology','08-2651533-9','755-262-084','O','JOEL G. SIAREZ SR.',NULL,NULL,'',NULL,NULL,0,NULL,'','1991-11-04',0,0,0,NULL,NULL,'REGULAR','','',0,23000,'','1-15','',0,'SUNDAY',NULL,'121166013170','56klg','162cm','Male',NULL,'Single',0,0,0,0,0,0,0,0,'11',0,'19',0,0,0,0,21.77,NULL,'09129588841',1,'Land Bank','Monthly','2034-05-19 17:10:13',0,'',0,0,0,0,0,0,0,0),(77,'77','SILVANO, ELENA ABRATIGUIN','ELENA','ABRATIGUIN','SILVANO','P-6 POBLACION, SAN JOSE, DINAGAT ISLANDS','31','REGISTRAR','08-0548450-4','917-000-536','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1957-10-16',0,0,0,NULL,NULL,'REGULAR','','',0,24000,'','1-15','',0,'SUNDAY','18-050030526-4','121132950419','62','5\'4','Female',NULL,'Married',0,0,0,0,0,0,0,0,'4',0,'22',0,0,0,0,21.77,NULL,'09184166268',1,'Land Bank','Monthly','2034-05-19 17:11:52',0,'',0,0,0,0,0,0,0,0),(78,'78','SILVANO, KIRK JASON ABRATIGUIN','KIRK JASON','ABRATIGUIN','SILVANO','P-3 AURELIO, SAN JOSE, DINAGAT ISLANDS','38','REGISTRAR','08-1657974-1','470-204-458',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1984-03-16',0,0,0,NULL,NULL,'REGULAR','','',0,10000,'','1-15','',0,'SUNDAY',NULL,'121264435691',NULL,NULL,'Male',NULL,'Single',0,0,0,0,0,0,0,0,'4',0,'113',0,0,0,0,21.77,NULL,'09107980168',1,'Land Bank','Monthly','2034-05-19 17:13:51',0,'',0,0,0,0,0,0,0,0),(79,'79','SINAJON, CONCORDIA GANOHAY','CONCORDIA','GANOHAY','SINAJON','P-4 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','19','ADMIN',NULL,'509-227-655-000','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1959-01-01',0,0,0,NULL,NULL,'REGULAR','','',0,7000,'','1-15','',0,'SUNDAY',NULL,NULL,'48','5\'3','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'25',0,0,0,0,21.77,NULL,'09484851257',1,'Land Bank','Monthly','2022-05-13 05:47:52',0,'',0,0,0,0,0,0,0,0),(80,'80','TUBAT, ELESON MORATO','ELESON','MORATO','TUBAT','PLARIDEL, LIBJO, DINAGAT ISLANDS','38','REGISTRAR','35-1054964-7','399-547-959-00000',NULL,'GIBSON I TUBAT SR.','PLARIDEL, LIBJO, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-04-05',0,0,0,NULL,NULL,'PROBATIONARY','','',0,8000,'','1-15','',0,'SUNDAY','18-251197024-6','1212-8866-6742','63kgs','5\'6\"','Male',NULL,'Single',0,0,0,0,0,0,0,0,'4',0,'145',0,0,0,0,21.77,NULL,'09510398274',1,'Land Bank','Monthly','2022-07-11 07:15:40',0,'',0,0,0,0,0,0,0,0),(81,'81','URBUDA, ROBERT MARQUEZ','ROBERT','MARQUEZ','URBUDA','P-3 CAYETANO, DINAGAT, DINAGAT ISLANDS','12','Human Resource and Development','08-2651541-0','704-056-863-000','O','CLAIRE ANNE A. URBUDA','P-3 CAYETANO, DINAGAT, DINAGAT ISLANDS','09094140229','',NULL,NULL,0,NULL,'','1994-01-18',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','180501653142','1211-7224-9627','85','5\'7','Male',NULL,'Married',2,0,0,0,0,0,0,0,'5',0,'17',0,0,0,0,21.77,'roberturbuda18@gmail.com','09553484643',1,'Land Bank','Monthly','2022-06-21 02:50:22',0,'',0,0,0,0,0,0,0,0),(82,'82','VICENTE, JOHN MARK SERAD','JOHN MARK','SERAD','VICENTE','P-6 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','16','Technical Vocational','08-2791020-5','708-947-301','AB+','DOMINADOR G. VICENTE','P-6 JACQUEZ, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1995-10-17',0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY','08-025271366-0','121210471732','50','5\'4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'13',0,'89',0,0,0,0,21.77,NULL,'0927910205',1,'Land Bank','Monthly','2034-05-19 17:21:32',0,'',0,0,0,0,0,0,0,0),(83,'83','JELSON TEMPLA VILLEGAS','JELSON','TEMPLA','VILLEGAS','P-1 GEN.LUNA RITAGLENDA BASILISA','31','ADMIN','','','','','','','','','',0,NULL,'',NULL,0,0,0,NULL,NULL,'REGULAR','','',0,9000,'','1-15','',0,'SUNDAY','','','','','Male','','Single',0,0,0,0,0,0,0,0,'1',0,'112',0,0,0,0,0,'','',0,'Land Bank','Monthly',NULL,0,'',0,0,0,0,0,0,0,0),(84,'84','VIRTUDAZO, JOSHUA SALVE','JOSHUA','SALVE','VIRTUDAZO','P-2 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','08-2965401-9','732-423-172',NULL,'ANALIZA S. VIRTUDAZO','P-2 JACQUEZ SAN JOSE',NULL,'',NULL,NULL,0,NULL,'','1996-11-23',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','180501845939','121295525264','72','5\'8\'\'','Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'80',0,0,0,0,21.77,NULL,'09467189554',1,'Land Bank','Monthly','2034-05-19 17:20:01',0,'',0,0,0,0,0,0,0,0);

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
  `emp_id` int(11) NOT NULL DEFAULT '0',
  `evaluated_by` int(11) DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `evaluation_batch` */

/*Table structure for table `hr_dtr_calendar` */

DROP TABLE IF EXISTS `hr_dtr_calendar`;

CREATE TABLE `hr_dtr_calendar` (
  `datefield` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hr_dtr_calendar` */

insert  into `hr_dtr_calendar`(`datefield`) values ('2022-07-01'),('2022-07-02'),('2022-07-03'),('2022-07-04'),('2022-07-05'),('2022-07-06'),('2022-07-07'),('2022-07-08'),('2022-07-09'),('2022-07-10'),('2022-07-11'),('2022-07-12'),('2022-07-13'),('2022-07-14'),('2022-07-15'),('2022-07-16'),('2022-07-17'),('2022-07-18'),('2022-07-19'),('2022-07-20'),('2022-07-21'),('2022-07-22'),('2022-07-23'),('2022-07-24'),('2022-07-25'),('2022-07-26'),('2022-07-27'),('2022-07-28'),('2022-07-29'),('2022-07-30'),('2022-07-31');

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
  `late` double DEFAULT '0',
  `undertime` double DEFAULT '0',
  `total_hours_worked` double DEFAULT '8',
  `status` enum('0','1','2') DEFAULT '0' COMMENT '0-active 1-removed 2-normalized',
  `att_remarks` varchar(50) DEFAULT NULL,
  `note_am_in` varchar(100) DEFAULT NULL,
  `note_am_out` varchar(100) DEFAULT NULL,
  `note_pm_in` varchar(100) DEFAULT NULL,
  `note_pm_out` varchar(100) DEFAULT NULL,
  `OB_notes` varchar(100) DEFAULT '',
  `modify_user` varchar(100) DEFAULT NULL,
  `cost_center` int(11) DEFAULT '0',
  `sched_time_in` datetime DEFAULT NULL,
  `sched_time_out` datetime DEFAULT NULL,
  `att_type` varchar(255) DEFAULT 'regular',
  `holiday_type` varchar(255) DEFAULT 'N/A',
  `leave_type` varchar(255) DEFAULT 'N/A',
  `np_hours` double DEFAULT '0',
  `ot_hours` double DEFAULT '0',
  PRIMARY KEY (`employee_number`,`dtr_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hr_emp_attendance` */

insert  into `hr_emp_attendance`(`SysPK_emp_attendance`,`attendance_id`,`employee_number`,`employee_fullName`,`dtr_date`,`in_am`,`out_am`,`am_note`,`in_pm`,`out_pm`,`pm_note`,`late`,`undertime`,`total_hours_worked`,`status`,`att_remarks`,`note_am_in`,`note_am_out`,`note_pm_in`,`note_pm_out`,`OB_notes`,`modify_user`,`cost_center`,`sched_time_in`,`sched_time_out`,`att_type`,`holiday_type`,`leave_type`,`np_hours`,`ot_hours`) values ('214484352',0,'1','ABING, HACELJEN INCIPIDO','2022-06-01','2022-06-01 07:46:59','2022-06-01 12:03:15','','2022-06-01 12:41:36','2022-06-01 17:33:18','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('548013954',0,'1','ABING, HACELJEN INCIPIDO','2022-06-02','2022-06-02 07:42:56','2022-06-02 12:05:00','','2022-06-02 12:26:15','2022-06-02 17:05:51','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('94823094',0,'1','ABING, HACELJEN INCIPIDO','2022-06-03','2022-06-03 09:34:11','2022-06-03 12:03:20','','2022-06-03 12:22:21','2022-06-03 17:11:51','',1.5666666666666667,0,6.43,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('977360788',0,'1','ABING, HACELJEN INCIPIDO','2022-06-06','2022-06-06 07:47:44','2022-06-06 12:00:07','','2022-06-06 12:17:11','2022-06-06 17:04:25','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1346553441',0,'1','ABING, HACELJEN INCIPIDO','2022-06-07','2022-06-07 07:45:27','2022-06-07 12:00:40','','2022-06-07 12:10:40','2022-06-07 17:00:25','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('442135270',0,'1','ABING, HACELJEN INCIPIDO','2022-06-08','2022-06-08 07:59:31','2022-06-08 12:00:20','','2022-06-08 12:10:30','2022-06-08 17:32:49','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1687795481',0,'1','ABING, HACELJEN INCIPIDO','2022-06-09','2022-06-09 07:32:59','2022-06-09 12:10:42','','2022-06-09 12:35:16','2022-06-09 17:04:15','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('569055028',0,'1','ABING, HACELJEN INCIPIDO','2022-06-10','2022-06-10 07:41:06','2022-06-10 12:07:16','','2022-06-10 12:19:17','2022-06-10 17:13:42','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1944069421',0,'1','ABING, HACELJEN INCIPIDO','2022-06-13','2022-06-13 07:47:07','2022-06-13 12:00:19','','2022-06-13 12:12:45','2022-06-13 17:19:05','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('318934314',0,'1','ABING, HACELJEN INCIPIDO','2022-06-14','2022-06-14 07:44:54','2022-06-14 12:01:05','','2022-06-14 12:11:09','2022-06-14 17:27:17','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('846750749',0,'1','ABING, HACELJEN INCIPIDO','2022-06-15','2022-06-15 07:49:42','2022-06-15 12:21:23','','2022-06-15 12:32:27','2022-06-15 17:00:26','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1783040565',0,'1','ABING, HACELJEN INCIPIDO','2022-06-16','2022-06-16 07:58:43','2022-06-16 12:06:14','','2022-06-16 12:16:22','2022-06-16 21:33:20','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1104867890',0,'1','ABING, HACELJEN INCIPIDO','2022-06-17','2022-06-17 07:40:36','2022-06-17 12:10:21','','2022-06-17 12:22:47','2022-06-17 18:14:25','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('2143338462',0,'1','ABING, HACELJEN INCIPIDO','2022-06-20','2022-06-20 08:00:33','2022-06-20 12:30:24','','2022-06-20 12:41:40','2022-06-20 17:16:19','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1728910041',0,'1','ABING, HACELJEN INCIPIDO','2022-06-21','2022-06-21 08:11:56','2022-06-21 12:45:45','','2022-06-21 12:55:45','2022-06-21 17:07:48','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('331990720',0,'1','ABING, HACELJEN INCIPIDO','2022-06-22','2022-06-22 07:43:04','2022-06-22 12:24:11','','2022-06-22 12:51:17','2022-06-22 17:09:25','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1555787664',0,'1','ABING, HACELJEN INCIPIDO','2022-06-23','2022-06-23 07:58:00','2022-06-23 12:06:46','','2022-06-23 12:43:59','2022-06-23 19:00:51','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('2010858896',0,'1','ABING, HACELJEN INCIPIDO','2022-06-24','2022-06-24 07:56:27','2022-06-24 12:01:48','','2022-06-24 12:11:55','2022-06-24 17:40:07','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1565079036',0,'1','ABING, HACELJEN INCIPIDO','2022-06-27','2022-06-27 07:39:10','2022-06-27 12:08:11','','2022-06-27 12:25:04','2022-06-27 17:12:14','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1032604583',0,'1','ABING, HACELJEN INCIPIDO','2022-06-28','2022-06-28 07:50:05','2022-06-28 12:01:23','','2022-06-28 12:34:02','2022-06-28 17:02:57','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('2077421854',0,'1','ABING, HACELJEN INCIPIDO','2022-06-29','2022-06-29 08:00:30','2022-06-29 12:01:27','','2022-06-29 12:13:42','2022-06-29 18:25:53','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1140849893',0,'1','ABING, HACELJEN INCIPIDO','2022-06-30','2022-06-30 07:55:47','2022-06-30 12:28:43','','2022-06-30 12:47:35','2022-06-30 17:10:36','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('2081802229',0,'1','ABING, HACELJEN INCIPIDO','2022-07-18','2022-07-18 07:55:32','2022-07-18 12:03:04','','2022-07-18 12:26:29','2022-07-18 17:35:09','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2036178121',0,'1','ABING, HACELJEN INCIPIDO','2022-07-19','2022-07-19 07:42:49','2022-07-19 12:27:16','','2022-07-19 12:37:53','2022-07-19 17:00:47','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1762467107',0,'1','ABING, HACELJEN INCIPIDO','2022-07-20',NULL,'2022-07-20 12:00:34','','2022-07-20 12:34:15','2022-07-20 17:06:43','',0,0,4,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('141647091',0,'1','ABING, HACELJEN INCIPIDO','2022-07-21','2022-07-21 08:01:28','2022-07-21 12:07:18','','2022-07-21 12:52:14','2022-07-21 19:21:13','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('65816313',0,'1','ABING, HACELJEN INCIPIDO','2022-07-22','2022-07-22 08:03:16','2022-07-22 12:08:28','','2022-07-22 12:18:29','2022-07-22 17:28:10','',0.05,0,7.95,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1924531797',0,'1','ABING, HACELJEN INCIPIDO','2022-07-25','2022-07-25 07:40:08','2022-07-25 12:04:03','','2022-07-25 12:14:28','2022-07-25 17:41:08','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('35254200',0,'1','ABING, HACELJEN INCIPIDO','2022-07-26','2022-07-26 08:02:24',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1987202531',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-01','2022-06-01 07:57:26','2022-06-01 12:04:43','','2022-06-01 12:17:35','2022-06-01 17:19:02','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1335524887',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-02','2022-06-02 07:49:04','2022-06-02 12:06:45','','2022-06-02 12:35:47','2022-06-02 17:06:56','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1448262003',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-03','2022-06-03 07:55:59','2022-06-03 12:02:36','','2022-06-03 12:20:03','2022-06-03 17:05:52','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1507021845',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-06','2022-06-06 07:59:03','2022-06-06 12:03:08','','2022-06-06 12:14:46','2022-06-06 18:36:01','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1481711847',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-07','2022-06-07 07:46:46','2022-06-07 12:02:06','','2022-06-07 12:15:25','2022-06-07 18:36:18','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1376162904',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-08','2022-06-08 08:13:55','2022-06-08 12:04:00','','2022-06-08 12:21:28','2022-06-08 17:14:42','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1323636864',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-09','2022-06-09 08:07:56',NULL,'',NULL,'2022-06-09 17:13:14','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('956085428',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-10','2022-06-10 07:52:27',NULL,'','2022-06-10 13:12:51','2022-06-10 17:38:33','',0.2,0,3.8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('903099766',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-13','2022-06-13 07:46:53',NULL,'',NULL,'2022-06-13 17:36:21','',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1354430350',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-14','2022-06-14 08:11:42','2022-06-14 12:07:02','','2022-06-14 12:25:24','2022-06-14 17:26:51','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('714054151',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-15','2022-06-15 07:58:28','2022-06-15 12:09:55','','2022-06-15 12:20:55','2022-06-15 17:51:38','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('258606690',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-16','2022-06-16 07:35:37','2022-06-16 12:03:04','','2022-06-16 12:15:40','2022-06-16 18:15:24','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('979212697',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-17','2022-06-17 08:31:30','2022-06-17 12:03:54','','2022-06-17 12:19:20',NULL,'',0.5166666666666667,0,3.48,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1966391376',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-20','2022-06-20 07:55:05','2022-06-20 12:34:17','','2022-06-20 12:58:41','2022-06-20 17:27:08','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1143919387',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-21','2022-06-21 07:54:40','2022-06-21 12:06:44','','2022-06-21 12:44:57','2022-06-21 17:15:30','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1448976569',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-22',NULL,NULL,'','2022-06-22 12:50:34','2022-06-22 17:47:37','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1321492937',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-23','2022-06-23 07:49:51','2022-06-23 12:37:04','',NULL,NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('592522927',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-24','2022-06-24 07:57:26',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('624093037',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-27','2022-06-27 07:58:44','2022-06-27 12:04:27','','2022-06-27 12:24:57','2022-06-27 17:14:53','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('79486568',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-28','2022-06-28 08:07:20','2022-06-28 12:01:03','','2022-06-28 12:12:20','2022-06-28 17:11:24','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1497026664',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-29','2022-06-29 07:45:08','2022-06-29 12:22:49','','2022-06-29 12:34:38','2022-06-29 17:37:09','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('48995808',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-06-30','2022-06-30 08:13:21','2022-06-30 12:29:35','','2022-06-30 12:46:54','2022-06-30 17:06:27','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1683650136',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-07-18',NULL,NULL,'','2022-07-18 12:49:43','2022-07-18 17:16:31','',0,0,4,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('586872563',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-07-19','2022-07-19 08:33:09','2022-07-19 12:22:32','','2022-07-19 12:37:12','2022-07-19 17:07:13','',0.55,0,7.45,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('479530995',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-07-20','2022-07-20 08:38:13','2022-07-20 12:01:49','','2022-07-20 12:20:01','2022-07-20 17:28:19','',0.6333333333333333,0,7.37,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1712728932',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-07-21','2022-07-21 08:50:19','2022-07-21 12:03:58','','2022-07-21 12:33:39','2022-07-21 17:05:43','',0.8333333333333334,0,7.17,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('740930246',0,'10','BANUELOS, KHAREN GRACE MALALIS','2022-07-22','2022-07-22 08:13:46','2022-07-22 12:26:46','',NULL,NULL,'',0.21666666666666667,0,3.78,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1493942109',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-01','2022-06-01 08:06:18','2022-06-01 12:01:12','','2022-06-01 12:12:20','2022-06-01 17:00:25','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('910190189',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-02','2022-06-02 08:24:17','2022-06-02 12:01:45','','2022-06-02 13:23:08','2022-06-02 17:00:11','',0.7833333333333334,0,7.220000000000001,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('620546187',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-03','2022-06-03 08:08:01','2022-06-03 12:00:20','','2022-06-03 12:42:04','2022-06-03 17:00:04','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('146820856',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-06','2022-06-06 07:53:43','2022-06-06 12:01:59','','2022-06-06 13:35:45','2022-06-06 17:02:10','',0.5833333333333334,0,7.42,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('766805434',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-07','2022-06-07 08:26:07','2022-06-07 12:00:33','','2022-06-07 12:53:10',NULL,'',0.43333333333333335,0,3.57,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1576966235',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-08','2022-06-08 08:08:06','2022-06-08 12:00:14','','2022-06-08 12:54:26','2022-06-08 17:00:41','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('452768360',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-09','2022-06-09 08:16:40','2022-06-09 12:00:59','','2022-06-09 13:34:26','2022-06-09 17:00:19','',0.8333333333333333,0,7.16,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('843565338',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-10','2022-06-10 08:11:03','2022-06-10 12:00:36','','2022-06-10 13:18:32','2022-06-10 17:00:09','',0.4833333333333333,0,7.52,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('673312186',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-13','2022-06-13 08:06:33','2022-06-13 12:00:20','','2022-06-13 13:28:04','2022-06-13 17:00:01','',0.5666666666666667,0,7.43,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1265587873',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-14','2022-06-14 08:37:04','2022-06-14 12:01:17','','2022-06-14 13:16:52','2022-06-14 17:01:06','',0.8833333333333333,0,7.109999999999999,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('157020199',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-15','2022-06-15 08:23:24','2022-06-15 12:00:38','',NULL,'2022-06-15 17:00:48','',0.38333333333333336,0,3.62,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('2143389131',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-16','2022-06-16 08:30:49','2022-06-16 12:00:44','','2022-06-16 12:24:38','2022-06-16 17:00:32','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('804907801',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-20','2022-06-20 07:59:38','2022-06-20 12:00:14','','2022-06-20 13:17:18','2022-06-20 17:00:21','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('592373028',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-21','2022-06-21 08:18:45','2022-06-21 12:00:22','','2022-06-21 12:18:42','2022-06-21 17:01:02','',0.3,0,7.7,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1707252505',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-22','2022-06-22 08:07:41','2022-06-22 12:01:48','','2022-06-22 13:23:48','2022-06-22 17:02:05','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2141247072',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-23','2022-06-23 08:05:19','2022-06-23 12:00:20','','2022-06-23 13:11:52','2022-06-23 17:00:12','',0.26666666666666666,0,7.74,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1109321259',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-24','2022-06-24 08:10:31','2022-06-24 12:01:56','','2022-06-24 13:29:08','2022-06-24 17:01:06','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1360767457',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-27','2022-06-27 07:56:48','2022-06-27 12:13:29','','2022-06-27 12:54:14',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1778290437',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-28','2022-06-28 08:40:18','2022-06-28 12:00:49','','2022-06-28 12:27:53','2022-06-28 17:02:25','',0.6666666666666666,0,7.33,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('651396592',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-29','2022-06-29 07:49:45','2022-06-29 12:00:12','','2022-06-29 12:10:17',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('709815451',0,'11','BELINARIO, KEVIN LERTIDO','2022-06-30','2022-06-30 08:24:02','2022-06-30 12:00:11','','2022-06-30 13:21:46','2022-06-30 17:01:15','',0.75,0,7.25,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('923562200',0,'11','BELINARIO, KEVIN LERTIDO','2022-07-18','2022-07-18 08:14:31','2022-07-18 12:04:56','','2022-07-18 13:11:25','2022-07-18 17:04:55','',0.41666666666666663,0,7.59,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('877980933',0,'11','BELINARIO, KEVIN LERTIDO','2022-07-19','2022-07-19 08:27:15','2022-07-19 12:02:23','',NULL,'2022-07-19 17:04:07','',0.45,0,3.55,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1520237809',0,'11','BELINARIO, KEVIN LERTIDO','2022-07-20','2022-07-20 08:11:35','2022-07-20 12:02:20','','2022-07-20 12:43:06','2022-07-20 17:51:24','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('751002313',0,'11','BELINARIO, KEVIN LERTIDO','2022-07-21','2022-07-21 08:19:22','2022-07-21 12:00:01','','2022-07-21 13:14:38','2022-07-21 17:01:04','',0.55,0,7.45,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1623839425',0,'11','BELINARIO, KEVIN LERTIDO','2022-07-22','2022-07-22 08:20:52','2022-07-22 12:06:59','','2022-07-22 12:20:40','2022-07-22 17:01:14','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('657512452',0,'11','BELINARIO, KEVIN LERTIDO','2022-07-25','2022-07-25 08:00:39','2022-07-25 12:06:49','','2022-07-25 13:20:01','2022-07-25 17:02:19','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1067774220',0,'11','BELINARIO, KEVIN LERTIDO','2022-07-26','2022-07-26 08:16:33',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('651105309',0,'12','BERINO, DIANE BACOLOD','2022-06-01','2022-06-01 07:57:19','2022-06-01 12:47:46','','2022-06-01 13:04:34','2022-06-01 17:24:35','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1587598161',0,'12','BERINO, DIANE BACOLOD','2022-06-02','2022-06-02 07:45:34','2022-06-02 12:50:14','','2022-06-02 13:00:33','2022-06-02 17:14:14','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('2064529282',0,'12','BERINO, DIANE BACOLOD','2022-06-03','2022-06-03 08:23:18',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1027916669',0,'12','BERINO, DIANE BACOLOD','2022-06-06','2022-06-06 08:21:03','2022-06-06 12:47:02','','2022-06-06 12:58:24','2022-06-06 17:09:54','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('643861756',0,'12','BERINO, DIANE BACOLOD','2022-06-07','2022-06-07 07:52:17','2022-06-07 12:41:30','','2022-06-07 12:54:16','2022-06-07 17:47:20','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('859528121',0,'12','BERINO, DIANE BACOLOD','2022-06-08','2022-06-08 07:28:38','2022-06-08 12:36:36','','2022-06-08 12:57:05','2022-06-08 17:35:34','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('145450610',0,'12','BERINO, DIANE BACOLOD','2022-06-09','2022-06-09 07:51:27','2022-06-09 12:50:46','','2022-06-09 13:01:18','2022-06-09 17:02:40','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1917047235',0,'12','BERINO, DIANE BACOLOD','2022-06-10','2022-06-10 11:55:37',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('974445255',0,'12','BERINO, DIANE BACOLOD','2022-06-13','2022-06-13 09:15:43',NULL,'','2022-06-13 12:48:24','2022-06-13 17:15:05','',0,3.95,4.05,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1548773456',0,'12','BERINO, DIANE BACOLOD','2022-06-14','2022-06-14 08:00:30','2022-06-14 12:40:17','','2022-06-14 12:51:41','2022-06-14 17:08:22','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('132560817',0,'12','BERINO, DIANE BACOLOD','2022-06-15','2022-06-15 08:07:25',NULL,'',NULL,'2022-06-15 17:15:57','',0,0,0,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('529931283',0,'12','BERINO, DIANE BACOLOD','2022-06-16','2022-06-16 08:37:06',NULL,'','2022-06-16 13:17:02','2022-06-16 17:43:12','',0.2833333333333333,0,3.72,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1042980786',0,'12','BERINO, DIANE BACOLOD','2022-06-17','2022-06-17 08:06:24',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('7432607',0,'12','BERINO, DIANE BACOLOD','2022-06-20','2022-06-20 08:23:25','2022-06-20 12:41:19','','2022-06-20 12:54:39','2022-06-20 17:08:33','',0.38333333333333336,0,7.62,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1884692416',0,'12','BERINO, DIANE BACOLOD','2022-06-21','2022-06-21 08:01:05','2022-06-21 12:01:38','','2022-06-21 12:12:47','2022-06-21 17:10:59','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2007315338',0,'12','BERINO, DIANE BACOLOD','2022-06-22','2022-06-22 08:30:42','2022-06-22 12:07:25','','2022-06-22 12:21:12','2022-06-22 17:01:14','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1489181218',0,'12','BERINO, DIANE BACOLOD','2022-06-23','2022-06-23 08:01:15','2022-06-23 12:33:17','','2022-06-23 12:46:30','2022-06-23 17:00:54','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1302121618',0,'12','BERINO, DIANE BACOLOD','2022-06-28',NULL,NULL,'','2022-06-28 13:09:26','2022-06-28 17:10:52','',0.15,0,3.85,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1475240124',0,'12','BERINO, DIANE BACOLOD','2022-06-29',NULL,'2022-06-29 10:30:35','',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('24733704',0,'12','BERINO, DIANE BACOLOD','2022-06-30','2022-06-30 09:09:05','2022-06-30 12:10:07','','2022-06-30 12:26:23','2022-06-30 16:54:17','',1.15,0.08333333333333333,6.77,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('726896338',0,'12','BERINO, DIANE BACOLOD','2022-07-20','2022-07-20 08:47:20','2022-07-20 12:02:59','','2022-07-20 12:18:20','2022-07-20 17:24:00','',0.7833333333333333,0,7.220000000000001,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('987670306',0,'12','BERINO, DIANE BACOLOD','2022-07-21','2022-07-21 08:04:34',NULL,'',NULL,'2022-07-21 17:10:01','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1416328135',0,'12','BERINO, DIANE BACOLOD','2022-07-25','2022-07-25 08:04:24','2022-07-25 12:17:10','','2022-07-25 12:27:53','2022-07-25 17:24:17','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('938693633',0,'12','BERINO, DIANE BACOLOD','2022-07-26','2022-07-26 08:04:15',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1845010807',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-01','2022-06-01 06:44:19','2022-06-01 12:03:39','','2022-06-01 12:37:33','2022-06-01 17:08:25','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('191404042',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-02','2022-06-02 07:28:29','2022-06-02 12:06:40','','2022-06-02 12:20:26','2022-06-02 17:06:43','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('28110173',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-03','2022-06-03 07:17:37','2022-06-03 12:02:39','','2022-06-03 12:19:59','2022-06-03 17:05:43','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('525184972',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-06','2022-06-06 06:19:37','2022-06-06 12:02:49','','2022-06-06 12:15:54',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1196960359',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-07','2022-06-07 07:23:25',NULL,'',NULL,'2022-06-07 17:13:43','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('543800353',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-08','2022-06-08 07:43:33','2022-06-08 12:04:18','','2022-06-08 12:46:19','2022-06-08 17:12:19','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('113428058',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-09','2022-06-09 07:50:44','2022-06-09 12:01:19','','2022-06-09 12:18:53','2022-06-09 17:15:32','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1047905266',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-10','2022-06-10 07:46:13','2022-06-10 12:06:47','','2022-06-10 12:33:23','2022-06-10 17:39:05','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1875104535',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-13','2022-06-13 06:49:07','2022-06-13 12:00:40','','2022-06-13 12:20:43','2022-06-13 17:36:10','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('914301035',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-14','2022-06-14 07:39:33','2022-06-14 12:07:21','','2022-06-14 12:25:14','2022-06-14 17:26:46','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('748598544',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-15','2022-06-15 07:43:33','2022-06-15 12:09:36','','2022-06-15 12:20:50','2022-06-15 18:01:14','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1232586860',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-16','2022-06-16 06:17:00',NULL,'','2022-06-16 12:15:34','2022-06-16 18:27:52','',0,0,4,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('148066635',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-17','2022-06-17 08:03:24','2022-06-17 12:15:12','','2022-06-17 12:25:46',NULL,'',0.05,0,3.95,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1021323596',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-20','2022-06-20 06:31:18','2022-06-20 12:40:49','','2022-06-20 12:58:38','2022-06-20 17:18:17','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1426130113',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-21','2022-06-21 07:51:23','2022-06-21 12:01:26','','2022-06-21 12:45:05','2022-06-21 17:21:44','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('38951873',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-22','2022-06-22 08:09:04','2022-06-22 12:11:25','','2022-06-22 12:26:59','2022-06-22 17:25:33','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2091512689',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-23','2022-06-23 07:18:29','2022-06-23 12:01:53','','2022-06-23 12:12:02','2022-06-23 18:37:42','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('739941524',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-24','2022-06-24 07:06:03','2022-06-24 12:08:55','','2022-06-24 12:45:04','2022-06-24 17:46:11','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('242811131',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-27','2022-06-27 06:52:35','2022-06-27 12:04:33','','2022-06-27 12:24:45','2022-06-27 17:31:01','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1067346305',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-28','2022-06-28 07:34:45','2022-06-28 12:01:45','','2022-06-28 13:01:00','2022-06-28 17:41:50','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1312421025',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-29','2022-06-29 07:15:02',NULL,'','2022-06-29 12:34:34','2022-06-29 17:23:13','',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1687985594',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-06-30','2022-06-30 07:20:17','2022-06-30 12:29:30','','2022-06-30 12:46:52','2022-06-30 17:16:19','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1959172901',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-07-18','2022-07-18 07:40:54','2022-07-18 12:16:54','',NULL,'2022-07-18 17:47:12','',0,0,4,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1988932062',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-07-19','2022-07-19 07:12:31','2022-07-19 12:27:52','','2022-07-19 12:40:59','2022-07-19 17:10:48','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1485940534',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-07-20','2022-07-20 07:15:48',NULL,'',NULL,'2022-07-20 17:49:14','',0,0,0,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('551677295',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-07-21','2022-07-21 07:13:18','2022-07-21 12:04:04','','2022-07-21 12:33:35','2022-07-21 17:19:37','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1349343769',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-07-22','2022-07-22 07:19:51','2022-07-22 12:13:47','','2022-07-22 12:24:00','2022-07-22 17:35:36','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1449633448',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-07-25','2022-07-25 07:48:42','2022-07-25 12:36:07','',NULL,'2022-07-25 17:38:20','',0,0,4,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1005683328',0,'13','BERNADOS, JUNREY IGONG-IGONG','2022-07-26','2022-07-26 07:22:51',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('889053359',0,'14','BERTE, HAZEL RAMOS','2022-06-09','2022-06-09 08:21:35',NULL,'',NULL,'2022-06-09 17:21:09','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('117393241',0,'14','BERTE, HAZEL RAMOS','2022-06-10','2022-06-10 08:32:42','2022-06-10 12:05:07','',NULL,'2022-06-10 18:00:34','',0.5333333333333333,0,3.47,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1205461450',0,'14','BERTE, HAZEL RAMOS','2022-06-13','2022-06-13 08:18:38',NULL,'','2022-06-13 12:12:00','2022-06-13 18:11:04','',0,0,4,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1509159219',0,'14','BERTE, HAZEL RAMOS','2022-06-14',NULL,'2022-06-14 12:03:17','',NULL,'2022-06-14 18:01:23','',0,0,0,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1537312669',0,'14','BERTE, HAZEL RAMOS','2022-06-15','2022-06-15 08:28:33','2022-06-15 12:12:16','',NULL,'2022-06-15 17:27:53','',0.4666666666666667,0,3.53,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('2130411068',0,'14','BERTE, HAZEL RAMOS','2022-06-16','2022-06-16 08:09:18',NULL,'',NULL,'2022-06-16 17:38:49','',0,0,0,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1119770744',0,'14','BERTE, HAZEL RAMOS','2022-06-17',NULL,NULL,'',NULL,'2022-06-17 17:18:09','',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1511775414',0,'14','BERTE, HAZEL RAMOS','2022-06-20',NULL,'2022-06-20 12:02:57','',NULL,'2022-06-20 19:34:03','',0,0,0,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1536002604',0,'14','BERTE, HAZEL RAMOS','2022-06-23',NULL,NULL,'','2022-06-23 12:08:52','2022-06-23 21:45:28','',0,0,4,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('252679580',0,'14','BERTE, HAZEL RAMOS','2022-06-24',NULL,NULL,'',NULL,'2022-06-24 19:50:25','',0,0,0,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('568754835',0,'14','BERTE, HAZEL RAMOS','2022-06-27','2022-06-27 08:26:54','2022-06-27 12:04:20','',NULL,NULL,'',0.43333333333333335,0,3.57,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1697649349',0,'14','BERTE, HAZEL RAMOS','2022-07-18','2022-07-18 08:21:34',NULL,'',NULL,'2022-07-18 17:56:10','',0,0,0,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('889248221',0,'14','BERTE, HAZEL RAMOS','2022-07-21','2022-07-21 08:35:58',NULL,'',NULL,'2022-07-21 17:25:00','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('974400004',0,'14','BERTE, HAZEL RAMOS','2022-07-22','2022-07-22 08:35:52',NULL,'',NULL,'2022-07-22 18:03:19','',0,0,0,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1459572968',0,'14','BERTE, HAZEL RAMOS','2022-07-25',NULL,NULL,'',NULL,'2022-07-25 17:44:21','',0,0,0,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1543030871',0,'14','BERTE, HAZEL RAMOS','2022-07-26','2022-07-26 08:13:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1210600363',0,'15','BLANCO, JASMEN OCAY','2022-06-01','2022-06-01 07:49:49','2022-06-01 12:07:09','','2022-06-01 12:46:36','2022-06-01 17:05:33','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('182728550',0,'15','BLANCO, JASMEN OCAY','2022-06-02','2022-06-02 07:37:47','2022-06-02 12:04:06','','2022-06-02 12:26:31','2022-06-02 17:05:44','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('372696083',0,'15','BLANCO, JASMEN OCAY','2022-06-03','2022-06-03 07:33:56','2022-06-03 12:08:41','','2022-06-03 12:20:20','2022-06-03 17:02:36','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1473716940',0,'15','BLANCO, JASMEN OCAY','2022-06-06','2022-06-06 07:39:01',NULL,'',NULL,'2022-06-06 17:03:21','',0,0,0,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('2122066928',0,'15','BLANCO, JASMEN OCAY','2022-06-07','2022-06-07 07:56:58',NULL,'',NULL,'2022-06-07 17:00:32','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('949347632',0,'15','BLANCO, JASMEN OCAY','2022-06-08','2022-06-08 07:46:44','2022-06-08 12:15:54','','2022-06-08 12:30:48','2022-06-08 17:06:57','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1888301201',0,'15','BLANCO, JASMEN OCAY','2022-06-09','2022-06-09 07:40:03','2022-06-09 12:10:37','','2022-06-09 12:35:38','2022-06-09 17:02:45','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1919922309',0,'15','BLANCO, JASMEN OCAY','2022-06-10','2022-06-10 07:42:53','2022-06-10 12:08:51','','2022-06-10 12:22:36','2022-06-10 17:01:31','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1508714467',0,'15','BLANCO, JASMEN OCAY','2022-06-13','2022-06-13 07:36:25','2022-06-13 12:00:25','','2022-06-13 12:11:08','2022-06-13 17:20:05','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('444320965',0,'15','BLANCO, JASMEN OCAY','2022-06-14','2022-06-14 07:55:00','2022-06-14 12:07:31','','2022-06-14 12:17:42','2022-06-14 17:03:17','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('346328045',0,'15','BLANCO, JASMEN OCAY','2022-06-15','2022-06-15 07:38:41','2022-06-15 12:26:34','','2022-06-15 12:41:14','2022-06-15 17:47:25','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1481977536',0,'15','BLANCO, JASMEN OCAY','2022-06-16','2022-06-16 07:50:35','2022-06-16 12:06:28','','2022-06-16 12:46:25','2022-06-16 18:55:58','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('2100992872',0,'15','BLANCO, JASMEN OCAY','2022-06-17','2022-06-17 07:46:31','2022-06-17 12:12:50','','2022-06-17 12:24:29','2022-06-17 17:56:39','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('517277158',0,'15','BLANCO, JASMEN OCAY','2022-06-20','2022-06-20 07:33:21','2022-06-20 12:13:01','','2022-06-20 12:24:51','2022-06-20 17:07:24','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1754536703',0,'15','BLANCO, JASMEN OCAY','2022-06-21','2022-06-21 07:44:52','2022-06-21 12:01:17','','2022-06-21 12:23:02','2022-06-21 17:21:29','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1311170588',0,'15','BLANCO, JASMEN OCAY','2022-06-22','2022-06-22 07:37:42','2022-06-22 12:09:26','','2022-06-22 12:33:48','2022-06-22 17:25:38','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1590496674',0,'15','BLANCO, JASMEN OCAY','2022-06-23','2022-06-23 07:48:12','2022-06-23 12:03:25','','2022-06-23 12:16:47','2022-06-23 17:35:24','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('110038036',0,'15','BLANCO, JASMEN OCAY','2022-06-24','2022-06-24 07:51:29','2022-06-24 12:02:25','','2022-06-24 12:19:20','2022-06-24 17:18:39','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('260590144',0,'15','BLANCO, JASMEN OCAY','2022-06-27','2022-06-27 07:42:02','2022-06-27 12:03:39','','2022-06-27 12:25:23','2022-06-27 18:34:13','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('40173379',0,'15','BLANCO, JASMEN OCAY','2022-06-28','2022-06-28 07:46:35','2022-06-28 12:03:54','','2022-06-28 12:34:43','2022-06-28 17:01:22','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('597925593',0,'15','BLANCO, JASMEN OCAY','2022-06-29','2022-06-29 07:47:00','2022-06-29 12:01:44','','2022-06-29 12:13:30','2022-06-29 18:26:09','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1284095608',0,'15','BLANCO, JASMEN OCAY','2022-06-30','2022-06-30 07:52:50','2022-06-30 12:14:04','','2022-06-30 12:24:21','2022-06-30 17:10:43','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('99851472',0,'15','BLANCO, JASMEN OCAY','2022-07-18','2022-07-18 07:39:53','2022-07-18 12:19:27','','2022-07-18 12:30:46','2022-07-18 17:06:31','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1406040401',0,'15','BLANCO, JASMEN OCAY','2022-07-19','2022-07-19 07:43:29','2022-07-19 12:20:46','','2022-07-19 12:32:03','2022-07-19 17:04:53','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1634071442',0,'15','BLANCO, JASMEN OCAY','2022-07-20','2022-07-20 07:44:47','2022-07-20 12:10:17','','2022-07-20 12:20:48','2022-07-20 17:29:09','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('86579018',0,'15','BLANCO, JASMEN OCAY','2022-07-21','2022-07-21 07:48:03','2022-07-21 12:00:45','','2022-07-21 12:22:47','2022-07-21 17:02:49','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('348335884',0,'15','BLANCO, JASMEN OCAY','2022-07-22','2022-07-22 07:50:07','2022-07-22 12:03:40','','2022-07-22 12:19:18',NULL,'',0,0,4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1702456999',0,'15','BLANCO, JASMEN OCAY','2022-07-25','2022-07-25 08:05:19','2022-07-25 12:20:38','','2022-07-25 12:31:43','2022-07-25 17:27:39','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1750525580',0,'15','BLANCO, JASMEN OCAY','2022-07-26','2022-07-26 07:44:24',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1140456812',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-01','2022-06-01 08:32:22','2022-06-01 12:12:15','','2022-06-01 12:43:52','2022-06-01 17:02:57','',0.5333333333333333,0,7.470000000000001,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1430009004',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-02','2022-06-02 08:12:08','2022-06-02 12:06:23','','2022-06-02 12:23:13','2022-06-02 17:15:23','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('58130305',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-03','2022-06-03 08:03:01','2022-06-03 12:03:14','','2022-06-03 12:22:14','2022-06-03 19:53:14','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1636724666',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-08','2022-06-08 09:03:27','2022-06-08 12:32:59','','2022-06-08 12:51:59','2022-06-08 19:03:13','',1.05,0,6.95,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1301774471',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-09','2022-06-09 08:02:44','2022-06-09 12:29:16','','2022-06-09 12:48:15','2022-06-09 17:30:39','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1260938943',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-10','2022-06-10 08:01:28','2022-06-10 12:10:24','','2022-06-10 12:41:05','2022-06-10 17:37:41','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1027941200',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-13','2022-06-13 08:00:23','2022-06-13 12:05:00','','2022-06-13 12:23:52','2022-06-13 17:14:56','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1047455215',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-14','2022-06-14 07:58:12','2022-06-14 12:09:19','','2022-06-14 12:27:40','2022-06-14 17:37:09','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1345962945',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-15','2022-06-15 08:06:06','2022-06-15 12:22:08','','2022-06-15 12:32:43','2022-06-15 17:01:03','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1357644261',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-16','2022-06-16 08:04:16','2022-06-16 12:07:44','','2022-06-16 12:30:02','2022-06-16 21:34:02','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('668836978',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-17','2022-06-17 08:12:20','2022-06-17 12:13:07','','2022-06-17 12:24:15','2022-06-17 19:28:12','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('396559786',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-20','2022-06-20 08:29:49','2022-06-20 12:30:19','','2022-06-20 12:41:34','2022-06-20 17:16:24','',0.48333333333333334,0,7.52,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('382661861',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-21','2022-06-21 08:06:29','2022-06-21 12:45:42','','2022-06-21 12:55:42','2022-06-21 17:45:21','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('319183785',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-22','2022-06-22 08:06:01','2022-06-22 12:24:16','','2022-06-22 12:52:56','2022-06-22 17:09:16','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1653062890',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-23','2022-06-23 08:02:15','2022-06-23 12:17:04','','2022-06-23 12:28:20','2022-06-23 17:43:09','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('797306676',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-24','2022-06-24 08:19:13','2022-06-24 12:09:30','','2022-06-24 12:22:05','2022-06-24 19:43:31','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1451987771',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-27','2022-06-27 08:05:08','2022-06-27 12:07:43','','2022-06-27 12:38:32','2022-06-27 18:09:35','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1791184021',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-28','2022-06-28 08:19:16','2022-06-28 12:02:13','','2022-06-28 12:34:51','2022-06-28 17:52:04','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('503051926',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-29','2022-06-29 08:12:57','2022-06-29 12:01:22','','2022-06-29 12:13:54','2022-06-29 20:36:25','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('2095745737',0,'16','BOHOL, CHANRAH MAE OCA','2022-06-30','2022-06-30 08:05:00','2022-06-30 12:28:33','','2022-06-30 12:47:30','2022-06-30 18:40:03','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1970842043',0,'16','BOHOL, CHANRAH MAE OCA','2022-07-18','2022-07-18 08:39:31','2022-07-18 12:03:16','','2022-07-18 12:26:35','2022-07-18 17:40:21','',0.65,0,7.35,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2010739756',0,'16','BOHOL, CHANRAH MAE OCA','2022-07-19','2022-07-19 08:19:52','2022-07-19 12:30:02','','2022-07-19 12:42:11','2022-07-19 17:08:36','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1246048596',0,'16','BOHOL, CHANRAH MAE OCA','2022-07-20','2022-07-20 08:49:52','2022-07-20 12:03:20','','2022-07-20 12:36:01','2022-07-20 19:32:25','',0.8166666666666667,0,7.18,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1155692161',0,'16','BOHOL, CHANRAH MAE OCA','2022-07-21',NULL,'2022-07-21 12:07:21','',NULL,'2022-07-21 20:07:23','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1042779299',0,'16','BOHOL, CHANRAH MAE OCA','2022-07-22',NULL,NULL,'','2022-07-22 12:13:30','2022-07-22 18:37:19','',0,0,4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('459429317',0,'16','BOHOL, CHANRAH MAE OCA','2022-07-25',NULL,NULL,'','2022-07-25 12:05:04','2022-07-25 19:42:25','',0,0,4,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('116004600',0,'16','BOHOL, CHANRAH MAE OCA','2022-07-26','2022-07-26 08:09:42',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1635957693',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-01','2022-06-01 08:19:41','2022-06-01 12:06:41','','2022-06-01 12:47:56','2022-06-01 17:13:51','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('916670635',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-02','2022-06-02 07:50:02','2022-06-02 12:02:23','','2022-06-02 12:12:25','2022-06-02 17:07:29','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('359476530',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-03','2022-06-03 07:56:37','2022-06-03 12:04:39','','2022-06-03 12:59:17','2022-06-03 17:33:28','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('685010318',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-06','2022-06-06 08:14:25','2022-06-06 12:04:01','','2022-06-06 12:14:26','2022-06-06 17:37:24','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1275287051',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-07',NULL,'2022-06-07 12:12:26','','2022-06-07 13:12:20',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1528805300',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-08','2022-06-08 07:58:03','2022-06-08 12:40:31','','2022-06-08 12:51:47','2022-06-08 17:12:23','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('643108033',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-09','2022-06-09 08:09:31','2022-06-09 12:06:00','','2022-06-09 13:04:35','2022-06-09 17:11:05','',0.21666666666666667,0,7.78,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1563937900',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-10','2022-06-10 08:15:14','2022-06-10 12:00:09','','2022-06-10 12:33:39','2022-06-10 17:26:35','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1567086190',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-13','2022-06-13 08:19:01','2022-06-13 12:02:25','','2022-06-13 12:56:33','2022-06-13 17:05:18','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1175803929',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-14','2022-06-14 08:21:50','2022-06-14 12:06:44','','2022-06-14 13:03:08','2022-06-14 17:14:35','',0.39999999999999997,0,7.6,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1185054377',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-15','2022-06-15 07:42:19','2022-06-15 12:05:37','','2022-06-15 12:59:01','2022-06-15 17:24:31','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('320331189',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-16','2022-06-16 07:47:48','2022-06-16 12:00:21','','2022-06-16 12:54:36','2022-06-16 17:14:10','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('504995966',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-17','2022-06-17 08:04:38','2022-06-17 12:01:47','','2022-06-17 12:54:06','2022-06-17 17:05:54','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1757051052',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-20','2022-06-20 08:23:31','2022-06-20 12:04:20','','2022-06-20 12:58:30','2022-06-20 17:24:07','',0.38333333333333336,0,7.62,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('269375904',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-21','2022-06-21 07:53:23','2022-06-21 12:05:33','',NULL,'2022-06-21 17:49:14','',0,0,4,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1420886050',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-22','2022-06-22 08:20:24','2022-06-22 12:04:14','','2022-06-22 12:57:44','2022-06-22 17:34:15','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1704061927',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-23','2022-06-23 08:11:13','2022-06-23 12:00:11','','2022-06-23 12:59:28','2022-06-23 18:10:30','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1322734436',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-24','2022-06-24 08:10:13','2022-06-24 12:10:14','','2022-06-24 13:02:08','2022-06-24 17:19:14','',0.19999999999999998,0,7.800000000000001,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('276725823',0,'19','BUSANO, MARYLAND ESNARDO','2022-06-28','2022-06-28 08:28:51','2022-06-28 12:02:51','','2022-06-28 12:49:13','2022-06-28 17:16:30','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1718386462',0,'19','BUSANO, MARYLAND ESNARDO','2022-07-18','2022-07-18 08:08:18','2022-07-18 12:00:33','','2022-07-18 12:49:18','2022-07-18 17:09:28','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1046626005',0,'19','BUSANO, MARYLAND ESNARDO','2022-07-19','2022-07-19 08:00:34','2022-07-19 12:04:22','','2022-07-19 12:52:51','2022-07-19 17:13:24','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1975946211',0,'19','BUSANO, MARYLAND ESNARDO','2022-07-20','2022-07-20 07:26:52','2022-07-20 12:50:30','','2022-07-20 13:00:47','2022-07-20 17:06:23','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1354010043',0,'19','BUSANO, MARYLAND ESNARDO','2022-07-21','2022-07-21 08:11:36','2022-07-21 12:05:11','','2022-07-21 12:18:02','2022-07-21 17:03:57','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('166544689',0,'19','BUSANO, MARYLAND ESNARDO','2022-07-22','2022-07-22 07:54:59','2022-07-22 12:03:16','','2022-07-22 12:13:35',NULL,'',0,0,4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1936636355',0,'19','BUSANO, MARYLAND ESNARDO','2022-07-25','2022-07-25 08:25:38','2022-07-25 12:01:25','','2022-07-25 12:59:54','2022-07-25 17:05:06','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1096075392',0,'19','BUSANO, MARYLAND ESNARDO','2022-07-26','2022-07-26 08:00:19',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('2125379871',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-01','2022-06-01 08:25:28','2022-06-01 12:00:33','','2022-06-01 12:59:40','2022-06-01 17:50:20','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1821831827',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-02','2022-06-02 08:19:18','2022-06-02 12:05:58','','2022-06-02 13:03:30','2022-06-02 18:03:17','',0.36666666666666664,0,7.630000000000001,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('388073897',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-03','2022-06-03 08:25:15','2022-06-03 12:03:27','','2022-06-03 12:58:37','2022-06-03 19:53:25','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1518350079',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-06','2022-06-06 08:05:51','2022-06-06 12:05:49','','2022-06-06 13:04:01','2022-06-06 19:08:48','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1749806844',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-07','2022-06-07 08:29:46','2022-06-07 12:03:37','','2022-06-07 13:04:55','2022-06-07 19:29:19','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('752024049',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-08','2022-06-08 08:09:41','2022-06-08 12:21:35','','2022-06-08 13:03:19',NULL,'',0.15,0,3.85,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('498157478',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-09','2022-06-09 05:19:09',NULL,'',NULL,'2022-06-09 17:43:12','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('667697942',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-10','2022-06-10 08:33:07','2022-06-10 12:17:37','',NULL,'2022-06-10 17:37:30','',0.55,0,3.45,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1978548511',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-13','2022-06-13 08:27:12',NULL,'',NULL,'2022-06-13 17:38:48','',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1871145167',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-14','2022-06-14 08:33:25','2022-06-14 12:24:33','','2022-06-14 13:00:16','2022-06-14 17:27:02','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('649942863',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-15','2022-06-15 08:30:06','2022-06-15 12:02:34','','2022-06-15 12:56:37','2022-06-15 17:56:01','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1965257845',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-16','2022-06-16 08:08:36','2022-06-16 12:07:08','','2022-06-16 12:21:57','2022-06-16 21:37:55','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('826111985',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-17','2022-06-17 08:31:25','2022-06-17 12:13:30','','2022-06-17 13:01:21','2022-06-17 19:25:48','',0.5333333333333334,0,7.46,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('479141874',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-20','2022-06-20 08:00:31','2022-06-20 12:01:05','','2022-06-20 12:50:57','2022-06-20 18:24:48','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('107488841',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-21','2022-06-21 08:22:34','2022-06-21 12:07:06','','2022-06-21 13:08:10','2022-06-21 18:56:09','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('801480137',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-22','2022-06-22 08:28:33','2022-06-22 12:12:12','','2022-06-22 12:32:25',NULL,'',0.4666666666666667,0,3.53,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('359317068',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-23','2022-06-23 08:24:32','2022-06-23 12:04:26','','2022-06-23 12:23:50','2022-06-23 17:43:12','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1745493053',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-24','2022-06-24 08:33:14','2022-06-24 12:04:45','','2022-06-24 12:49:19','2022-06-24 19:43:38','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('694740546',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-27','2022-06-27 08:19:32','2022-06-27 12:03:20','','2022-06-27 13:05:38','2022-06-27 18:11:22','',0.39999999999999997,0,7.6,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1288523322',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-28','2022-06-28 08:55:06','2022-06-28 12:11:29','','2022-06-28 13:00:17','2022-06-28 17:52:13','',0.9166666666666666,0,7.08,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('983580256',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-29',NULL,NULL,'','2022-06-29 12:55:11','2022-06-29 23:59:31','',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1921769710',0,'2','AGOCOY, MONALIZA PESTANO','2022-06-30','2022-06-30 08:22:42','2022-06-30 12:10:37','','2022-06-30 12:29:41','2022-06-30 19:37:58','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('61574635',0,'2','AGOCOY, MONALIZA PESTANO','2022-07-18','2022-07-18 08:16:33',NULL,'','2022-07-18 13:03:28','2022-07-18 17:40:48','',0.05,0,3.95,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('450921736',0,'2','AGOCOY, MONALIZA PESTANO','2022-07-19','2022-07-19 08:35:01','2022-07-19 12:06:29','','2022-07-19 12:54:10','2022-07-19 17:19:22','',0.5833333333333334,0,7.42,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1101761097',0,'2','AGOCOY, MONALIZA PESTANO','2022-07-20','2022-07-20 08:30:24','2022-07-20 12:07:11','','2022-07-20 12:37:25','2022-07-20 19:32:31','',0.5,0,7.5,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('2122544989',0,'2','AGOCOY, MONALIZA PESTANO','2022-07-21','2022-07-21 08:22:00','2022-07-21 12:04:16','','2022-07-21 13:11:56','2022-07-21 20:07:29','',0.5499999999999999,0,7.449999999999999,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1147568007',0,'2','AGOCOY, MONALIZA PESTANO','2022-07-22','2022-07-22 08:32:13','2022-07-22 12:07:57','','2022-07-22 13:08:33','2022-07-22 18:37:13','',0.6666666666666666,0,7.34,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1230120438',0,'2','AGOCOY, MONALIZA PESTANO','2022-07-25','2022-07-25 08:20:42','2022-07-25 12:05:21','','2022-07-25 13:03:47','2022-07-25 20:15:22','',0.3833333333333333,0,7.62,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('2109975130',0,'20','CABITANA, BERLYN TABAMO','2022-06-01','2022-06-01 07:01:14','2022-06-01 12:03:11','','2022-06-01 12:51:55','2022-06-01 17:25:56','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1894516757',0,'20','CABITANA, BERLYN TABAMO','2022-06-02','2022-06-02 07:21:17','2022-06-02 12:16:20','','2022-06-02 12:49:28','2022-06-02 21:18:46','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('370938914',0,'20','CABITANA, BERLYN TABAMO','2022-06-03','2022-06-03 07:34:31','2022-06-03 12:05:47','','2022-06-03 12:38:04','2022-06-03 17:43:38','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1887692033',0,'20','CABITANA, BERLYN TABAMO','2022-06-04','2022-06-04 08:14:00',NULL,'',NULL,'2022-06-04 20:06:44','',0,0,0,'0','','','','','','','',0,'2022-06-04 08:00:00','2022-06-04 17:00:00','regular','N/A','N/A',0,0),('1947636375',0,'20','CABITANA, BERLYN TABAMO','2022-06-06',NULL,NULL,'','2022-06-06 17:30:57','2022-06-06 20:52:59','',4.5,0,-0.5,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('40177779',0,'20','CABITANA, BERLYN TABAMO','2022-06-07',NULL,NULL,'','2022-06-07 12:24:37','2022-06-07 18:58:26','',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('900023833',0,'20','CABITANA, BERLYN TABAMO','2022-06-08','2022-06-08 07:06:23','2022-06-08 12:32:53','','2022-06-08 12:50:49','2022-06-08 21:14:23','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1201129548',0,'20','CABITANA, BERLYN TABAMO','2022-06-09','2022-06-09 07:08:40','2022-06-09 12:05:16','','2022-06-09 12:47:55','2022-06-09 17:25:23','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('716470397',0,'20','CABITANA, BERLYN TABAMO','2022-06-10','2022-06-10 07:02:36','2022-06-10 12:06:58','','2022-06-10 12:47:50','2022-06-10 17:14:28','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('234569586',0,'20','CABITANA, BERLYN TABAMO','2022-06-13','2022-06-13 07:07:44','2022-06-13 12:01:28','','2022-06-13 12:22:59','2022-06-13 17:06:43','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1885556074',0,'20','CABITANA, BERLYN TABAMO','2022-06-14','2022-06-14 08:06:46','2022-06-14 12:01:57','','2022-06-14 12:36:25','2022-06-14 17:08:48','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1716902221',0,'20','CABITANA, BERLYN TABAMO','2022-06-15','2022-06-15 07:00:55','2022-06-15 12:06:29','','2022-06-15 12:18:46','2022-06-15 17:08:36','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1096449786',0,'20','CABITANA, BERLYN TABAMO','2022-06-16','2022-06-16 07:09:36','2022-06-16 12:04:08','','2022-06-16 12:18:05','2022-06-16 18:00:23','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1051773906',0,'20','CABITANA, BERLYN TABAMO','2022-06-17','2022-06-17 07:20:08','2022-06-17 12:03:35','','2022-06-17 12:59:16','2022-06-17 17:06:56','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('776303975',0,'20','CABITANA, BERLYN TABAMO','2022-06-21','2022-06-21 08:41:42','2022-06-21 12:03:38','','2022-06-21 12:26:54','2022-06-21 17:22:01','',0.6833333333333333,0,7.32,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1557370035',0,'20','CABITANA, BERLYN TABAMO','2022-06-22','2022-06-22 08:00:43','2022-06-22 12:06:21','','2022-06-22 12:18:39','2022-06-22 20:14:16','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('516025063',0,'20','CABITANA, BERLYN TABAMO','2022-06-23','2022-06-23 07:38:15','2022-06-23 12:05:11','','2022-06-23 12:19:23','2022-06-23 19:20:44','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1776217455',0,'20','CABITANA, BERLYN TABAMO','2022-06-24','2022-06-24 05:45:06','2022-06-24 12:05:20','','2022-06-24 12:18:09','2022-06-24 22:28:10','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('110091733',0,'20','CABITANA, BERLYN TABAMO','2022-06-25',NULL,NULL,'','2022-06-25 13:04:32','2022-06-25 18:23:26','',0.06666666666666667,0,3.93,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('976520751',0,'20','CABITANA, BERLYN TABAMO','2022-06-26','2022-06-26 06:56:39',NULL,'',NULL,'2022-06-26 17:27:45','',0,0,0,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('183564990',0,'20','CABITANA, BERLYN TABAMO','2022-06-27','2022-06-27 07:08:40','2022-06-27 12:20:33','',NULL,'2022-06-27 20:33:33','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('182893193',0,'20','CABITANA, BERLYN TABAMO','2022-06-28','2022-06-28 07:40:29','2022-06-28 12:13:43','','2022-06-28 12:34:38','2022-06-28 17:27:50','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1988703754',0,'20','CABITANA, BERLYN TABAMO','2022-06-29','2022-06-29 05:36:13','2022-06-29 12:36:57','','2022-06-29 12:49:04','2022-06-29 19:45:38','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1600384966',0,'20','CABITANA, BERLYN TABAMO','2022-06-30','2022-06-30 06:27:40','2022-06-30 12:03:09','','2022-06-30 12:21:06','2022-06-30 17:31:17','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1000124560',0,'20','CABITANA, BERLYN TABAMO','2022-07-18','2022-07-18 11:06:03',NULL,'',NULL,'2022-07-18 17:01:26','',0,0,0,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('272215126',0,'20','CABITANA, BERLYN TABAMO','2022-07-19','2022-07-19 07:37:38','2022-07-19 12:04:13','','2022-07-19 12:25:06','2022-07-19 17:16:31','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('625589587',0,'20','CABITANA, BERLYN TABAMO','2022-07-20','2022-07-20 07:30:35','2022-07-20 12:00:16','','2022-07-20 12:18:42','2022-07-20 19:38:06','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('49695015',0,'20','CABITANA, BERLYN TABAMO','2022-07-21','2022-07-21 07:09:55','2022-07-21 12:00:20','','2022-07-21 12:18:08','2022-07-21 17:08:35','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('64792933',0,'20','CABITANA, BERLYN TABAMO','2022-07-22','2022-07-22 07:11:32','2022-07-22 12:06:34','','2022-07-22 12:29:04','2022-07-22 18:13:07','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('732654703',0,'20','CABITANA, BERLYN TABAMO','2022-07-23','2022-07-23 06:42:16',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-23 08:00:00','2022-07-23 17:00:00','regular','N/A','N/A',0,0),('344423218',0,'20','CABITANA, BERLYN TABAMO','2022-07-25','2022-07-25 09:00:41','2022-07-25 12:03:22','','2022-07-25 12:21:38','2022-07-25 18:18:32','',1,0,7,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('251714605',0,'20','CABITANA, BERLYN TABAMO','2022-07-26','2022-07-26 07:22:16',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('968885707',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-01','2022-06-01 07:53:57','2022-06-01 12:06:32','','2022-06-01 12:17:04','2022-06-01 17:07:41','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('616410237',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-02','2022-06-02 07:54:12','2022-06-02 12:00:12','','2022-06-02 12:11:17','2022-06-02 17:19:27','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1835091708',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-03','2022-06-03 08:17:15','2022-06-03 12:04:34','','2022-06-03 12:15:14','2022-06-03 17:11:00','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1846721317',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-06','2022-06-06 07:42:26','2022-06-06 12:04:42','','2022-06-06 12:16:22','2022-06-06 17:12:26','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1390663446',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-07','2022-06-07 07:56:49','2022-06-07 12:00:46','','2022-06-07 12:11:13','2022-06-07 17:07:27','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('974924898',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-08','2022-06-08 07:58:34','2022-06-08 12:07:51','','2022-06-08 12:22:04','2022-06-08 17:05:03','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1268101379',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-09','2022-06-09 07:36:18','2022-06-09 12:00:37','','2022-06-09 12:12:21','2022-06-09 17:06:55','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('2050778299',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-10','2022-06-10 07:50:50',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('856418221',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-13','2022-06-13 07:33:25','2022-06-13 12:01:42','','2022-06-13 12:12:43','2022-06-13 17:03:18','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1521022329',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-14','2022-06-14 07:55:35','2022-06-14 12:00:45','','2022-06-14 12:12:21','2022-06-14 17:04:58','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1564431224',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-15','2022-06-15 07:32:32','2022-06-15 12:00:36','','2022-06-15 12:11:47','2022-06-15 17:09:30','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('332956247',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-16','2022-06-16 07:47:44','2022-06-16 12:03:40','','2022-06-16 12:47:59','2022-06-16 17:15:51','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('2068378726',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-17','2022-06-17 08:34:45',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1825086392',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-21','2022-06-21 07:51:09','2022-06-21 12:00:01','','2022-06-21 12:47:12','2022-06-21 17:51:02','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1248653638',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-22','2022-06-22 08:15:01','2022-06-22 12:01:04','','2022-06-22 12:12:05','2022-06-22 17:37:27','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1405843346',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-23','2022-06-23 08:00:16','2022-06-23 12:07:02','','2022-06-23 12:17:38','2022-06-23 18:02:23','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1274349256',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-24','2022-06-24 07:54:13','2022-06-24 12:01:41','','2022-06-24 12:12:03','2022-06-24 17:07:11','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('331602281',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-27','2022-06-27 07:53:16','2022-06-27 12:00:35','','2022-06-27 12:11:33',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1989316070',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-28','2022-06-28 08:01:25','2022-06-28 12:01:37','','2022-06-28 12:12:06','2022-06-28 17:45:07','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('958174659',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-29','2022-06-29 07:13:57',NULL,'',NULL,'2022-06-29 20:45:34','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1813310489',0,'21','CALLORA., MARRYFOL RETUBES','2022-06-30','2022-06-30 07:53:24','2022-06-30 12:02:07','','2022-06-30 12:15:49','2022-06-30 17:02:29','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1972918438',0,'21','CALLORA., MARRYFOL RETUBES','2022-07-18','2022-07-18 08:05:19','2022-07-18 12:01:54','','2022-07-18 12:12:12','2022-07-18 17:39:14','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1873402427',0,'21','CALLORA., MARRYFOL RETUBES','2022-07-19','2022-07-19 07:49:17','2022-07-19 12:00:23','','2022-07-19 12:11:07',NULL,'',0,0,4,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1761401961',0,'21','CALLORA., MARRYFOL RETUBES','2022-07-20','2022-07-20 07:54:50','2022-07-20 12:00:22','','2022-07-20 12:11:12','2022-07-20 17:22:24','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1539725912',0,'21','CALLORA., MARRYFOL RETUBES','2022-07-21','2022-07-21 07:58:36','2022-07-21 12:01:10','','2022-07-21 12:12:16','2022-07-21 17:08:07','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1512923357',0,'21','CALLORA., MARRYFOL RETUBES','2022-07-22','2022-07-22 07:47:47','2022-07-22 12:01:33','','2022-07-22 12:12:47','2022-07-22 17:02:12','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('51966020',0,'21','CALLORA., MARRYFOL RETUBES','2022-07-25','2022-07-25 07:52:52','2022-07-25 12:07:19','','2022-07-25 12:26:31','2022-07-25 17:12:00','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('767134693',0,'21','CALLORA., MARRYFOL RETUBES','2022-07-26','2022-07-26 07:44:57',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('614782731',0,'22','CANOY, CHERYL UDTUJAN','2022-06-01',NULL,'2022-06-01 12:47:40','','2022-06-01 13:04:24','2022-06-01 17:24:29','',0.06666666666666667,0,3.93,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1526332122',0,'22','CANOY, CHERYL UDTUJAN','2022-06-02','2022-06-02 08:00:06',NULL,'',NULL,'2022-06-02 17:14:08','',0,0,0,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('2053470379',0,'22','CANOY, CHERYL UDTUJAN','2022-06-06','2022-06-06 08:05:04','2022-06-06 12:47:07','','2022-06-06 12:59:13',NULL,'',0.08333333333333333,0,3.92,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1118542438',0,'22','CANOY, CHERYL UDTUJAN','2022-06-07','2022-06-07 07:50:49','2022-06-07 12:41:19','','2022-06-07 12:54:12','2022-06-07 17:46:36','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('693455993',0,'22','CANOY, CHERYL UDTUJAN','2022-06-08',NULL,'2022-06-08 12:36:31','','2022-06-08 12:57:02','2022-06-08 17:35:20','',0,0,4,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('858031300',0,'22','CANOY, CHERYL UDTUJAN','2022-06-09','2022-06-09 08:21:57','2022-06-09 12:50:42','','2022-06-09 13:01:10','2022-06-09 17:02:36','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1964021768',0,'22','CANOY, CHERYL UDTUJAN','2022-06-10','2022-06-10 08:05:53','2022-06-10 11:56:09','','2022-06-10 13:51:39','2022-06-10 18:00:02','',0.9333333333333333,0.05,7.02,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1402622557',0,'22','CANOY, CHERYL UDTUJAN','2022-06-13','2022-06-13 08:22:48','2022-06-13 12:02:31','','2022-06-13 12:48:45','2022-06-13 17:15:01','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('84498647',0,'22','CANOY, CHERYL UDTUJAN','2022-06-14',NULL,'2022-06-14 12:00:19','',NULL,'2022-06-14 17:08:14','',0,0,0,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('343202839',0,'22','CANOY, CHERYL UDTUJAN','2022-06-15','2022-06-15 08:01:26',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1233241784',0,'22','CANOY, CHERYL UDTUJAN','2022-06-16','2022-06-16 07:49:38','2022-06-16 12:05:54','','2022-06-16 12:32:02','2022-06-16 17:17:35','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('698441131',0,'22','CANOY, CHERYL UDTUJAN','2022-06-17','2022-06-17 08:22:50','2022-06-17 12:09:24','','2022-06-17 12:48:59',NULL,'',0.36666666666666664,0,3.63,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('81974968',0,'22','CANOY, CHERYL UDTUJAN','2022-06-20','2022-06-20 07:57:01','2022-06-20 12:01:17','',NULL,'2022-06-20 17:40:51','',0,0,4,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1629139194',0,'22','CANOY, CHERYL UDTUJAN','2022-06-21','2022-06-21 08:16:05','2022-06-21 12:53:15','',NULL,'2022-06-21 17:05:27','',0.5333333333333333,0,7.46,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2065987068',0,'22','CANOY, CHERYL UDTUJAN','2022-06-22',NULL,'2022-06-22 12:07:42','','2022-06-22 12:22:28','2022-06-22 17:00:36','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1515869117',0,'22','CANOY, CHERYL UDTUJAN','2022-06-23','2022-06-23 08:36:58','2022-06-23 12:33:11','','2022-06-23 12:46:37','2022-06-23 17:19:21','',0.6,0,7.4,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1215601810',0,'22','CANOY, CHERYL UDTUJAN','2022-06-27',NULL,NULL,'','2022-06-27 13:15:49',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('105499817',0,'22','CANOY, CHERYL UDTUJAN','2022-06-28',NULL,'2022-06-28 12:13:59','','2022-06-28 12:59:52','2022-06-28 17:11:07','',0,0,4,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('233990659',0,'22','CANOY, CHERYL UDTUJAN','2022-06-30','2022-06-30 08:06:45','2022-06-30 12:26:03','',NULL,'2022-06-30 18:26:38','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1595325759',0,'22','CANOY, CHERYL UDTUJAN','2022-07-18',NULL,'2022-07-18 12:22:53','','2022-07-18 12:33:59','2022-07-18 17:06:22','',0,0,4,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('3279008',0,'22','CANOY, CHERYL UDTUJAN','2022-07-19','2022-07-19 07:41:24','2022-07-19 12:47:41','','2022-07-19 13:00:23','2022-07-19 17:35:22','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('888197912',0,'22','CANOY, CHERYL UDTUJAN','2022-07-20','2022-07-20 07:35:33','2022-07-20 12:02:25','','2022-07-20 12:18:06','2022-07-20 17:22:10','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('585944060',0,'22','CANOY, CHERYL UDTUJAN','2022-07-21','2022-07-21 09:07:29',NULL,'',NULL,'2022-07-21 17:09:55','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('911917541',0,'22','CANOY, CHERYL UDTUJAN','2022-07-22','2022-07-22 08:01:44','2022-07-22 12:13:59','','2022-07-22 12:24:06','2022-07-22 17:35:04','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('506432357',0,'22','CANOY, CHERYL UDTUJAN','2022-07-25',NULL,'2022-07-25 12:16:13','','2022-07-25 12:27:47','2022-07-25 17:32:18','',0,0,4,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1018308701',0,'22','CANOY, CHERYL UDTUJAN','2022-07-26','2022-07-26 08:01:10',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('914568409',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-01','2022-06-01 07:37:44','2022-06-01 12:03:32','','2022-06-01 12:17:30','2022-06-01 17:06:12','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1214227533',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-02','2022-06-02 07:59:49','2022-06-02 12:06:49','','2022-06-02 12:18:09','2022-06-02 17:07:01','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('823019715',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-03','2022-06-03 07:48:03','2022-06-03 12:02:33','','2022-06-03 12:20:11','2022-06-03 17:05:35','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1878389657',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-06','2022-06-06 07:36:56','2022-06-06 12:02:45','','2022-06-06 12:14:42','2022-06-06 17:09:31','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('194573178',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-07','2022-06-07 07:33:34','2022-06-07 12:02:12','','2022-06-07 12:15:35','2022-06-07 17:06:43','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1425788034',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-08','2022-06-08 07:38:33','2022-06-08 12:04:16','','2022-06-08 12:21:24','2022-06-08 17:09:21','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('476795911',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-09','2022-06-09 07:30:39','2022-06-09 12:01:29','','2022-06-09 12:14:56','2022-06-09 17:07:23','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('130376768',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-10','2022-06-10 07:28:09','2022-06-10 12:07:06','','2022-06-10 12:22:19','2022-06-10 17:09:44','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1801294284',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-13','2022-06-13 07:45:01','2022-06-13 12:00:37','','2022-06-13 12:20:39','2022-06-13 17:08:01','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('637875081',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-14','2022-06-14 07:40:41','2022-06-14 12:07:06','','2022-06-14 12:25:34','2022-06-14 17:06:04','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1682721087',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-15','2022-06-15 08:02:03','2022-06-15 12:09:38','','2022-06-15 12:21:07','2022-06-15 17:09:04','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('385658953',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-16','2022-06-16 07:44:56','2022-06-16 12:02:59','','2022-06-16 12:17:37','2022-06-16 18:28:17','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1250335362',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-17','2022-06-17 07:59:42','2022-06-17 12:03:59','','2022-06-17 12:19:24','2022-06-17 18:11:14','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('608646734',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-20',NULL,NULL,'','2022-06-20 12:25:03','2022-06-20 17:27:13','',0,0,4,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('2085668072',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-21','2022-06-21 07:44:39','2022-06-21 12:00:49','','2022-06-21 12:45:03','2022-06-21 17:20:55','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2058941658',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-22','2022-06-22 08:01:48','2022-06-22 12:11:20','','2022-06-22 12:26:54','2022-06-22 17:05:42','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('602683017',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-23','2022-06-23 07:57:26','2022-06-23 12:02:02','','2022-06-23 12:23:08','2022-06-23 17:25:36','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('959994974',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-24','2022-06-24 08:22:59','2022-06-24 11:05:12','','2022-06-24 12:27:49','2022-06-24 17:04:28','',0.36666666666666664,0.9,6.73,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('117348160',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-27','2022-06-27 08:47:36','2022-06-27 12:04:38','','2022-06-27 12:24:51','2022-06-27 17:13:27','',0.7833333333333333,0,7.220000000000001,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('192808758',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-28','2022-06-28 08:12:39','2022-06-28 12:01:07','','2022-06-28 12:15:58','2022-06-28 17:06:30','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('597405356',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-29','2022-06-29 08:09:31','2022-06-29 10:24:41','','2022-06-29 12:36:31','2022-06-29 17:09:06','',0.15,1.5833333333333335,6.27,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1204141032',0,'23','CREENCIA, ANAMAE TIAMZON','2022-06-30','2022-06-30 08:19:27','2022-06-30 12:29:27','','2022-06-30 12:46:59','2022-06-30 17:06:22','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('245112956',0,'23','CREENCIA, ANAMAE TIAMZON','2022-07-18','2022-07-18 08:15:13','2022-07-18 11:16:25','',NULL,NULL,'',0.25,0.7166666666666667,3.03,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('477617435',0,'23','CREENCIA, ANAMAE TIAMZON','2022-07-19','2022-07-19 08:23:01','2022-07-19 12:22:37','','2022-07-19 12:37:00','2022-07-19 17:07:19','',0.38333333333333336,0,7.62,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1362672297',0,'23','CREENCIA, ANAMAE TIAMZON','2022-07-20','2022-07-20 08:05:16','2022-07-20 12:23:58','','2022-07-20 12:45:23','2022-07-20 17:28:21','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1992696321',0,'23','CREENCIA, ANAMAE TIAMZON','2022-07-21',NULL,NULL,'','2022-07-21 12:42:14','2022-07-21 17:05:47','',0,0,4,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1303948904',0,'23','CREENCIA, ANAMAE TIAMZON','2022-07-22','2022-07-22 07:54:46','2022-07-22 12:26:51','',NULL,NULL,'',0,0,4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1642607361',0,'23','CREENCIA, ANAMAE TIAMZON','2022-07-26','2022-07-26 07:59:45',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('74433271',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-01','2022-06-01 08:19:45','2022-06-01 12:05:19','','2022-06-01 12:52:22','2022-06-01 17:32:32','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1794102468',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-02','2022-06-02 08:06:46',NULL,'',NULL,'2022-06-02 18:25:04','',0,0,0,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1630725904',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-03','2022-06-03 07:43:52','2022-06-03 12:09:28','','2022-06-03 12:42:57','2022-06-03 18:24:17','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('191584646',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-04','2022-06-04 08:11:59',NULL,'',NULL,'2022-06-04 21:23:43','',0,0,0,'0','','','','','','','',0,'2022-06-04 08:00:00','2022-06-04 17:00:00','regular','N/A','N/A',0,0),('1296627144',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-05',NULL,NULL,'',NULL,'2022-06-05 21:00:07','',0,0,0,'0','','','','','','','',0,'2022-06-05 08:00:00','2022-06-05 17:00:00','regular','N/A','N/A',0,0),('2046469161',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-06','2022-06-06 07:44:35','2022-06-06 12:38:09','','2022-06-06 13:14:02','2022-06-06 20:45:20','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('456909107',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-07','2022-06-07 08:05:58','2022-06-07 12:28:20','','2022-06-07 13:01:47','2022-06-07 21:14:09','',0.09999999999999999,0,7.9,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1484998986',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-08','2022-06-08 07:54:49','2022-06-08 12:04:30','','2022-06-08 12:25:33','2022-06-08 21:02:10','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('107649283',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-09','2022-06-09 07:42:45','2022-06-09 12:06:56','','2022-06-09 12:40:15',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('364170819',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-10','2022-06-10 07:52:55','2022-06-10 12:01:12','','2022-06-10 13:00:26','2022-06-10 17:45:44','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1992730788',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-11','2022-06-11 08:51:16','2022-06-11 12:08:50','','2022-06-11 13:07:08','2022-06-11 18:51:02','',0.9666666666666667,0,7.029999999999999,'0','','','','','','','',0,'2022-06-11 08:00:00','2022-06-11 17:00:00','regular','N/A','N/A',0,0),('481573944',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-15','2022-06-15 08:37:47','2022-06-15 12:05:47','','2022-06-15 13:38:01','2022-06-15 17:38:47','',1.25,0,6.75,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('66893737',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-16','2022-06-16 08:06:40','2022-06-16 12:00:58','','2022-06-16 13:25:17','2022-06-16 17:29:33','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1102040079',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-17','2022-06-17 08:02:20','2022-06-17 12:20:04','','2022-06-17 12:31:25','2022-06-17 18:55:34','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1641993611',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-20',NULL,NULL,'','2022-06-20 12:35:09','2022-06-20 21:32:28','',0,0,4,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('966328920',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-21','2022-06-21 07:55:30','2022-06-21 12:05:15','','2022-06-21 13:20:35','2022-06-21 21:51:04','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('890480390',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-22','2022-06-22 09:28:15','2022-06-22 12:03:54','','2022-06-22 12:46:56','2022-06-22 23:03:11','',1.4666666666666668,0,6.529999999999999,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1480054423',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-23','2022-06-23 08:50:34','2022-06-23 12:09:36','','2022-06-23 13:19:47','2022-06-23 23:26:30','',1.15,0,6.85,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1119520038',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-24','2022-06-24 08:10:25','2022-06-24 12:12:59','','2022-06-24 13:16:58','2022-06-24 17:27:52','',0.43333333333333335,0,7.5600000000000005,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1771448998',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-25',NULL,'2022-06-25 12:12:24','','2022-06-25 13:30:22','2022-06-25 23:40:30','',0.5,0,3.5,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('1862508088',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-27','2022-06-27 07:58:09','2022-06-27 12:00:26','','2022-06-27 13:10:33',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('57005359',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-28','2022-06-28 08:24:20','2022-06-28 12:08:42','','2022-06-28 12:57:28','2022-06-28 18:24:42','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('749702712',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-29','2022-06-29 05:34:37',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1176966076',0,'25','COSCOS, DENNIS AVERGONZADO','2022-06-30','2022-06-30 08:52:12','2022-06-30 12:05:00','','2022-06-30 13:36:48','2022-06-30 18:01:33','',1.4666666666666668,0,6.529999999999999,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1079712858',0,'25','COSCOS, DENNIS AVERGONZADO','2022-07-19','2022-07-19 08:06:36','2022-07-19 12:05:26','','2022-07-19 13:00:10','2022-07-19 17:56:39','',0.1,0,7.9,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('242443024',0,'25','COSCOS, DENNIS AVERGONZADO','2022-07-20','2022-07-20 08:01:16','2022-07-20 12:09:58','','2022-07-20 13:20:56','2022-07-20 17:23:35','',0.35,0,7.65,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1108221623',0,'25','COSCOS, DENNIS AVERGONZADO','2022-07-21','2022-07-21 08:31:41','2022-07-21 12:04:36','','2022-07-21 12:22:54','2022-07-21 18:12:33','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1857316426',0,'25','COSCOS, DENNIS AVERGONZADO','2022-07-22','2022-07-22 08:26:30','2022-07-22 12:41:00','','2022-07-22 12:51:11','2022-07-22 21:05:42','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1808098854',0,'25','COSCOS, DENNIS AVERGONZADO','2022-07-25','2022-07-25 07:55:53','2022-07-25 12:25:27','','2022-07-25 12:49:01','2022-07-25 22:17:17','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('196678793',0,'26','DE LUIS, DARWIN OMAC','2022-06-01','2022-06-01 07:56:05',NULL,'',NULL,'2022-06-01 17:27:15','',0,0,0,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1065591102',0,'26','DE LUIS, DARWIN OMAC','2022-06-03','2022-06-03 08:33:46','2022-06-03 12:04:21','','2022-06-03 12:15:21','2022-06-03 17:47:43','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('380809740',0,'26','DE LUIS, DARWIN OMAC','2022-06-06','2022-06-06 07:35:28','2022-06-06 12:01:33','','2022-06-06 12:13:07','2022-06-06 17:59:08','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1521256219',0,'26','DE LUIS, DARWIN OMAC','2022-06-07','2022-06-07 08:09:15',NULL,'',NULL,'2022-06-07 18:09:55','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1395016167',0,'26','DE LUIS, DARWIN OMAC','2022-06-08','2022-06-08 08:19:51','2022-06-08 12:05:22','','2022-06-08 12:17:00','2022-06-08 17:16:20','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1318999160',0,'26','DE LUIS, DARWIN OMAC','2022-06-09','2022-06-09 08:18:37','2022-06-09 12:02:52','','2022-06-09 12:15:16','2022-06-09 17:20:38','',0.3,0,7.7,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1973487725',0,'26','DE LUIS, DARWIN OMAC','2022-06-10','2022-06-10 07:58:01','2022-06-10 12:00:20','','2022-06-10 12:10:52','2022-06-10 17:44:21','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('40789809',0,'26','DE LUIS, DARWIN OMAC','2022-06-13','2022-06-13 08:04:05','2022-06-13 12:04:31','','2022-06-13 12:15:44','2022-06-13 17:03:14','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1017097937',0,'26','DE LUIS, DARWIN OMAC','2022-06-14','2022-06-14 08:26:05','2022-06-14 12:01:25','','2022-06-14 12:12:59','2022-06-14 17:25:46','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1006434975',0,'26','DE LUIS, DARWIN OMAC','2022-06-16','2022-06-16 08:06:00','2022-06-16 12:00:42','',NULL,'2022-06-16 21:22:30','',0.1,0,3.9,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1127220580',0,'26','DE LUIS, DARWIN OMAC','2022-06-17','2022-06-17 08:17:31','2022-06-17 12:06:00','','2022-06-17 12:18:19','2022-06-17 18:14:31','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('947806834',0,'26','DE LUIS, DARWIN OMAC','2022-06-20','2022-06-20 08:04:16','2022-06-20 12:03:18','','2022-06-20 12:14:18','2022-06-20 17:23:33','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('440479393',0,'26','DE LUIS, DARWIN OMAC','2022-06-21','2022-06-21 08:05:21','2022-06-21 12:03:22','','2022-06-21 12:13:56','2022-06-21 17:11:49','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('189175618',0,'26','DE LUIS, DARWIN OMAC','2022-06-22','2022-06-22 07:48:17','2022-06-22 12:19:30','','2022-06-22 13:15:03','2022-06-22 17:40:54','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1960726120',0,'26','DE LUIS, DARWIN OMAC','2022-06-23','2022-06-23 08:03:47',NULL,'',NULL,'2022-06-23 17:08:26','',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1193496128',0,'26','DE LUIS, DARWIN OMAC','2022-06-24','2022-06-24 07:49:46',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('6891242',0,'26','DE LUIS, DARWIN OMAC','2022-06-27','2022-06-27 08:17:14','2022-06-27 12:00:02','','2022-06-27 12:10:26','2022-06-27 17:43:50','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('457445336',0,'26','DE LUIS, DARWIN OMAC','2022-06-28','2022-06-28 08:49:21','2022-06-28 12:02:00','',NULL,NULL,'',0.8166666666666667,0,3.18,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1591719156',0,'26','DE LUIS, DARWIN OMAC','2022-06-30','2022-06-30 08:03:46','2022-06-30 12:03:55','','2022-06-30 12:15:43','2022-06-30 17:55:02','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1578927594',0,'26','DE LUIS, DARWIN OMAC','2022-07-18','2022-07-18 09:25:07','2022-07-18 12:05:10','','2022-07-18 12:18:20',NULL,'',1.4166666666666667,0,2.58,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('945607910',0,'26','DE LUIS, DARWIN OMAC','2022-07-19',NULL,NULL,'','2022-07-19 13:22:41','2022-07-19 18:07:12','',0.36666666666666664,0,3.63,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1072139438',0,'26','DE LUIS, DARWIN OMAC','2022-07-20','2022-07-20 08:37:50','2022-07-20 12:03:08','','2022-07-20 12:13:32','2022-07-20 17:50:07','',0.6166666666666667,0,7.38,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('2037961434',0,'26','DE LUIS, DARWIN OMAC','2022-07-21','2022-07-21 09:46:38','2022-07-21 12:03:39','','2022-07-21 12:15:18','2022-07-21 18:04:39','',1.7666666666666666,0,6.23,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1617100694',0,'26','DE LUIS, DARWIN OMAC','2022-07-25','2022-07-25 08:49:35','2022-07-25 12:07:01','','2022-07-25 19:25:35',NULL,'',0.8166666666666667,0,3.18,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('248125011',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-01','2022-06-01 08:25:12',NULL,'',NULL,'2022-06-01 17:04:51','',0,0,0,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('308896069',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-02','2022-06-02 08:12:58',NULL,'','2022-06-02 12:48:43','2022-06-02 17:04:52','',0,0,4,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('724917573',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-03','2022-06-03 08:32:14','2022-06-03 12:44:52','','2022-06-03 13:13:04','2022-06-03 17:07:03','',0.75,0,7.25,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('461742096',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-06','2022-06-06 08:07:51','2022-06-06 12:48:40','','2022-06-06 13:00:19','2022-06-06 17:03:06','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('234077936',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-07','2022-06-07 08:29:35','2022-06-07 12:55:51','','2022-06-07 13:05:59','2022-06-07 17:48:36','',0.5666666666666667,0,7.4399999999999995,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('969204574',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-08','2022-06-08 08:27:29',NULL,'','2022-06-08 12:58:40','2022-06-08 17:12:00','',0,0,4,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('180266055',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-09','2022-06-09 08:18:31','2022-06-09 12:30:55','','2022-06-09 12:54:27',NULL,'',0.3,0,3.7,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('611775001',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-10','2022-06-10 08:41:52','2022-06-10 12:08:36','','2022-06-10 12:20:27','2022-06-10 17:37:49','',0.6833333333333333,0,7.32,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('993466631',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-13','2022-06-13 08:15:53','2022-06-13 12:39:54','','2022-06-13 12:51:52','2022-06-13 17:26:23','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('325968136',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-14','2022-06-14 08:45:50','2022-06-14 12:26:03','','2022-06-14 12:39:58','2022-06-14 17:12:26','',0.75,0,7.25,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1288326699',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-15','2022-06-15 08:24:26','2022-06-15 12:35:13','','2022-06-15 12:45:51','2022-06-15 17:05:12','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('102107870',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-16','2022-06-16 08:25:09','2022-06-16 12:22:23','','2022-06-16 12:32:46','2022-06-16 17:15:14','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('677251381',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-17','2022-06-17 08:33:14','2022-06-17 12:22:10','','2022-06-17 12:34:23','2022-06-17 17:45:17','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('30479579',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-20','2022-06-20 08:49:59',NULL,'','2022-06-20 12:55:11','2022-06-20 17:14:31','',0,0,4,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1143401488',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-21','2022-06-21 08:31:01','2022-06-21 12:51:53','','2022-06-21 13:03:04','2022-06-21 17:52:03','',0.5666666666666668,0,7.43,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1974970829',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-22','2022-06-22 08:44:48',NULL,'','2022-06-22 12:46:40','2022-06-22 17:20:56','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1449295488',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-23','2022-06-23 08:25:01',NULL,'','2022-06-23 13:09:33','2022-06-23 17:59:01','',0.15,0,3.85,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('946331939',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-27','2022-06-27 07:50:47','2022-06-27 12:28:40','','2022-06-27 12:47:22','2022-06-27 19:13:23','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1325467052',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-28','2022-06-28 08:42:58','2022-06-28 12:26:51','','2022-06-28 12:47:42','2022-06-28 17:28:15','',0.7,0,7.3,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1441911506',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-29',NULL,'2022-06-29 12:00:44','','2022-06-29 12:11:30',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1689935202',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-06-30','2022-06-30 08:43:10','2022-06-30 12:26:35','','2022-06-30 12:39:10','2022-06-30 17:19:01','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('775583917',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-07-19','2022-07-19 08:01:15','2022-07-19 12:31:17','','2022-07-19 12:41:49',NULL,'',0.016666666666666666,0,3.98,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('623809012',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-07-20','2022-07-20 08:22:58','2022-07-20 12:27:04','','2022-07-20 12:38:30',NULL,'',0.36666666666666664,0,3.63,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1808620062',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-07-21','2022-07-21 08:25:03','2022-07-21 12:40:39','','2022-07-21 12:54:20','2022-07-21 17:09:32','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1993355320',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-07-22','2022-07-22 08:27:18','2022-07-22 12:18:50','','2022-07-22 12:33:24','2022-07-22 17:19:06','',0.45,0,7.55,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1988500089',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-07-25',NULL,'2022-07-25 12:40:19','','2022-07-25 12:55:10','2022-07-25 17:26:19','',0,0,4,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1729959296',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2022-07-26','2022-07-26 08:20:33',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('229015479',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-01','2022-06-01 07:48:29','2022-06-01 12:06:44','','2022-06-01 12:17:11','2022-06-01 17:32:56','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('15657745',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-02','2022-06-02 07:40:37','2022-06-02 12:00:23','','2022-06-02 12:11:08','2022-06-02 17:19:54','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1063867085',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-03','2022-06-03 08:06:31','2022-06-03 12:04:43','','2022-06-03 12:15:08',NULL,'',0.1,0,3.9,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('722691171',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-06','2022-06-06 07:46:26','2022-06-06 12:05:31','','2022-06-06 12:16:18','2022-06-06 17:12:36','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1550405398',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-07','2022-06-07 08:00:08','2022-06-07 12:00:51','','2022-06-07 12:11:07','2022-06-07 17:07:33','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('2071934212',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-08','2022-06-08 08:01:10','2022-06-08 12:06:41','','2022-06-08 12:20:12','2022-06-08 17:05:12','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1884610563',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-09','2022-06-09 07:48:38','2022-06-09 12:00:51','','2022-06-09 12:12:18','2022-06-09 17:07:01','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1611785370',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-10','2022-06-10 07:57:40','2022-06-10 12:03:26','','2022-06-10 12:16:35','2022-06-10 17:17:38','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1246871169',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-13','2022-06-13 08:03:30','2022-06-13 12:01:34','','2022-06-13 12:12:22','2022-06-13 17:27:58','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1862094737',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-14','2022-06-14 07:56:49','2022-06-14 12:00:55','','2022-06-14 12:12:16','2022-06-14 17:05:08','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('156821936',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-15','2022-06-15 07:51:41','2022-06-15 12:00:30','','2022-06-15 12:11:51','2022-06-15 17:09:39','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1809194654',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-16','2022-06-16 07:37:13','2022-06-16 12:03:53','','2022-06-16 12:14:54','2022-06-16 17:11:26','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('314091749',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-21','2022-06-21 07:58:54','2022-06-21 12:44:04','','2022-06-21 12:55:04','2022-06-21 17:22:43','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1514497575',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-22','2022-06-22 07:56:59','2022-06-22 12:01:34','','2022-06-22 12:12:20','2022-06-22 17:37:39','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1134572007',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-23','2022-06-23 07:49:41','2022-06-23 12:07:13','','2022-06-23 12:18:24','2022-06-23 17:21:21','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('152322486',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-24','2022-06-24 07:59:49','2022-06-24 12:34:24','',NULL,'2022-06-24 17:41:12','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1494592355',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-27','2022-06-27 07:38:17','2022-06-27 12:00:39','','2022-06-27 13:02:26','2022-06-27 17:07:21','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('209287998',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-28','2022-06-28 07:53:38','2022-06-28 12:01:33','','2022-06-28 12:12:11','2022-06-28 17:44:00','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1536846107',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-29','2022-06-29 06:06:47',NULL,'',NULL,'2022-06-29 20:46:13','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1006187965',0,'28','DUMAJEL, ERLYN ADOREMOS','2022-06-30','2022-06-30 07:54:46','2022-06-30 12:02:11','','2022-06-30 12:16:09',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1579464035',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-01','2022-06-01 07:42:26','2022-06-01 12:22:24','','2022-06-01 12:34:55','2022-06-01 17:04:30','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('867007594',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-02','2022-06-02 07:50:19','2022-06-02 12:33:04','','2022-06-02 12:43:30','2022-06-02 17:05:12','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('2016684214',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-03','2022-06-03 07:51:06','2022-06-03 12:02:51','','2022-06-03 12:15:26','2022-06-03 17:02:09','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('2119225246',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-06','2022-06-06 07:48:12','2022-06-06 12:06:15','','2022-06-06 12:18:17','2022-06-06 17:02:16','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('913446336',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-07','2022-06-07 07:58:36',NULL,'',NULL,'2022-06-07 17:02:07','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1957061098',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-08','2022-06-08 07:49:04','2022-06-08 12:30:10','','2022-06-08 12:43:02','2022-06-08 19:50:18','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1449638653',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-09','2022-06-09 07:35:10','2022-06-09 12:00:47','','2022-06-09 12:11:48','2022-06-09 17:01:35','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('136174996',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-13','2022-06-13 07:36:45','2022-06-13 12:05:58','','2022-06-13 12:17:07','2022-06-13 17:00:47','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('13861390',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-14','2022-06-14 07:26:30','2022-06-14 12:13:48','','2022-06-14 12:30:27','2022-06-14 17:00:32','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1160247698',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-15','2022-06-15 07:48:26','2022-06-15 12:27:10','','2022-06-15 12:40:35','2022-06-15 16:17:47','',0,0.7,7.3,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('840263171',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-17','2022-06-17 07:53:03','2022-06-17 12:30:19','','2022-06-17 12:44:58','2022-06-17 16:59:06','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('961600414',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-20','2022-06-20 07:53:44','2022-06-20 12:00:28','','2022-06-20 12:11:06','2022-06-20 17:01:13','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1884370711',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-21','2022-06-21 07:52:16','2022-06-21 12:02:52','','2022-06-21 12:14:36','2022-06-21 17:04:16','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('203359728',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-22','2022-06-22 08:05:56','2022-06-22 12:00:03','','2022-06-22 12:12:35','2022-06-22 17:03:34','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2026489747',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-23','2022-06-23 07:45:24','2022-06-23 12:00:27','','2022-06-23 12:11:03','2022-06-23 17:05:39','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('805083218',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-27','2022-06-27 07:54:31','2022-06-27 12:22:48','','2022-06-27 12:54:06',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1507245213',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-28','2022-06-28 07:38:32',NULL,'',NULL,'2022-06-28 17:31:23','',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1169870349',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-29','2022-06-29 07:57:16',NULL,'',NULL,'2022-06-29 20:54:40','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1626713726',0,'29','EDRADAN, ARNAN ANTALLAN','2022-06-30','2022-06-30 07:59:02','2022-06-30 12:18:07','','2022-06-30 12:29:11','2022-06-30 17:04:05','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1044892847',0,'29','EDRADAN, ARNAN ANTALLAN','2022-07-18','2022-07-18 07:54:57','2022-07-18 12:01:21','','2022-07-18 12:47:56','2022-07-18 17:10:18','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1455891741',0,'29','EDRADAN, ARNAN ANTALLAN','2022-07-19','2022-07-19 07:54:14','2022-07-19 12:02:38','','2022-07-19 12:13:07','2022-07-19 17:07:55','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1293023154',0,'29','EDRADAN, ARNAN ANTALLAN','2022-07-20','2022-07-20 07:52:55','2022-07-20 12:01:38','','2022-07-20 12:18:54','2022-07-20 17:00:30','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('676739656',0,'29','EDRADAN, ARNAN ANTALLAN','2022-07-21','2022-07-21 07:57:38','2022-07-21 12:30:09','','2022-07-21 12:41:10','2022-07-21 17:00:47','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1354426985',0,'29','EDRADAN, ARNAN ANTALLAN','2022-07-22','2022-07-22 07:44:43','2022-07-22 12:03:50','','2022-07-22 12:18:03','2022-07-22 17:04:13','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('146556982',0,'29','EDRADAN, ARNAN ANTALLAN','2022-07-25','2022-07-25 07:47:03','2022-07-25 12:04:51','','2022-07-25 12:15:03','2022-07-25 17:07:57','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('643503891',0,'29','EDRADAN, ARNAN ANTALLAN','2022-07-26','2022-07-26 07:55:12',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('368411374',0,'3','RITA  AMPATIN','2022-06-01','2022-06-01 08:04:48','2022-06-01 12:13:42','','2022-06-01 12:35:42','2022-06-01 17:05:00','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1983191058',0,'3','RITA  AMPATIN','2022-06-02','2022-06-02 08:02:09','2022-06-02 12:01:09','','2022-06-02 12:29:38','2022-06-02 17:02:17','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('918783665',0,'3','RITA  AMPATIN','2022-06-03','2022-06-03 07:55:29','2022-06-03 12:16:34','','2022-06-03 12:40:09','2022-06-03 17:03:11','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1433368752',0,'3','RITA  AMPATIN','2022-06-06','2022-06-06 07:50:24','2022-06-06 12:01:28','','2022-06-06 12:55:25','2022-06-06 17:02:04','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1877556016',0,'3','RITA  AMPATIN','2022-06-07','2022-06-07 07:54:51','2022-06-07 12:01:49','',NULL,'2022-06-07 17:04:07','',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1270846488',0,'3','RITA  AMPATIN','2022-06-08','2022-06-08 07:52:20','2022-06-08 12:02:55','',NULL,'2022-06-08 17:02:40','',0,0,4,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('109175138',0,'3','RITA  AMPATIN','2022-06-09','2022-06-09 07:43:10','2022-06-09 12:16:51','','2022-06-09 12:58:57','2022-06-09 17:01:06','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('961927145',0,'3','RITA  AMPATIN','2022-06-10','2022-06-10 07:48:41','2022-06-10 12:02:56','',NULL,'2022-06-10 17:01:16','',0,0,4,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('45810874',0,'3','RITA  AMPATIN','2022-06-13','2022-06-13 07:56:24','2022-06-13 12:04:17','','2022-06-13 12:34:49','2022-06-13 17:05:10','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1761219004',0,'3','RITA  AMPATIN','2022-06-14','2022-06-14 07:55:57','2022-06-14 12:12:05','','2022-06-14 12:41:02','2022-06-14 17:01:55','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1121760416',0,'3','RITA  AMPATIN','2022-06-15','2022-06-15 07:40:44','2022-06-15 12:02:43','','2022-06-15 12:33:45','2022-06-15 17:02:43','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('532679013',0,'3','RITA  AMPATIN','2022-06-16','2022-06-16 07:47:26','2022-06-16 12:05:32','',NULL,'2022-06-16 17:12:52','',0,0,4,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1416197289',0,'3','RITA  AMPATIN','2022-06-17',NULL,NULL,'','2022-06-17 12:14:28','2022-06-17 17:02:06','',0,0,4,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('345660201',0,'3','RITA  AMPATIN','2022-06-20','2022-06-20 08:00:51','2022-06-20 12:11:58','','2022-06-20 12:43:56','2022-06-20 17:01:07','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('992223709',0,'3','RITA  AMPATIN','2022-06-21','2022-06-21 07:52:04','2022-06-21 12:01:04','','2022-06-21 12:19:00','2022-06-21 17:01:10','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('548836748',0,'3','RITA  AMPATIN','2022-06-22','2022-06-22 07:49:45','2022-06-22 12:05:39','','2022-06-22 12:22:54','2022-06-22 17:01:27','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1813734810',0,'3','RITA  AMPATIN','2022-06-23','2022-06-23 07:52:11','2022-06-23 12:04:06','','2022-06-23 12:18:34','2022-06-23 17:01:02','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('726527905',0,'3','RITA  AMPATIN','2022-06-24','2022-06-24 07:49:05','2022-06-24 12:01:29','','2022-06-24 12:26:47','2022-06-24 17:01:52','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('105345635',0,'3','RITA  AMPATIN','2022-06-27','2022-06-27 07:51:59',NULL,'','2022-06-27 12:38:53','2022-06-27 17:08:37','',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1686185189',0,'3','RITA  AMPATIN','2022-06-28','2022-06-28 07:57:18','2022-06-28 12:19:27','','2022-06-28 12:50:24','2022-06-28 17:31:32','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1081466986',0,'3','RITA  AMPATIN','2022-06-29','2022-06-29 07:35:05','2022-06-29 12:00:32','','2022-06-29 12:20:09',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('760954001',0,'3','RITA  AMPATIN','2022-06-30','2022-06-30 07:54:04','2022-06-30 12:25:25','','2022-06-30 12:44:58','2022-06-30 17:01:04','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('607402016',0,'3','RITA  AMPATIN','2022-07-18','2022-07-18 07:53:41','2022-07-18 12:15:16','','2022-07-18 12:32:15','2022-07-18 17:06:11','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1551116187',0,'3','RITA  AMPATIN','2022-07-19','2022-07-19 07:50:56','2022-07-19 12:18:05','','2022-07-19 12:38:44','2022-07-19 17:07:33','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1281133344',0,'3','RITA  AMPATIN','2022-07-20','2022-07-20 07:53:46','2022-07-20 12:05:50','','2022-07-20 12:22:11','2022-07-20 17:05:39','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('895931195',0,'3','RITA  AMPATIN','2022-07-21','2022-07-21 07:56:30','2022-07-21 12:12:59','','2022-07-21 12:59:20','2022-07-21 17:04:48','',0,0,12,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('945813638',0,'3','RITA  AMPATIN','2022-07-22','2022-07-22 07:55:52','2022-07-22 12:05:08','','2022-07-22 12:32:54','2022-07-22 17:03:03','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('428995983',0,'3','RITA  AMPATIN','2022-07-25','2022-07-25 07:53:36','2022-07-25 12:10:18','','2022-07-25 12:33:25','2022-07-25 17:04:58','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1749103812',0,'3','RITA  AMPATIN','2022-07-26','2022-07-26 07:51:11',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1610867946',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-01','2022-06-01 07:54:17','2022-06-01 12:01:00','','2022-06-01 12:51:31','2022-06-01 17:06:35','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('824023790',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-02','2022-06-02 07:53:55','2022-06-02 12:00:02','','2022-06-02 12:53:05','2022-06-02 17:05:58','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1688664613',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-03','2022-06-03 07:52:59','2022-06-03 12:05:19','','2022-06-03 13:07:16','2022-06-03 17:05:22','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('380665380',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-06','2022-06-06 07:45:32','2022-06-06 12:01:10','','2022-06-06 12:52:06','2022-06-06 17:01:12','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('2132922786',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-07','2022-06-07 07:59:43','2022-06-07 12:00:12','','2022-06-07 13:05:41','2022-06-07 17:03:10','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('226517695',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-08','2022-06-08 07:36:45','2022-06-08 12:00:11','','2022-06-08 13:12:07','2022-06-08 17:20:25','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('476591908',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-09','2022-06-09 07:59:51','2022-06-09 12:00:13','','2022-06-09 12:59:25','2022-06-09 17:00:31','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('984706808',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-10','2022-06-10 08:00:17','2022-06-10 12:04:59','','2022-06-10 13:04:26','2022-06-10 17:03:01','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('406401308',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-13','2022-06-13 07:37:20','2022-06-13 12:01:06','','2022-06-13 13:19:28','2022-06-13 17:00:40','',0.6333333333333333,3.9166666666666665,7.45,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1369578856',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-14','2022-06-14 07:56:43','2022-06-14 12:00:50','','2022-06-14 12:40:40','2022-06-14 17:01:14','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('131298516',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-15','2022-06-15 07:45:11','2022-06-15 12:02:00','','2022-06-15 12:48:42','2022-06-15 17:00:31','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1379074824',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-16','2022-06-16 07:47:57','2022-06-16 12:00:52','','2022-06-16 12:48:39','2022-06-16 17:03:08','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('940745989',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-17','2022-06-17 08:07:53','2022-06-17 12:00:35','','2022-06-17 13:09:04','2022-06-17 17:07:22','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1214012296',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-20','2022-06-20 07:57:06','2022-06-20 12:00:33','','2022-06-20 13:00:37','2022-06-20 17:04:31','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('848498214',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-21','2022-06-21 07:51:58','2022-06-21 12:01:47','','2022-06-21 12:49:03','2022-06-21 17:03:23','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('190542235',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-22','2022-06-22 07:58:01','2022-06-22 12:00:22','','2022-06-22 12:50:46','2022-06-22 17:03:54','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('443277001',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-23','2022-06-23 08:04:20','2022-06-23 12:00:31','','2022-06-23 12:39:35','2022-06-23 17:05:29','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1875651564',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-24','2022-06-24 08:06:37',NULL,'',NULL,'2022-06-24 17:01:11','',0,0,0,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1305488974',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-27','2022-06-27 07:31:13',NULL,'','2022-06-27 13:19:25',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('519433836',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-28','2022-06-28 07:34:43','2022-06-28 12:02:08','','2022-06-28 13:05:08','2022-06-28 17:00:11','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1323688772',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-29','2022-06-29 07:42:37','2022-06-29 12:00:48','','2022-06-29 12:10:52',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('589864407',0,'30','EMPINADO, ETHEL ALEGADO','2022-06-30','2022-06-30 08:08:16','2022-06-30 12:00:26','','2022-06-30 12:58:57','2022-06-30 17:00:57','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('795260367',0,'30','EMPINADO, ETHEL ALEGADO','2022-07-18','2022-07-18 07:54:25',NULL,'','2022-07-18 12:01:38','2022-07-18 17:01:55','',0,0,4,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2145886286',0,'30','EMPINADO, ETHEL ALEGADO','2022-07-19','2022-07-19 07:46:43','2022-07-19 12:00:08','','2022-07-19 12:33:11','2022-07-19 17:00:22','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1839163460',0,'30','EMPINADO, ETHEL ALEGADO','2022-07-20','2022-07-20 07:51:17','2022-07-20 12:00:10','','2022-07-20 12:36:07','2022-07-20 17:00:25','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1720019241',0,'30','EMPINADO, ETHEL ALEGADO','2022-07-21','2022-07-21 07:57:32','2022-07-21 12:00:12','','2022-07-21 12:55:17','2022-07-21 17:00:57','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1597416944',0,'30','EMPINADO, ETHEL ALEGADO','2022-07-22','2022-07-22 07:44:33','2022-07-22 12:00:22','','2022-07-22 12:21:11','2022-07-22 17:03:21','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('798284165',0,'30','EMPINADO, ETHEL ALEGADO','2022-07-25','2022-07-25 07:49:15','2022-07-25 12:02:28','','2022-07-25 12:43:36','2022-07-25 17:06:17','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1884201879',0,'30','EMPINADO, ETHEL ALEGADO','2022-07-26','2022-07-26 07:47:32',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1130783618',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-01','2022-06-01 07:41:29','2022-06-01 12:01:17','','2022-06-01 12:48:27',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1730100075',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-03','2022-06-03 08:08:39','2022-06-03 12:01:21','','2022-06-03 12:44:29','2022-06-03 17:01:41','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('768799761',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-06','2022-06-06 07:45:11','2022-06-06 12:01:47','','2022-06-06 12:12:12','2022-06-06 18:18:31','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1032718995',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-07','2022-06-07 07:50:37','2022-06-07 12:00:17','','2022-06-07 12:51:58','2022-06-07 17:00:23','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1944718514',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-08',NULL,'2022-06-08 12:00:30','','2022-06-08 13:02:29','2022-06-08 17:01:11','',0.03333333333333333,0,3.97,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('912342578',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-09','2022-06-09 07:53:59','2022-06-09 12:01:08','','2022-06-09 13:07:31','2022-06-09 17:00:26','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('109604140',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-10','2022-06-10 07:53:20','2022-06-10 12:05:40','','2022-06-10 13:09:02','2022-06-10 17:01:24','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('448167846',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-13','2022-06-13 07:50:00','2022-06-13 12:00:28','','2022-06-13 12:57:24','2022-06-13 17:00:22','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1398140189',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-14','2022-06-14 07:54:31','2022-06-14 12:02:17','','2022-06-14 12:51:46','2022-06-14 17:01:27','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('793881010',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-15','2022-06-15 07:47:28','2022-06-15 12:01:09','','2022-06-15 12:51:29','2022-06-15 17:01:12','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('677463280',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-16','2022-06-16 07:51:29','2022-06-16 12:01:18','','2022-06-16 12:52:16','2022-06-16 17:00:25','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('2138921443',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-17','2022-06-17 08:28:07','2022-06-17 12:02:25','','2022-06-17 12:58:35','2022-06-17 17:12:12','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1351813276',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-20',NULL,'2022-06-20 12:00:39','','2022-06-20 12:56:47','2022-06-20 17:00:34','',0,0,4,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1085438053',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-21','2022-06-21 07:48:52','2022-06-21 12:00:33','','2022-06-21 12:37:23','2022-06-21 17:06:40','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('211376043',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-22','2022-06-22 08:10:36','2022-06-22 12:00:25','','2022-06-22 12:54:55','2022-06-22 17:03:37','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1573146713',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-23','2022-06-23 07:58:11','2022-06-23 12:00:05','','2022-06-23 13:02:01','2022-06-23 17:02:02','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('198554586',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-24','2022-06-24 07:54:33','2022-06-24 12:19:34','','2022-06-24 12:58:21','2022-06-24 17:03:47','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('624716231',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-27','2022-06-27 07:49:13','2022-06-27 12:03:58','','2022-06-27 12:52:40','2022-06-27 16:55:51','',0,0.06666666666666667,7.93,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('182988474',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-28','2022-06-28 07:59:59','2022-06-28 12:00:36','','2022-06-28 12:47:10','2022-06-28 17:09:29','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1085773703',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-29','2022-06-29 07:59:44','2022-06-29 12:00:15','','2022-06-29 12:10:37',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('168401711',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-06-30','2022-06-30 07:55:13','2022-06-30 12:00:14','','2022-06-30 13:00:57','2022-06-30 17:00:38','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1151460396',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-07-18','2022-07-18 07:55:07','2022-07-18 12:09:47','','2022-07-18 12:59:19','2022-07-18 17:52:05','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('224852218',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-07-19','2022-07-19 07:50:28','2022-07-19 12:22:06','',NULL,'2022-07-19 17:45:00','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('453874751',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-07-20','2022-07-20 07:51:43','2022-07-20 12:10:49','','2022-07-20 12:42:58','2022-07-20 17:51:39','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1403359044',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-07-21','2022-07-21 07:52:44','2022-07-21 12:15:57','','2022-07-21 12:52:09','2022-07-21 17:06:26','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1828505516',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-07-22','2022-07-22 07:52:46','2022-07-22 12:10:57','','2022-07-22 13:12:29','2022-07-22 17:02:57','',0.2,0,7.8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1501873681',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-07-25','2022-07-25 08:02:49','2022-07-25 12:05:36','','2022-07-25 12:55:47','2022-07-25 17:36:29','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1365055536',0,'31','ENTRINA, ANGEL GUALDAJARA','2022-07-26','2022-07-26 07:48:35',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1256279579',0,'32','ENSOY, HERMENIA BARNISO','2022-06-01','2022-06-01 08:10:52','2022-06-01 12:00:52','','2022-06-01 12:12:03','2022-06-01 17:40:50','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('61946934',0,'32','ENSOY, HERMENIA BARNISO','2022-06-02','2022-06-02 08:05:09','2022-06-02 12:02:12','','2022-06-02 12:24:47','2022-06-02 20:47:01','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('989048600',0,'32','ENSOY, HERMENIA BARNISO','2022-06-03','2022-06-03 08:18:23','2022-06-03 12:04:51','','2022-06-03 12:18:31','2022-06-03 17:07:08','',0.3,0,7.7,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('382409891',0,'32','ENSOY, HERMENIA BARNISO','2022-06-07','2022-06-07 07:59:26','2022-06-07 12:08:53','',NULL,'2022-06-07 18:03:20','',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('464846700',0,'32','ENSOY, HERMENIA BARNISO','2022-06-08','2022-06-08 07:38:41','2022-06-08 12:10:22','','2022-06-08 12:22:26','2022-06-08 17:31:23','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1444091950',0,'32','ENSOY, HERMENIA BARNISO','2022-06-09',NULL,'2022-06-09 12:03:54','','2022-06-09 12:14:18','2022-06-09 17:43:25','',0,0,4,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('269381839',0,'32','ENSOY, HERMENIA BARNISO','2022-06-10','2022-06-10 07:49:59','2022-06-10 12:14:53','','2022-06-10 12:29:08','2022-06-10 17:59:31','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('554121117',0,'32','ENSOY, HERMENIA BARNISO','2022-06-16','2022-06-16 07:50:26','2022-06-16 12:02:53','','2022-06-16 12:14:24','2022-06-16 17:53:53','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1615752770',0,'32','ENSOY, HERMENIA BARNISO','2022-06-17','2022-06-17 07:52:52','2022-06-17 12:02:33','','2022-06-17 12:20:17','2022-06-17 18:09:45','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('53730542',0,'32','ENSOY, HERMENIA BARNISO','2022-06-20','2022-06-20 08:01:07','2022-06-20 12:23:20','','2022-06-20 12:35:52','2022-06-20 18:15:14','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1911155384',0,'32','ENSOY, HERMENIA BARNISO','2022-06-21','2022-06-21 08:09:59','2022-06-21 12:03:43','','2022-06-21 12:14:23','2022-06-21 17:16:05','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2147138194',0,'32','ENSOY, HERMENIA BARNISO','2022-06-22','2022-06-22 08:24:23','2022-06-22 12:01:13','','2022-06-22 12:12:59','2022-06-22 17:18:32','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1284203909',0,'32','ENSOY, HERMENIA BARNISO','2022-06-23',NULL,NULL,'','2022-06-23 12:37:52','2022-06-23 18:01:02','',0,0,4,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1204075987',0,'32','ENSOY, HERMENIA BARNISO','2022-06-24','2022-06-24 08:00:56','2022-06-24 12:19:51','','2022-06-24 12:39:30','2022-06-24 18:22:07','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('266337482',0,'32','ENSOY, HERMENIA BARNISO','2022-06-27','2022-06-27 08:15:39','2022-06-27 12:00:16','','2022-06-27 12:11:12','2022-06-27 18:14:23','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('649604929',0,'32','ENSOY, HERMENIA BARNISO','2022-06-29','2022-06-29 06:19:01','2022-06-29 12:03:04','','2022-06-29 12:17:11','2022-06-29 20:33:53','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('376982845',0,'32','ENSOY, HERMENIA BARNISO','2022-06-30','2022-06-30 07:56:12','2022-06-30 12:03:16','','2022-06-30 12:14:27','2022-06-30 17:01:59','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1171462435',0,'32','ENSOY, HERMENIA BARNISO','2022-07-18','2022-07-18 08:16:10',NULL,'','2022-07-18 12:46:29','2022-07-18 17:11:51','',0,0,4,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('374548413',0,'32','ENSOY, HERMENIA BARNISO','2022-07-19','2022-07-19 07:57:30',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('863421260',0,'32','ENSOY, HERMENIA BARNISO','2022-07-20','2022-07-20 08:19:20','2022-07-20 12:10:03','','2022-07-20 12:20:23','2022-07-20 17:24:14','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1385931529',0,'33','ESNARDO, MARICHU MANTE','2022-06-01','2022-06-01 07:25:03','2022-06-01 12:12:51','','2022-06-01 12:27:22','2022-06-01 17:28:26','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1596712646',0,'33','ESNARDO, MARICHU MANTE','2022-06-02','2022-06-02 07:10:05','2022-06-02 12:10:32','','2022-06-02 12:26:47','2022-06-02 17:50:39','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('964759759',0,'33','ESNARDO, MARICHU MANTE','2022-06-03','2022-06-03 07:22:08','2022-06-03 12:30:21','','2022-06-03 12:45:49','2022-06-03 17:42:05','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1192909142',0,'33','ESNARDO, MARICHU MANTE','2022-06-04','2022-06-04 08:19:30',NULL,'',NULL,'2022-06-04 21:24:35','',0,0,0,'0','','','','','','','',0,'2022-06-04 08:00:00','2022-06-04 17:00:00','regular','N/A','N/A',0,0),('1874591456',0,'33','ESNARDO, MARICHU MANTE','2022-06-05','2022-06-05 08:09:01',NULL,'',NULL,'2022-06-05 21:03:38','',0,0,0,'0','','','','','','','',0,'2022-06-05 08:00:00','2022-06-05 17:00:00','regular','N/A','N/A',0,0),('264300726',0,'33','ESNARDO, MARICHU MANTE','2022-06-06','2022-06-06 07:37:27','2022-06-06 12:42:25','','2022-06-06 13:20:40','2022-06-06 20:49:35','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1071670532',0,'33','ESNARDO, MARICHU MANTE','2022-06-07','2022-06-07 07:59:32','2022-06-07 12:31:02','','2022-06-07 12:43:54','2022-06-07 17:52:45','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('2142162121',0,'33','ESNARDO, MARICHU MANTE','2022-06-08','2022-06-08 07:40:47','2022-06-08 12:45:34','','2022-06-08 13:02:51','2022-06-08 20:31:04','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1770403640',0,'33','ESNARDO, MARICHU MANTE','2022-06-09','2022-06-09 07:16:21','2022-06-09 12:12:41','','2022-06-09 12:27:56','2022-06-09 17:29:56','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('507054731',0,'33','ESNARDO, MARICHU MANTE','2022-06-10','2022-06-10 07:17:13','2022-06-10 12:04:29','','2022-06-10 12:31:49','2022-06-10 18:07:53','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('2011156866',0,'33','ESNARDO, MARICHU MANTE','2022-06-11','2022-06-11 08:25:41',NULL,'',NULL,'2022-06-11 17:31:10','',0,0,0,'0','','','','','','','',0,'2022-06-11 08:00:00','2022-06-11 17:00:00','regular','N/A','N/A',0,0),('1754133906',0,'33','ESNARDO, MARICHU MANTE','2022-06-13','2022-06-13 07:22:04','2022-06-13 12:12:36','','2022-06-13 12:36:41','2022-06-13 17:42:52','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('268140227',0,'33','ESNARDO, MARICHU MANTE','2022-06-14','2022-06-14 07:51:50','2022-06-14 12:08:36','','2022-06-14 12:21:18','2022-06-14 18:00:16','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1400083407',0,'33','ESNARDO, MARICHU MANTE','2022-06-15','2022-06-15 07:16:11','2022-06-15 12:11:06','','2022-06-15 12:30:15','2022-06-15 17:58:39','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('308814288',0,'33','ESNARDO, MARICHU MANTE','2022-06-16','2022-06-16 07:36:53','2022-06-16 12:14:43','','2022-06-16 12:29:24','2022-06-16 19:38:06','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1660258948',0,'33','ESNARDO, MARICHU MANTE','2022-06-17','2022-06-17 07:32:41','2022-06-17 12:11:26','','2022-06-17 12:26:41','2022-06-17 18:16:26','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1684975650',0,'33','ESNARDO, MARICHU MANTE','2022-06-20','2022-06-20 07:56:56','2022-06-20 12:41:13','','2022-06-20 12:54:48','2022-06-20 18:08:08','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1561382514',0,'33','ESNARDO, MARICHU MANTE','2022-06-21','2022-06-21 07:51:48','2022-06-21 12:19:47','','2022-06-21 12:42:02','2022-06-21 17:57:02','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('630097236',0,'33','ESNARDO, MARICHU MANTE','2022-06-22','2022-06-22 07:39:27','2022-06-22 12:14:52','','2022-06-22 12:30:32','2022-06-22 18:03:25','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1629168997',0,'33','ESNARDO, MARICHU MANTE','2022-06-23','2022-06-23 07:00:21','2022-06-23 12:09:15','','2022-06-23 12:19:57','2022-06-23 18:18:30','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('144060861',0,'33','ESNARDO, MARICHU MANTE','2022-06-24','2022-06-24 07:04:53',NULL,'','2022-06-24 12:53:15','2022-06-24 17:53:06','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('2096227656',0,'33','ESNARDO, MARICHU MANTE','2022-06-25',NULL,NULL,'',NULL,'2022-06-25 16:19:54','',0,0,0,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('1388691176',0,'33','ESNARDO, MARICHU MANTE','2022-06-27','2022-06-27 07:39:05','2022-06-27 12:47:15','','2022-06-27 13:01:43','2022-06-27 22:15:48','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1929337760',0,'33','ESNARDO, MARICHU MANTE','2022-06-28','2022-06-28 08:08:05','2022-06-28 12:12:48','','2022-06-28 12:25:16','2022-06-28 18:56:16','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1376489299',0,'33','ESNARDO, MARICHU MANTE','2022-06-30','2022-06-30 08:09:14','2022-06-30 12:17:39','','2022-06-30 12:35:42','2022-06-30 17:47:02','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1893733417',0,'33','ESNARDO, MARICHU MANTE','2022-07-16','2022-07-16 07:04:20',NULL,'',NULL,'2022-07-16 18:08:22','',0,0,0,'0','','','','','','','',0,'2022-07-16 08:00:00','2022-07-16 17:00:00','regular','N/A','N/A',0,0),('1902876684',0,'33','ESNARDO, MARICHU MANTE','2022-07-17','2022-07-17 07:31:24',NULL,'',NULL,'2022-07-17 21:58:30','',0,0,0,'0','','','','','','','',0,'2022-07-17 08:00:00','2022-07-17 17:00:00','regular','N/A','N/A',0,0),('309506793',0,'33','ESNARDO, MARICHU MANTE','2022-07-18','2022-07-18 07:27:20','2022-07-18 12:08:48','','2022-07-18 12:47:47','2022-07-18 19:55:57','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2057635661',0,'33','ESNARDO, MARICHU MANTE','2022-07-19','2022-07-19 07:42:07','2022-07-19 12:42:39','','2022-07-19 12:57:59','2022-07-19 17:39:54','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('2093633002',0,'33','ESNARDO, MARICHU MANTE','2022-07-20','2022-07-20 07:03:39','2022-07-20 12:01:28','','2022-07-20 12:13:02','2022-07-20 18:08:25','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('2066557080',0,'33','ESNARDO, MARICHU MANTE','2022-07-21','2022-07-21 07:06:25','2022-07-21 12:06:45','','2022-07-21 12:43:37','2022-07-21 18:16:04','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('735045169',0,'33','ESNARDO, MARICHU MANTE','2022-07-22','2022-07-22 07:09:34','2022-07-22 12:10:20','','2022-07-22 12:29:38','2022-07-22 17:47:59','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('51088516',0,'33','ESNARDO, MARICHU MANTE','2022-07-25','2022-07-25 07:44:53','2022-07-25 12:25:06','','2022-07-25 13:01:46','2022-07-25 22:15:06','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1400067713',0,'33','ESNARDO, MARICHU MANTE','2022-07-26','2022-07-26 08:02:37',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1518463055',0,'34','ESNARDO, RAYMART MANTE','2022-06-01','2022-06-01 07:45:09',NULL,'','2022-06-01 12:17:56','2022-06-01 17:28:17','',0,0,4,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('897180684',0,'34','ESNARDO, RAYMART MANTE','2022-06-02','2022-06-02 07:19:44','2022-06-02 12:17:07','','2022-06-02 13:07:58','2022-06-02 17:21:09','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('431085165',0,'34','ESNARDO, RAYMART MANTE','2022-06-03','2022-06-03 07:22:14','2022-06-03 12:30:57','','2022-06-03 12:45:34','2022-06-03 17:46:12','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('445652094',0,'34','ESNARDO, RAYMART MANTE','2022-06-06','2022-06-06 07:41:16','2022-06-06 12:22:18','','2022-06-06 12:42:16','2022-06-06 17:59:13','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('109366199',0,'34','ESNARDO, RAYMART MANTE','2022-06-07','2022-06-07 07:20:50','2022-06-07 12:09:28','','2022-06-07 13:06:39','2022-06-07 17:52:57','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('7564903',0,'34','ESNARDO, RAYMART MANTE','2022-06-08','2022-06-08 07:20:46','2022-06-08 12:08:09','','2022-06-08 13:25:30','2022-06-08 17:16:26','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('2063825065',0,'34','ESNARDO, RAYMART MANTE','2022-06-10','2022-06-10 07:33:46','2022-06-10 12:33:16','','2022-06-10 12:53:50','2022-06-10 17:31:29','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('627850539',0,'34','ESNARDO, RAYMART MANTE','2022-06-13','2022-06-13 07:29:10','2022-06-13 12:07:40','','2022-06-13 12:20:55','2022-06-13 17:10:37','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1731283',0,'34','ESNARDO, RAYMART MANTE','2022-06-14','2022-06-14 08:01:20','2022-06-14 12:01:15','','2022-06-14 12:46:49','2022-06-14 17:26:37','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('536290967',0,'34','ESNARDO, RAYMART MANTE','2022-06-15','2022-06-15 07:32:11','2022-06-15 12:31:10','','2022-06-15 12:53:34','2022-06-15 17:28:36','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('593545807',0,'34','ESNARDO, RAYMART MANTE','2022-06-16','2022-06-16 07:42:34','2022-06-16 12:19:48','','2022-06-16 12:38:34','2022-06-16 17:45:04','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('152184314',0,'34','ESNARDO, RAYMART MANTE','2022-06-17','2022-06-17 07:56:12','2022-06-17 12:17:54','','2022-06-17 12:31:31','2022-06-17 17:09:23','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('101936417',0,'34','ESNARDO, RAYMART MANTE','2022-06-20','2022-06-20 08:13:39','2022-06-20 12:21:58','','2022-06-20 13:14:18','2022-06-20 17:28:58','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1288924657',0,'34','ESNARDO, RAYMART MANTE','2022-06-21','2022-06-21 07:55:36','2022-06-21 12:03:55','','2022-06-21 12:14:18','2022-06-21 17:18:33','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('418741888',0,'34','ESNARDO, RAYMART MANTE','2022-06-22','2022-06-22 07:45:03','2022-06-22 12:20:53','','2022-06-22 12:33:15','2022-06-22 17:20:16','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('538079230',0,'34','ESNARDO, RAYMART MANTE','2022-06-23','2022-06-23 07:25:00','2022-06-23 12:00:18','','2022-06-23 12:26:07','2022-06-23 17:08:20','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1944279011',0,'34','ESNARDO, RAYMART MANTE','2022-06-24','2022-06-24 07:38:18','2022-06-24 12:01:10','','2022-06-24 12:30:00','2022-06-24 17:07:40','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('12250892',0,'34','ESNARDO, RAYMART MANTE','2022-06-30',NULL,'2022-06-30 12:05:24','','2022-06-30 12:41:27',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('917366599',0,'34','ESNARDO, RAYMART MANTE','2022-07-18','2022-07-18 07:51:55','2022-07-18 12:03:45','','2022-07-18 12:28:59','2022-07-18 17:12:28','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('852144987',0,'34','ESNARDO, RAYMART MANTE','2022-07-19',NULL,NULL,'','2022-07-19 12:13:46',NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('822902205',0,'34','ESNARDO, RAYMART MANTE','2022-07-20','2022-07-20 07:25:47','2022-07-20 12:03:58','','2022-07-20 12:15:27','2022-07-20 17:45:34','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1772386024',0,'34','ESNARDO, RAYMART MANTE','2022-07-21','2022-07-21 07:51:50','2022-07-21 12:14:28','','2022-07-21 12:25:38','2022-07-21 18:04:28','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('473255329',0,'34','ESNARDO, RAYMART MANTE','2022-07-22','2022-07-22 07:23:38','2022-07-22 12:05:59','','2022-07-22 12:25:41','2022-07-22 17:04:20','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1198278933',0,'34','ESNARDO, RAYMART MANTE','2022-07-25','2022-07-25 08:20:31','2022-07-25 12:03:50','','2022-07-25 12:25:46','2022-07-25 18:19:50','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1179554993',0,'34','ESNARDO, RAYMART MANTE','2022-07-26','2022-07-26 07:48:53',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1715081361',0,'35','FERNAN, ALEX RELACION','2022-06-01','2022-06-01 08:02:29','2022-06-01 12:00:02','','2022-06-01 12:50:39','2022-06-01 17:00:01','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('240540444',0,'35','FERNAN, ALEX RELACION','2022-06-02','2022-06-02 07:56:08','2022-06-02 12:02:38','','2022-06-02 12:43:37','2022-06-02 17:32:13','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1261571414',0,'35','FERNAN, ALEX RELACION','2022-06-03','2022-06-03 08:07:42','2022-06-03 12:20:55','',NULL,'2022-06-03 17:05:30','',0.11666666666666667,0,3.88,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1203894191',0,'35','FERNAN, ALEX RELACION','2022-06-08','2022-06-08 07:58:51','2022-06-08 12:00:04','','2022-06-08 12:32:11','2022-06-08 17:01:28','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('515530154',0,'35','FERNAN, ALEX RELACION','2022-06-09','2022-06-09 08:32:36','2022-06-09 12:33:23','',NULL,'2022-06-09 17:00:55','',1.0666666666666667,0,6.94,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1466134437',0,'35','FERNAN, ALEX RELACION','2022-06-10','2022-06-10 08:10:28','2022-06-10 12:11:27','','2022-06-10 12:57:40','2022-06-10 17:00:56','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1381938848',0,'35','FERNAN, ALEX RELACION','2022-06-13','2022-06-13 07:52:58','2022-06-13 12:17:24','','2022-06-13 12:37:18','2022-06-13 17:12:59','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1733316344',0,'35','FERNAN, ALEX RELACION','2022-06-16','2022-06-16 07:55:39','2022-06-16 12:11:03','','2022-06-16 12:43:03','2022-06-16 18:04:18','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1689017678',0,'35','FERNAN, ALEX RELACION','2022-06-21','2022-06-21 08:07:19','2022-06-21 12:02:22','','2022-06-21 12:43:16','2022-06-21 17:15:40','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('435615918',0,'35','FERNAN, ALEX RELACION','2022-06-23','2022-06-23 06:51:52','2022-06-23 12:04:55','','2022-06-23 13:00:31',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1405362154',0,'35','FERNAN, ALEX RELACION','2022-06-28','2022-06-28 09:41:01','2022-06-28 12:29:48','','2022-06-28 12:41:25',NULL,'',1.6833333333333333,0,2.32,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1527202944',0,'35','FERNAN, ALEX RELACION','2022-06-29','2022-06-29 08:16:44',NULL,'',NULL,'2022-06-29 13:04:05','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('643369508',0,'35','FERNAN, ALEX RELACION','2022-06-30','2022-06-30 07:04:10',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('998521750',0,'35','FERNAN, ALEX RELACION','2022-07-18','2022-07-18 07:57:09','2022-07-18 12:13:51','','2022-07-18 12:27:28','2022-07-18 17:28:21','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('947680409',0,'35','FERNAN, ALEX RELACION','2022-07-20',NULL,NULL,'','2022-07-20 13:15:30','2022-07-20 17:00:02','',0.25,0,3.75,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1955140646',0,'35','FERNAN, ALEX RELACION','2022-07-21','2022-07-21 07:51:25',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('959552314',0,'35','FERNAN, ALEX RELACION','2022-07-22','2022-07-22 07:56:07','2022-07-22 12:38:43','','2022-07-22 12:51:41','2022-07-22 17:07:09','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('772279807',0,'35','FERNAN, ALEX RELACION','2022-07-25','2022-07-25 08:02:36','2022-07-25 12:03:41','',NULL,'2022-07-25 17:18:56','',0.03333333333333333,0,3.97,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('802652597',0,'35','FERNAN, ALEX RELACION','2022-07-26','2022-07-26 07:56:47',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1675872706',0,'39','GISMAN, CAREN BUAL','2022-06-01','2022-06-01 08:19:51','2022-06-01 12:07:49','','2022-06-01 12:37:39','2022-06-01 17:27:07','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('781319326',0,'39','GISMAN, CAREN BUAL','2022-06-02','2022-06-02 08:52:41','2022-06-02 12:10:21','','2022-06-02 12:25:34','2022-06-02 17:44:20','',0.8666666666666667,0,7.13,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1268130613',0,'39','GISMAN, CAREN BUAL','2022-06-03','2022-06-03 08:06:18','2022-06-03 12:01:55','','2022-06-03 12:16:09','2022-06-03 17:17:02','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('469399318',0,'39','GISMAN, CAREN BUAL','2022-06-06','2022-06-06 05:43:20','2022-06-06 12:04:56','','2022-06-06 12:56:34','2022-06-06 17:09:25','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('229724082',0,'39','GISMAN, CAREN BUAL','2022-06-07','2022-06-07 08:20:41','2022-06-07 12:28:58','','2022-06-07 12:42:10','2022-06-07 18:08:58','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1748464255',0,'39','GISMAN, CAREN BUAL','2022-06-08','2022-06-08 08:14:35','2022-06-08 12:07:59','','2022-06-08 12:43:10','2022-06-08 17:07:04','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1905757226',0,'39','GISMAN, CAREN BUAL','2022-06-09','2022-06-09 07:52:56','2022-06-09 12:05:52','','2022-06-09 12:25:24','2022-06-09 17:08:45','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1038745796',0,'39','GISMAN, CAREN BUAL','2022-06-13','2022-06-13 08:25:23','2022-06-13 12:49:33','','2022-06-13 12:59:51','2022-06-13 17:22:02','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('2126977106',0,'39','GISMAN, CAREN BUAL','2022-06-15','2022-06-15 08:22:56','2022-06-15 12:00:20','','2022-06-15 12:19:15','2022-06-15 18:34:43','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1658002276',0,'39','GISMAN, CAREN BUAL','2022-06-16',NULL,'2022-06-16 12:00:29','',NULL,'2022-06-16 18:11:10','',0,0,0,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('124791790',0,'39','GISMAN, CAREN BUAL','2022-06-17','2022-06-17 08:37:35','2022-06-17 12:14:55','',NULL,'2022-06-17 17:26:04','',0.6166666666666667,0,3.38,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1475597564',0,'39','GISMAN, CAREN BUAL','2022-06-20','2022-06-20 08:09:31','2022-06-20 12:07:29','',NULL,NULL,'',0.15,0,3.85,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('816700348',0,'39','GISMAN, CAREN BUAL','2022-06-21',NULL,'2022-06-21 12:03:32','','2022-06-21 12:23:26','2022-06-21 17:55:32','',0,0,4,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('477161505',0,'39','GISMAN, CAREN BUAL','2022-06-22',NULL,'2022-06-22 12:13:47','','2022-06-22 12:40:21','2022-06-22 17:59:13','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('391606115',0,'39','GISMAN, CAREN BUAL','2022-06-23','2022-06-23 08:15:19','2022-06-23 12:10:52','','2022-06-23 12:44:15','2022-06-23 18:16:41','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1219219152',0,'39','GISMAN, CAREN BUAL','2022-06-24','2022-06-24 08:18:45',NULL,'','2022-06-24 13:03:17','2022-06-24 19:00:36','',0.05,0,3.95,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1447164106',0,'39','GISMAN, CAREN BUAL','2022-06-26','2022-06-26 08:06:37',NULL,'',NULL,'2022-06-26 17:54:49','',0,0,0,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('1194388608',0,'39','GISMAN, CAREN BUAL','2022-06-27',NULL,'2022-06-27 12:05:27','','2022-06-27 12:40:33','2022-06-27 21:57:24','',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1407442757',0,'39','GISMAN, CAREN BUAL','2022-06-28','2022-06-28 08:45:02','2022-06-28 12:15:38','','2022-06-28 12:36:53','2022-06-28 18:47:43','',0.75,0,7.25,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('391800839',0,'39','GISMAN, CAREN BUAL','2022-07-18','2022-07-18 08:41:29','2022-07-18 12:08:15','','2022-07-18 12:24:43','2022-07-18 18:15:52','',0.6833333333333333,0,7.32,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('275880805',0,'39','GISMAN, CAREN BUAL','2022-07-19','2022-07-19 08:11:32',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1015062185',0,'39','GISMAN, CAREN BUAL','2022-07-21',NULL,'2022-07-21 12:10:08','','2022-07-21 12:31:38','2022-07-21 18:09:09','',0,0,4,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1677973435',0,'39','GISMAN, CAREN BUAL','2022-07-22',NULL,'2022-07-22 12:13:54','','2022-07-22 12:46:53','2022-07-22 18:05:27','',0,0,4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1925726268',0,'39','GISMAN, CAREN BUAL','2022-07-23',NULL,NULL,'',NULL,'2022-07-23 18:23:40','',0,0,0,'0','','','','','','','',0,'2022-07-23 08:00:00','2022-07-23 17:00:00','regular','N/A','N/A',0,0),('427944589',0,'39','GISMAN, CAREN BUAL','2022-07-24','2022-07-24 08:06:56',NULL,'',NULL,'2022-07-24 16:35:51','',0,0,0,'0','','','','','','','',0,'2022-07-24 08:00:00','2022-07-24 17:00:00','regular','N/A','N/A',0,0),('506770000',0,'4','ANDRIN, ARNEL ROMERO','2022-06-01','2022-06-01 08:30:53','2022-06-01 12:01:52','','2022-06-01 12:12:10','2022-06-01 17:02:55','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('861432282',0,'4','ANDRIN, ARNEL ROMERO','2022-06-02','2022-06-02 08:27:29','2022-06-02 12:03:27','','2022-06-02 12:18:05','2022-06-02 17:01:28','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('311870251',0,'4','ANDRIN, ARNEL ROMERO','2022-06-03','2022-06-03 07:55:52','2022-06-03 12:01:02','','2022-06-03 12:13:28','2022-06-03 17:06:49','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1325363171',0,'4','ANDRIN, ARNEL ROMERO','2022-06-06','2022-06-06 08:10:26','2022-06-06 12:00:02','','2022-06-06 12:11:49','2022-06-06 17:08:20','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('721871170',0,'4','ANDRIN, ARNEL ROMERO','2022-06-07','2022-06-07 08:25:30','2022-06-07 12:02:02','','2022-06-07 12:15:31','2022-06-07 17:01:05','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('788268990',0,'4','ANDRIN, ARNEL ROMERO','2022-06-13','2022-06-13 08:09:31','2022-06-13 12:01:11','','2022-06-13 12:20:34','2022-06-13 17:01:01','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1728505722',0,'4','ANDRIN, ARNEL ROMERO','2022-06-14','2022-06-14 08:24:40','2022-06-14 12:00:42','','2022-06-14 12:11:35','2022-06-14 17:03:44','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('249142602',0,'4','ANDRIN, ARNEL ROMERO','2022-06-15','2022-06-15 07:58:34','2022-06-15 12:00:25','','2022-06-15 12:12:00','2022-06-15 17:01:56','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('773953897',0,'4','ANDRIN, ARNEL ROMERO','2022-06-20','2022-06-20 07:57:11','2022-06-20 11:38:55','',NULL,NULL,'',0,0.35,3.65,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1773705772',0,'4','ANDRIN, ARNEL ROMERO','2022-06-21','2022-06-21 07:54:47','2022-06-21 12:01:09','','2022-06-21 12:22:32','2022-06-21 17:15:24','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1652764112',0,'4','ANDRIN, ARNEL ROMERO','2022-06-22','2022-06-22 11:51:07',NULL,'',NULL,'2022-06-22 17:02:34','',0,0,0,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1124222211',0,'4','ANDRIN, ARNEL ROMERO','2022-06-23','2022-06-23 08:03:39','2022-06-23 12:01:52','','2022-06-23 12:14:03','2022-06-23 17:01:45','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('995902848',0,'4','ANDRIN, ARNEL ROMERO','2022-06-27','2022-06-27 07:58:40','2022-06-27 12:04:48','','2022-06-27 12:17:19','2022-06-27 17:14:35','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('838761920',0,'4','ANDRIN, ARNEL ROMERO','2022-06-28','2022-06-28 08:07:25','2022-06-28 12:14:26','','2022-06-28 12:26:04','2022-06-28 17:03:13','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('229214333',0,'4','ANDRIN, ARNEL ROMERO','2022-06-30','2022-06-30 07:39:05','2022-06-30 11:15:57','',NULL,NULL,'',0,0.7333333333333333,3.27,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('500235630',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-01','2022-06-01 07:38:20','2022-06-01 12:34:30','','2022-06-01 12:53:26','2022-06-01 17:05:27','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('441466618',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-02','2022-06-02 07:30:21','2022-06-02 12:37:50','','2022-06-02 12:48:11','2022-06-02 17:15:14','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1263552697',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-03','2022-06-03 07:42:04','2022-06-03 12:33:33','','2022-06-03 12:47:30','2022-06-03 17:37:32','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('805124449',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-06','2022-06-06 07:45:06','2022-06-06 12:30:41','','2022-06-06 12:44:53','2022-06-06 18:02:46','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1391123776',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-07','2022-06-07 07:58:19','2022-06-07 12:14:29','','2022-06-07 12:37:34','2022-06-07 17:50:35','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1155178485',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-08','2022-06-08 07:47:30','2022-06-08 12:27:04','','2022-06-08 12:38:38','2022-06-08 17:29:05','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1204369856',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-09','2022-06-09 07:30:06','2022-06-09 12:41:05','','2022-06-09 12:59:01','2022-06-09 17:24:46','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('982146075',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-10',NULL,'2022-06-10 12:42:14','','2022-06-10 13:03:49','2022-06-10 17:26:20','',0.05,0,3.95,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('381181167',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-11','2022-06-11 09:03:24',NULL,'',NULL,'2022-06-11 17:25:14','',0,0,0,'0','','','','','','','',0,'2022-06-11 08:00:00','2022-06-11 17:00:00','regular','N/A','N/A',0,0),('1151999288',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-13','2022-06-13 07:57:31','2022-06-13 12:32:26','','2022-06-13 12:55:50','2022-06-13 17:11:43','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('784209683',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-14','2022-06-14 08:07:34','2022-06-14 12:47:04','','2022-06-14 12:58:35','2022-06-14 17:05:55','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('112628446',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-15','2022-06-15 08:28:54','2022-06-15 12:34:27','','2022-06-15 12:52:04','2022-06-15 17:17:21','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1386768854',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-16','2022-06-16 07:54:22','2022-06-16 12:23:59','','2022-06-16 12:40:52','2022-06-16 17:37:03','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('782175556',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-17','2022-06-17 08:12:09','2022-06-17 12:31:15','','2022-06-17 12:48:03','2022-06-17 18:23:20','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('967917532',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-18','2022-06-18 07:01:36',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-18 08:00:00','2022-06-18 17:00:00','regular','N/A','N/A',0,0),('717038799',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-20','2022-06-20 07:54:53','2022-06-20 12:22:26','','2022-06-20 12:46:08','2022-06-20 17:19:20','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1143473031',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-21','2022-06-21 07:56:07','2022-06-21 12:50:36','','2022-06-21 13:01:58','2022-06-21 17:10:44','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1045359220',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-22',NULL,'2022-06-22 12:25:08','','2022-06-22 12:41:49','2022-06-22 17:17:50','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('34995305',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-23','2022-06-23 07:34:20',NULL,'',NULL,'2022-06-23 17:43:48','',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('234566932',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-24','2022-06-24 08:02:03',NULL,'','2022-06-24 12:53:23','2022-06-24 17:44:17','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1519587773',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-25',NULL,NULL,'',NULL,'2022-06-25 16:23:38','',0,0,0,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('1163009137',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-27','2022-06-27 08:32:31','2022-06-27 12:24:07','','2022-06-27 12:38:13',NULL,'',0.5333333333333333,0,3.47,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('684178325',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-28','2022-06-28 08:18:13',NULL,'','2022-06-28 12:52:04',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('12758478',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-06-29','2022-06-29 05:18:33',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1596551726',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-16','2022-07-16 09:57:13',NULL,'',NULL,'2022-07-16 16:48:50','',0,0,0,'0','','','','','','','',0,'2022-07-16 08:00:00','2022-07-16 17:00:00','regular','N/A','N/A',0,0),('997376251',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-18',NULL,'2022-07-18 12:42:31','','2022-07-18 12:53:19','2022-07-18 17:23:42','',0,0,4,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('419474798',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-19','2022-07-19 08:02:50','2022-07-19 11:59:13','','2022-07-19 12:16:03','2022-07-19 17:58:18','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1045159177',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-20','2022-07-20 07:35:27','2022-07-20 12:45:16','','2022-07-20 12:58:42','2022-07-20 17:32:10','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('546196503',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-21','2022-07-21 08:13:10','2022-07-21 12:29:25','','2022-07-21 12:49:19','2022-07-21 17:09:39','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1109694292',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-22','2022-07-22 07:56:28','2022-07-22 12:21:19','','2022-07-22 12:34:54','2022-07-22 17:05:25','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('506661297',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-25','2022-07-25 08:03:42','2022-07-25 12:13:36','','2022-07-25 12:23:38','2022-07-25 17:46:56','',0.05,0,7.95,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('852858011',0,'40','GRAVANZA, ADELAIDA RAFAEL','2022-07-26','2022-07-26 07:43:19',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1716941143',0,'41','INSON, MERIAM DAGCUTAN','2022-06-01','2022-06-01 08:11:14','2022-06-01 12:13:04','','2022-06-01 12:46:47','2022-06-01 17:27:23','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1788006500',0,'41','INSON, MERIAM DAGCUTAN','2022-06-02','2022-06-02 08:38:29','2022-06-02 12:03:11','','2022-06-02 12:21:05','2022-06-02 18:34:02','',0.6333333333333333,0,7.37,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('843355232',0,'41','INSON, MERIAM DAGCUTAN','2022-06-03','2022-06-03 08:13:57','2022-06-03 12:08:50','','2022-06-03 12:22:53','2022-06-03 17:31:35','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('744139114',0,'41','INSON, MERIAM DAGCUTAN','2022-06-06','2022-06-06 08:24:23','2022-06-06 12:01:52','','2022-06-06 12:28:25','2022-06-06 18:48:00','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('180466147',0,'41','INSON, MERIAM DAGCUTAN','2022-06-07','2022-06-07 08:14:14','2022-06-07 12:06:48','','2022-06-07 12:23:01','2022-06-07 19:29:06','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1672814334',0,'41','INSON, MERIAM DAGCUTAN','2022-06-08','2022-06-08 08:11:12','2022-06-08 12:15:43','','2022-06-08 12:31:24','2022-06-08 18:36:51','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1687368345',0,'41','INSON, MERIAM DAGCUTAN','2022-06-09','2022-06-09 07:55:37','2022-06-09 12:19:23','','2022-06-09 12:37:50','2022-06-09 17:30:31','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('174012377',0,'41','INSON, MERIAM DAGCUTAN','2022-06-10','2022-06-10 08:16:58','2022-06-10 12:19:28','',NULL,NULL,'',0.26666666666666666,0,3.73,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('502571767',0,'41','INSON, MERIAM DAGCUTAN','2022-06-13','2022-06-13 08:26:20','2022-06-13 12:04:06','','2022-06-13 12:15:49','2022-06-13 18:02:05','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('2131964234',0,'41','INSON, MERIAM DAGCUTAN','2022-06-14','2022-06-14 08:42:52','2022-06-14 12:15:43','','2022-06-14 12:25:51','2022-06-14 17:13:41','',0.7,0,7.3,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('2110997946',0,'41','INSON, MERIAM DAGCUTAN','2022-06-15','2022-06-15 08:07:40','2022-06-15 12:09:02','','2022-06-15 12:44:34','2022-06-15 17:47:40','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1192760305',0,'41','INSON, MERIAM DAGCUTAN','2022-06-16','2022-06-16 08:45:09','2022-06-16 12:06:48','','2022-06-16 12:47:12','2022-06-16 21:21:05','',0.75,0,7.25,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('266998526',0,'41','INSON, MERIAM DAGCUTAN','2022-06-17','2022-06-17 08:13:31','2022-06-17 12:11:42','',NULL,NULL,'',0.21666666666666667,0,3.78,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1736533242',0,'41','INSON, MERIAM DAGCUTAN','2022-06-20','2022-06-20 07:23:22','2022-06-20 12:12:47','','2022-06-20 12:24:46','2022-06-20 17:33:57','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('664328625',0,'41','INSON, MERIAM DAGCUTAN','2022-06-21','2022-06-21 08:00:28','2022-06-21 12:01:21','','2022-06-21 12:22:57','2022-06-21 19:00:30','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1345372050',0,'41','INSON, MERIAM DAGCUTAN','2022-06-22','2022-06-22 08:31:50','2022-06-22 12:09:06','','2022-06-22 12:33:29','2022-06-22 18:41:33','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2118927131',0,'41','INSON, MERIAM DAGCUTAN','2022-06-23','2022-06-23 07:19:25','2022-06-23 12:01:30','','2022-06-23 12:44:06','2022-06-23 17:35:13','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1197274448',0,'41','INSON, MERIAM DAGCUTAN','2022-06-27','2022-06-27 08:40:08','2022-06-27 12:03:48','','2022-06-27 12:25:35','2022-06-27 18:09:28','',0.6666666666666666,0,7.33,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1497708091',0,'41','INSON, MERIAM DAGCUTAN','2022-06-28','2022-06-28 08:40:08','2022-06-28 12:02:04','','2022-06-28 12:18:48','2022-06-28 18:14:33','',0.6666666666666666,0,7.33,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1056802610',0,'41','INSON, MERIAM DAGCUTAN','2022-06-29','2022-06-29 08:40:13','2022-06-29 12:01:49','','2022-06-29 12:14:04','2022-06-29 18:51:15','',0.6666666666666666,0,7.33,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('255896461',0,'41','INSON, MERIAM DAGCUTAN','2022-06-30','2022-06-30 08:41:22','2022-06-30 12:13:54','','2022-06-30 12:24:41','2022-06-30 17:53:15','',0.6833333333333333,0,7.32,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1922886533',0,'41','INSON, MERIAM DAGCUTAN','2022-07-18','2022-07-18 08:54:05','2022-07-18 12:19:31','','2022-07-18 12:31:24','2022-07-18 17:35:17','',0.9,0,7.1,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2126792796',0,'41','INSON, MERIAM DAGCUTAN','2022-07-19','2022-07-19 08:26:51','2022-07-19 12:31:39','',NULL,'2022-07-19 17:22:34','',0.8666666666666667,0,7.14,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1847264294',0,'41','INSON, MERIAM DAGCUTAN','2022-07-20','2022-07-20 09:11:42','2022-07-20 12:09:07','','2022-07-20 12:33:44','2022-07-20 17:59:37','',1.1833333333333333,0,6.82,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1167005817',0,'41','INSON, MERIAM DAGCUTAN','2022-07-21','2022-07-21 08:36:05','2022-07-21 12:00:51','','2022-07-21 12:18:37','2022-07-21 17:44:43','',0.6,0,7.4,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('2086781327',0,'41','INSON, MERIAM DAGCUTAN','2022-07-25','2022-07-25 08:16:39','2022-07-25 12:20:48','','2022-07-25 12:32:03','2022-07-25 17:40:58','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('47608045',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-01',NULL,'2022-06-01 12:02:39','','2022-06-01 12:16:58','2022-06-01 17:29:44','',0,0,4,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('54919524',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-02','2022-06-02 09:24:22','2022-06-02 12:08:13','','2022-06-02 12:25:16','2022-06-02 17:26:06','',1.4,0,6.6,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1845347808',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-03','2022-06-03 08:52:14','2022-06-03 12:21:06','',NULL,'2022-06-03 18:34:37','',1.7333333333333334,0,6.26,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('754954964',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-06','2022-06-06 07:21:27',NULL,'',NULL,'2022-06-06 18:31:50','',0,0,0,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1579180765',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-07',NULL,NULL,'','2022-06-07 12:19:38','2022-06-07 18:03:00','',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('381109433',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-08','2022-06-08 09:17:22','2022-06-08 12:04:12','','2022-06-08 12:21:58','2022-06-08 17:17:51','',1.2833333333333332,0,6.720000000000001,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1761012306',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-09','2022-06-09 09:42:45','2022-06-09 12:05:30','','2022-06-09 12:23:43','2022-06-09 17:05:39','',1.7,0,6.3,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1769280545',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-10','2022-06-10 09:32:55','2022-06-10 12:07:10','','2022-06-10 12:33:26','2022-06-10 17:10:34','',1.5333333333333332,0,6.470000000000001,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('22562563',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-13','2022-06-13 08:21:51','2022-06-13 12:29:15','','2022-06-13 12:50:47','2022-06-13 17:15:26','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('833981683',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-14',NULL,'2022-06-14 12:07:08','','2022-06-14 12:25:08','2022-06-14 17:15:56','',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('2107220949',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-15','2022-06-15 09:14:28','2022-06-15 12:10:20','','2022-06-15 12:23:00','2022-06-15 17:53:44','',1.2333333333333334,0,6.77,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1825937670',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-16','2022-06-16 08:20:00','2022-06-16 12:03:29','','2022-06-16 12:15:45','2022-06-16 21:29:09','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('567551581',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-17','2022-06-17 08:40:21','2022-06-17 12:04:01','','2022-06-17 12:19:34','2022-06-17 19:25:43','',0.6666666666666666,0,7.33,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('150735699',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-20','2022-06-20 07:45:45','2022-06-20 12:34:57','','2022-06-20 12:58:19','2022-06-20 18:24:34','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('392775057',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-21','2022-06-21 08:28:29','2022-06-21 12:03:26','','2022-06-21 12:28:39','2022-06-21 17:41:36','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('563858563',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-22','2022-06-22 08:43:55','2022-06-22 12:10:43','','2022-06-22 12:24:05','2022-06-22 18:13:23','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1573977971',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-23','2022-06-23 09:13:24','2022-06-23 12:01:57','','2022-06-23 12:22:59','2022-06-23 19:47:06','',1.2166666666666668,0,6.779999999999999,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('897949045',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-24','2022-06-24 09:06:05','2022-06-24 12:12:25','',NULL,'2022-06-24 17:21:20','',1.1,0,2.9,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1104269447',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-27',NULL,'2022-06-27 12:05:31','','2022-06-27 12:30:45','2022-06-27 18:18:25','',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('340660473',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-28',NULL,NULL,'','2022-06-28 12:49:53','2022-06-28 17:32:05','',0,0,4,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1198534210',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-29','2022-06-29 09:05:52','2022-06-29 12:23:02','','2022-06-29 12:54:24','2022-06-29 19:19:55','',1.0833333333333333,0,6.92,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1908187418',0,'42','JANGALAY, JUDELYN MEDINA','2022-06-30','2022-06-30 09:08:18','2022-06-30 12:29:22','','2022-06-30 12:48:13','2022-06-30 17:32:08','',1.1333333333333333,0,6.87,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('2006881887',0,'43','LAID, JHESORLEY MAGANA','2022-06-01','2022-06-01 08:15:39','2022-06-01 12:02:52','','2022-06-01 12:52:15','2022-06-01 17:33:35','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1402832082',0,'43','LAID, JHESORLEY MAGANA','2022-06-02','2022-06-02 08:48:14','2022-06-02 12:16:08','','2022-06-02 12:49:34','2022-06-02 17:07:46','',0.8,0,7.2,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('205444109',0,'43','LAID, JHESORLEY MAGANA','2022-06-03','2022-06-03 08:05:19','2022-06-03 12:04:08','','2022-06-03 13:17:08','2022-06-03 17:22:06','',0.36666666666666664,0,7.640000000000001,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1203911818',0,'43','LAID, JHESORLEY MAGANA','2022-06-04','2022-06-04 07:49:17',NULL,'',NULL,'2022-06-04 21:23:56','',0,0,0,'0','','','','','','','',0,'2022-06-04 08:00:00','2022-06-04 17:00:00','regular','N/A','N/A',0,0),('1839525567',0,'43','LAID, JHESORLEY MAGANA','2022-06-05','2022-06-05 08:18:41',NULL,'',NULL,'2022-06-05 21:00:25','',0,0,0,'0','','','','','','','',0,'2022-06-05 08:00:00','2022-06-05 17:00:00','regular','N/A','N/A',0,0),('1795069474',0,'43','LAID, JHESORLEY MAGANA','2022-06-06','2022-06-06 08:10:30','2022-06-06 12:38:03','','2022-06-06 13:14:04','2022-06-06 20:46:06','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('534143914',0,'43','LAID, JHESORLEY MAGANA','2022-06-07','2022-06-07 08:48:47','2022-06-07 12:28:26','','2022-06-07 13:00:52','2022-06-07 17:12:27','',0.8,0,7.2,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('586391830',0,'43','LAID, JHESORLEY MAGANA','2022-06-08','2022-06-08 08:13:49','2022-06-08 12:04:41','','2022-06-08 12:27:14','2022-06-08 20:18:47','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1816438825',0,'43','LAID, JHESORLEY MAGANA','2022-06-09',NULL,NULL,'','2022-06-09 13:41:14','2022-06-09 17:59:40','',0.6833333333333333,0,3.32,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('511216192',0,'43','LAID, JHESORLEY MAGANA','2022-06-10','2022-06-10 08:43:54','2022-06-10 12:01:05','','2022-06-10 12:59:51','2022-06-10 18:35:59','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1954989944',0,'43','LAID, JHESORLEY MAGANA','2022-06-13','2022-06-13 08:34:43','2022-06-13 12:02:39','','2022-06-13 13:01:17','2022-06-13 19:02:25','',0.5833333333333334,0,7.41,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1900709242',0,'43','LAID, JHESORLEY MAGANA','2022-06-14','2022-06-14 08:49:21','2022-06-14 12:01:52','','2022-06-14 12:36:20','2022-06-14 17:22:01','',0.8166666666666667,0,7.18,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1451053785',0,'43','LAID, JHESORLEY MAGANA','2022-06-15','2022-06-15 08:19:13','2022-06-15 12:05:41','','2022-06-15 13:09:35','2022-06-15 17:10:18','',0.4666666666666667,0,7.53,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('29306687',0,'43','LAID, JHESORLEY MAGANA','2022-06-17','2022-06-17 08:21:24','2022-06-17 12:03:25','','2022-06-17 13:03:03','2022-06-17 20:39:08','',0.39999999999999997,0,7.6,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1163799917',0,'43','LAID, JHESORLEY MAGANA','2022-06-20','2022-06-20 08:55:36','2022-06-20 12:03:24','','2022-06-20 13:53:30','2022-06-20 17:57:58','',1.7999999999999998,0,6.2,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1088000213',0,'43','LAID, JHESORLEY MAGANA','2022-06-21','2022-06-21 07:57:37','2022-06-21 12:05:39','','2022-06-21 13:06:44','2022-06-21 17:05:40','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1348795683',0,'43','LAID, JHESORLEY MAGANA','2022-06-22','2022-06-22 09:06:35','2022-06-22 12:03:37','','2022-06-22 12:47:03','2022-06-22 17:15:24','',1.1,0,6.9,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1121682096',0,'43','LAID, JHESORLEY MAGANA','2022-06-23','2022-06-23 08:22:14','2022-06-23 12:10:02','','2022-06-23 13:24:47','2022-06-23 17:15:31','',0.7666666666666666,0,7.23,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('772388405',0,'43','LAID, JHESORLEY MAGANA','2022-06-24','2022-06-24 08:01:57',NULL,'','2022-06-24 12:52:25','2022-06-24 19:32:58','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1590137183',0,'43','LAID, JHESORLEY MAGANA','2022-06-25',NULL,NULL,'','2022-06-25 13:24:51','2022-06-25 23:40:49','',0.4,0,3.6,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('516361499',0,'43','LAID, JHESORLEY MAGANA','2022-06-26','2022-06-26 09:45:56',NULL,'',NULL,'2022-06-26 19:09:17','',0,0,0,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('598053784',0,'43','LAID, JHESORLEY MAGANA','2022-06-27','2022-06-27 08:25:49','2022-06-27 12:07:48','',NULL,NULL,'',0.4166666666666667,0,3.58,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1059007933',0,'43','LAID, JHESORLEY MAGANA','2022-06-28','2022-06-28 09:23:34','2022-06-28 12:08:36','','2022-06-28 12:57:20','2022-06-28 17:22:55','',1.3833333333333333,0,6.62,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1269611822',0,'43','LAID, JHESORLEY MAGANA','2022-06-29','2022-06-29 06:49:33',NULL,'',NULL,'2022-06-29 19:50:55','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('435542375',0,'43','LAID, JHESORLEY MAGANA','2022-06-30','2022-06-30 08:14:03','2022-06-30 12:13:29','','2022-06-30 12:46:16','2022-06-30 18:01:26','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('369586612',0,'43','LAID, JHESORLEY MAGANA','2022-07-16','2022-07-16 08:11:06',NULL,'',NULL,'2022-07-16 17:58:17','',0,0,0,'0','','','','','','','',0,'2022-07-16 08:00:00','2022-07-16 17:00:00','regular','N/A','N/A',0,0),('1210909775',0,'43','LAID, JHESORLEY MAGANA','2022-07-17','2022-07-17 08:41:27',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-17 08:00:00','2022-07-17 17:00:00','regular','N/A','N/A',0,0),('8373156',0,'43','LAID, JHESORLEY MAGANA','2022-07-18','2022-07-18 08:21:04','2022-07-18 12:22:37','',NULL,'2022-07-18 20:10:45','',0.35,0,3.65,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1854706387',0,'43','LAID, JHESORLEY MAGANA','2022-07-19','2022-07-19 08:16:21','2022-07-19 12:03:30','','2022-07-19 13:28:17','2022-07-19 18:06:17','',0.7333333333333334,0,7.26,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('884934751',0,'43','LAID, JHESORLEY MAGANA','2022-07-20','2022-07-20 08:16:38','2022-07-20 12:41:10','','2022-07-20 12:51:28','2022-07-20 18:09:43','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('3588425',0,'43','LAID, JHESORLEY MAGANA','2022-07-21','2022-07-21 08:22:59','2022-07-21 12:04:42','','2022-07-21 12:18:15','2022-07-21 17:07:39','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('223281227',0,'43','LAID, JHESORLEY MAGANA','2022-07-22','2022-07-22 08:11:44','2022-07-22 12:11:53','','2022-07-22 13:28:19','2022-07-22 17:56:25','',0.65,0,7.35,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1684271375',0,'43','LAID, JHESORLEY MAGANA','2022-07-25','2022-07-25 08:35:02','2022-07-25 12:25:21','','2022-07-25 12:53:45','2022-07-25 22:27:27','',0.5833333333333334,0,7.42,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('542633211',0,'44','LASTIMOSO, DINO ROSALES','2022-06-01','2022-06-01 08:19:28','2022-06-01 12:05:54','','2022-06-01 13:08:13','2022-06-01 17:42:52','',0.44999999999999996,0,7.550000000000001,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('693695821',0,'44','LASTIMOSO, DINO ROSALES','2022-06-02','2022-06-02 08:08:33','2022-06-02 12:09:58','','2022-06-02 13:06:08','2022-06-02 17:12:38','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('679771918',0,'44','LASTIMOSO, DINO ROSALES','2022-06-03','2022-06-03 08:09:59','2022-06-03 12:04:26','','2022-06-03 13:17:35','2022-06-03 17:24:48','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1306731414',0,'44','LASTIMOSO, DINO ROSALES','2022-06-06','2022-06-06 08:05:46','2022-06-06 12:28:12','','2022-06-06 13:08:51','2022-06-06 18:36:10','',0.21666666666666667,0,7.79,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('116279943',0,'44','LASTIMOSO, DINO ROSALES','2022-06-07','2022-06-07 08:53:10','2022-06-07 12:05:41','','2022-06-07 12:16:01','2022-06-07 18:12:34','',0.8833333333333333,0,7.12,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('135947824',0,'44','LASTIMOSO, DINO ROSALES','2022-06-08','2022-06-08 08:09:07','2022-06-08 12:13:05','','2022-06-08 13:12:33','2022-06-08 18:56:45','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1703527288',0,'44','LASTIMOSO, DINO ROSALES','2022-06-09','2022-06-09 05:18:58',NULL,'',NULL,'2022-06-09 17:33:26','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1716917998',0,'44','LASTIMOSO, DINO ROSALES','2022-06-13','2022-06-13 08:14:06',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1821783162',0,'44','LASTIMOSO, DINO ROSALES','2022-06-14','2022-06-14 08:17:18','2022-06-14 12:17:03','','2022-06-14 12:53:53','2022-06-14 17:19:49','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('2031799482',0,'44','LASTIMOSO, DINO ROSALES','2022-06-15','2022-06-15 08:31:21','2022-06-15 12:12:11','',NULL,NULL,'',0.5166666666666667,0,3.48,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('889203473',0,'44','LASTIMOSO, DINO ROSALES','2022-06-16','2022-06-16 08:04:11','2022-06-16 12:05:22','',NULL,NULL,'',0.06666666666666667,0,3.93,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('661652579',0,'44','LASTIMOSO, DINO ROSALES','2022-06-17','2022-06-17 08:06:59','2022-06-17 12:00:12','','2022-06-17 12:55:17','2022-06-17 17:09:46','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('750496692',0,'44','LASTIMOSO, DINO ROSALES','2022-06-20',NULL,NULL,'','2022-06-20 13:10:09','2022-06-20 17:23:42','',0.16666666666666666,0,3.83,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('510140210',0,'44','LASTIMOSO, DINO ROSALES','2022-06-21','2022-06-21 08:05:31','2022-06-21 12:02:45','','2022-06-21 13:15:42','2022-06-21 17:09:08','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1178372794',0,'44','LASTIMOSO, DINO ROSALES','2022-06-23','2022-06-23 07:51:45',NULL,'','2022-06-23 13:21:17','2022-06-23 17:02:07','',0.35,0,3.65,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1617615482',0,'44','LASTIMOSO, DINO ROSALES','2022-06-27','2022-06-27 08:41:30','2022-06-27 12:12:05','',NULL,'2022-06-27 17:43:10','',0.6833333333333333,0,3.32,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1758086836',0,'44','LASTIMOSO, DINO ROSALES','2022-06-28','2022-06-28 09:08:36','2022-06-28 12:12:41','',NULL,'2022-06-28 17:46:38','',1.1333333333333333,0,2.87,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('10361386',0,'44','LASTIMOSO, DINO ROSALES','2022-06-29',NULL,NULL,'',NULL,'2022-06-29 17:44:25','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1014982800',0,'44','LASTIMOSO, DINO ROSALES','2022-06-30','2022-06-30 08:49:20','2022-06-30 12:01:37','','2022-06-30 13:26:04','2022-06-30 17:02:43','',1.25,0,6.75,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1253912470',0,'44','LASTIMOSO, DINO ROSALES','2022-07-18','2022-07-18 08:51:54','2022-07-18 12:12:34','','2022-07-18 13:27:54','2022-07-18 17:19:09','',1.3,0,6.699999999999999,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1836803902',0,'44','LASTIMOSO, DINO ROSALES','2022-07-19','2022-07-19 09:04:21','2022-07-19 12:10:50','','2022-07-19 13:29:04','2022-07-19 17:09:32','',1.55,0,6.45,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1264109100',0,'44','LASTIMOSO, DINO ROSALES','2022-07-21','2022-07-21 08:34:52','2022-07-21 12:13:27','','2022-07-21 13:20:40','2022-07-21 17:11:30','',0.8999999999999999,0,7.1,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('890676892',0,'44','LASTIMOSO, DINO ROSALES','2022-07-26','2022-07-26 08:20:46',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('955072262',0,'45','LAPINID, MARIBEL SOLANO','2022-06-01','2022-06-01 08:30:35','2022-06-01 12:06:54','','2022-06-01 12:46:41','2022-06-01 17:15:13','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1001325891',0,'45','LAPINID, MARIBEL SOLANO','2022-06-03','2022-06-03 08:34:23','2022-06-03 12:01:41','',NULL,NULL,'',0.5666666666666667,0,3.43,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('608631660',0,'45','LAPINID, MARIBEL SOLANO','2022-06-06','2022-06-06 08:20:09','2022-06-06 12:21:37','','2022-06-06 12:57:41','2022-06-06 17:07:17','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1971321969',0,'45','LAPINID, MARIBEL SOLANO','2022-06-07','2022-06-07 08:26:48','2022-06-07 12:15:02','','2022-06-07 12:59:05','2022-06-07 17:42:48','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('875325891',0,'45','LAPINID, MARIBEL SOLANO','2022-06-08',NULL,'2022-06-08 12:34:30','','2022-06-08 12:58:55','2022-06-08 17:07:20','',0,0,4,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1533395204',0,'45','LAPINID, MARIBEL SOLANO','2022-06-09','2022-06-09 08:22:46','2022-06-09 12:10:54','','2022-06-09 13:01:13','2022-06-09 17:32:03','',0.3833333333333333,0,7.609999999999999,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1975471919',0,'45','LAPINID, MARIBEL SOLANO','2022-06-10','2022-06-10 08:23:08','2022-06-10 12:25:44','','2022-06-10 12:57:57','2022-06-10 18:04:39','',0.38333333333333336,0,7.62,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('2042284275',0,'45','LAPINID, MARIBEL SOLANO','2022-06-13','2022-06-13 08:21:19','2022-06-13 12:03:06','','2022-06-13 12:23:46','2022-06-13 17:10:24','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('952815897',0,'45','LAPINID, MARIBEL SOLANO','2022-06-14',NULL,'2022-06-14 12:01:03','','2022-06-14 12:32:05','2022-06-14 17:09:05','',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1892169077',0,'45','LAPINID, MARIBEL SOLANO','2022-06-15','2022-06-15 08:16:58','2022-06-15 12:38:38','','2022-06-15 12:50:47','2022-06-15 17:15:01','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1943395488',0,'45','LAPINID, MARIBEL SOLANO','2022-06-16','2022-06-16 08:05:38','2022-06-16 12:00:19','','2022-06-16 12:51:23','2022-06-16 17:14:59','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1120540475',0,'45','LAPINID, MARIBEL SOLANO','2022-06-17','2022-06-17 09:21:24','2022-06-17 12:01:12','','2022-06-17 12:48:16','2022-06-17 17:12:55','',1.35,0,6.65,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1787178122',0,'45','LAPINID, MARIBEL SOLANO','2022-06-20','2022-06-20 08:20:12','2022-06-20 12:00:59','','2022-06-20 12:45:24','2022-06-20 17:03:13','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1000989407',0,'45','LAPINID, MARIBEL SOLANO','2022-06-21','2022-06-21 08:12:10','2022-06-21 12:00:17','',NULL,'2022-06-21 17:00:51','',0.2,0,3.8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1424316052',0,'45','LAPINID, MARIBEL SOLANO','2022-06-22','2022-06-22 08:28:44','2022-06-22 12:15:45','','2022-06-22 12:52:05','2022-06-22 17:19:44','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1944820937',0,'45','LAPINID, MARIBEL SOLANO','2022-06-23','2022-06-23 08:18:34','2022-06-23 12:15:45','','2022-06-23 12:28:10','2022-06-23 17:06:07','',0.3,0,7.7,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1666146715',0,'45','LAPINID, MARIBEL SOLANO','2022-06-24','2022-06-24 08:33:09',NULL,'','2022-06-24 12:58:52','2022-06-24 17:39:20','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1352444731',0,'45','LAPINID, MARIBEL SOLANO','2022-06-27','2022-06-27 08:34:56',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('550984305',0,'45','LAPINID, MARIBEL SOLANO','2022-06-28','2022-06-28 09:34:21',NULL,'','2022-06-28 13:09:54','2022-06-28 17:18:50','',0.15,0,3.85,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('754272272',0,'45','LAPINID, MARIBEL SOLANO','2022-07-18','2022-07-18 08:27:56','2022-07-18 12:18:42','','2022-07-18 12:31:18','2022-07-18 17:14:11','',0.45,0,7.55,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1748472019',0,'45','LAPINID, MARIBEL SOLANO','2022-07-19',NULL,'2022-07-19 12:13:25','','2022-07-19 12:29:31','2022-07-19 17:12:09','',0,0,4,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('671107222',0,'45','LAPINID, MARIBEL SOLANO','2022-07-20','2022-07-20 08:43:24','2022-07-20 12:27:21','','2022-07-20 12:57:43','2022-07-20 17:15:05','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1369690417',0,'45','LAPINID, MARIBEL SOLANO','2022-07-22','2022-07-22 08:09:52','2022-07-22 12:08:07','','2022-07-22 12:19:14','2022-07-22 17:21:21','',0.15,0,7.85,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1136522485',0,'45','LAPINID, MARIBEL SOLANO','2022-07-25','2022-07-25 08:13:00','2022-07-25 12:28:45','','2022-07-25 12:38:53','2022-07-25 17:07:37','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('344709085',0,'46','LECCIONES, DONALD GONZAGA','2022-06-01','2022-06-01 07:38:57','2022-06-01 12:01:10','','2022-06-01 12:37:44','2022-06-01 18:24:22','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('2118401431',0,'46','LECCIONES, DONALD GONZAGA','2022-06-02','2022-06-02 07:39:04','2022-06-02 12:05:15','','2022-06-02 12:25:52','2022-06-02 18:09:56','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('164887028',0,'46','LECCIONES, DONALD GONZAGA','2022-06-03','2022-06-03 06:50:34','2022-06-03 12:04:02','','2022-06-03 12:15:38','2022-06-03 17:06:35','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1656379155',0,'46','LECCIONES, DONALD GONZAGA','2022-06-06','2022-06-06 08:04:15','2022-06-06 12:07:54','','2022-06-06 12:18:25','2022-06-06 18:37:09','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1209635082',0,'46','LECCIONES, DONALD GONZAGA','2022-06-07','2022-06-07 07:49:52','2022-06-07 12:03:46','','2022-06-07 12:42:46','2022-06-07 18:04:30','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('679315894',0,'46','LECCIONES, DONALD GONZAGA','2022-06-08','2022-06-08 07:50:05',NULL,'','2022-06-08 12:33:21','2022-06-08 18:03:18','',0,0,4,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1257464820',0,'46','LECCIONES, DONALD GONZAGA','2022-06-09','2022-06-09 07:35:57','2022-06-09 12:03:37','','2022-06-09 12:25:18','2022-06-09 18:15:08','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('511036997',0,'46','LECCIONES, DONALD GONZAGA','2022-06-10','2022-06-10 08:12:36','2022-06-10 12:06:01','','2022-06-10 12:19:00','2022-06-10 18:29:45','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('880650308',0,'46','LECCIONES, DONALD GONZAGA','2022-06-14','2022-06-14 07:33:08','2022-06-14 12:01:11','','2022-06-14 12:30:33','2022-06-14 18:27:38','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1249221539',0,'46','LECCIONES, DONALD GONZAGA','2022-06-15','2022-06-15 07:21:44','2022-06-15 12:07:48','','2022-06-15 12:22:32','2022-06-15 18:11:47','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('2104090684',0,'46','LECCIONES, DONALD GONZAGA','2022-06-16','2022-06-16 07:48:31','2022-06-16 12:02:47','','2022-06-16 12:14:31','2022-06-16 18:16:56','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('280242118',0,'46','LECCIONES, DONALD GONZAGA','2022-06-17','2022-06-17 07:24:03','2022-06-17 12:02:20','','2022-06-17 12:20:23','2022-06-17 18:10:05','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1593444292',0,'46','LECCIONES, DONALD GONZAGA','2022-06-18','2022-06-18 10:28:59',NULL,'',NULL,'2022-06-18 17:52:54','',0,0,0,'0','','','','','','','',0,'2022-06-18 08:00:00','2022-06-18 17:00:00','regular','N/A','N/A',0,0),('516084170',0,'46','LECCIONES, DONALD GONZAGA','2022-06-19','2022-06-19 10:47:00',NULL,'',NULL,'2022-06-19 18:44:14','',0,0,0,'0','','','','','','','',0,'2022-06-19 08:00:00','2022-06-19 17:00:00','regular','N/A','N/A',0,0),('857090178',0,'46','LECCIONES, DONALD GONZAGA','2022-06-20','2022-06-20 08:15:14','2022-06-20 12:21:37','','2022-06-20 12:36:25','2022-06-20 18:28:38','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('520156007',0,'46','LECCIONES, DONALD GONZAGA','2022-06-21',NULL,'2022-06-21 12:03:47','','2022-06-21 12:21:04','2022-06-21 18:07:59','',0,0,4,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('270814348',0,'46','LECCIONES, DONALD GONZAGA','2022-06-22','2022-06-22 07:34:40','2022-06-22 12:01:07','','2022-06-22 12:12:40','2022-06-22 18:23:07','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('159590832',0,'46','LECCIONES, DONALD GONZAGA','2022-06-23','2022-06-23 08:04:54','2022-06-23 12:01:18','','2022-06-23 18:56:14',NULL,'',0.06666666666666667,0,3.93,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('284350624',0,'46','LECCIONES, DONALD GONZAGA','2022-06-24','2022-06-24 07:46:00','2022-06-24 12:00:31','','2022-06-24 12:13:10','2022-06-24 17:55:38','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1664961749',0,'46','LECCIONES, DONALD GONZAGA','2022-06-27','2022-06-27 07:50:17','2022-06-27 12:02:17','','2022-06-27 12:13:53','2022-06-27 18:08:05','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1817515213',0,'46','LECCIONES, DONALD GONZAGA','2022-06-28','2022-06-28 08:16:37','2022-06-28 12:00:32','','2022-06-28 12:16:04','2022-06-28 17:57:54','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1451709656',0,'46','LECCIONES, DONALD GONZAGA','2022-06-29',NULL,NULL,'',NULL,'2022-06-29 13:01:51','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1266976434',0,'46','LECCIONES, DONALD GONZAGA','2022-06-30','2022-06-30 08:12:09','2022-06-30 12:03:36','','2022-06-30 12:30:22','2022-06-30 17:30:51','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1829290631',0,'46','LECCIONES, DONALD GONZAGA','2022-07-16','2022-07-16 07:41:37',NULL,'',NULL,'2022-07-16 18:25:22','',0,0,0,'0','','','','','','','',0,'2022-07-16 08:00:00','2022-07-16 17:00:00','regular','N/A','N/A',0,0),('1489727832',0,'46','LECCIONES, DONALD GONZAGA','2022-07-18','2022-07-18 07:35:22','2022-07-18 12:30:51','','2022-07-18 12:41:26','2022-07-18 18:20:34','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1377097657',0,'46','LECCIONES, DONALD GONZAGA','2022-07-19','2022-07-19 07:28:55','2022-07-19 12:02:52','','2022-07-19 12:13:18','2022-07-19 18:40:18','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1284629059',0,'46','LECCIONES, DONALD GONZAGA','2022-07-20','2022-07-20 07:04:10','2022-07-20 12:09:52','','2022-07-20 12:20:32','2022-07-20 18:46:03','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('82467656',0,'46','LECCIONES, DONALD GONZAGA','2022-07-21','2022-07-21 07:15:49','2022-07-21 12:05:23','','2022-07-21 12:16:03','2022-07-21 20:23:55','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1937701713',0,'46','LECCIONES, DONALD GONZAGA','2022-07-22','2022-07-22 07:04:35','2022-07-22 12:04:34','','2022-07-22 12:23:47','2022-07-22 18:28:23','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('13826412',0,'46','LECCIONES, DONALD GONZAGA','2022-07-23','2022-07-23 09:25:22',NULL,'',NULL,'2022-07-23 18:04:30','',0,0,0,'0','','','','','','','',0,'2022-07-23 08:00:00','2022-07-23 17:00:00','regular','N/A','N/A',0,0),('1178146227',0,'46','LECCIONES, DONALD GONZAGA','2022-07-25','2022-07-25 07:53:50','2022-07-25 12:04:44','','2022-07-25 12:15:57','2022-07-25 19:48:09','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1600736699',0,'46','LECCIONES, DONALD GONZAGA','2022-07-26','2022-07-26 07:52:15',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('870803199',0,'47','LETIGIO, REJOY POGADO','2022-06-01','2022-06-01 07:57:58','2022-06-01 12:02:44','','2022-06-01 12:17:41','2022-06-01 17:09:14','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1481043988',0,'47','LETIGIO, REJOY POGADO','2022-06-02','2022-06-02 08:12:15','2022-06-02 12:06:54','','2022-06-02 12:17:59','2022-06-02 17:09:25','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('87419221',0,'47','LETIGIO, REJOY POGADO','2022-06-03','2022-06-03 07:51:57','2022-06-03 12:02:43','','2022-06-03 12:19:57','2022-06-03 17:07:32','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('724427695',0,'47','LETIGIO, REJOY POGADO','2022-06-05',NULL,NULL,'','2022-06-05 13:07:58','2022-06-05 17:10:26','',0.11666666666666667,0,3.88,'0','','','','','','','',0,'2022-06-05 08:00:00','2022-06-05 17:00:00','regular','N/A','N/A',0,0),('1345307125',0,'47','LETIGIO, REJOY POGADO','2022-06-06',NULL,NULL,'','2022-06-06 12:46:46','2022-06-06 17:11:30','',0,0,4,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1626286847',0,'47','LETIGIO, REJOY POGADO','2022-06-07','2022-06-07 07:35:13',NULL,'',NULL,'2022-06-07 17:14:15','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('2008639058',0,'47','LETIGIO, REJOY POGADO','2022-06-08','2022-06-08 07:52:56','2022-06-08 12:04:06','','2022-06-08 12:23:16','2022-06-08 17:12:30','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('599091717',0,'47','LETIGIO, REJOY POGADO','2022-06-09','2022-06-09 07:48:12','2022-06-09 12:01:33','','2022-06-09 12:14:42','2022-06-09 17:11:55','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1262851487',0,'47','LETIGIO, REJOY POGADO','2022-06-10','2022-06-10 08:09:39','2022-06-10 12:07:50','','2022-06-10 12:22:30','2022-06-10 15:03:24','',0.15,1.9333333333333333,5.92,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1683237771',0,'47','LETIGIO, REJOY POGADO','2022-06-13','2022-06-13 07:57:37','2022-06-13 12:01:19','','2022-06-13 12:20:29','2022-06-13 17:11:35','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1978312949',0,'47','LETIGIO, REJOY POGADO','2022-06-14','2022-06-14 08:11:02','2022-06-14 12:07:26','','2022-06-14 12:25:39','2022-06-14 17:26:42','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1750576012',0,'47','LETIGIO, REJOY POGADO','2022-06-15','2022-06-15 07:55:33','2022-06-15 12:09:45','','2022-06-15 12:21:13','2022-06-15 17:18:02','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('893144362',0,'47','LETIGIO, REJOY POGADO','2022-06-16','2022-06-16 08:16:23','2022-06-16 12:04:01','','2022-06-16 12:17:42','2022-06-16 18:27:21','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1031579150',0,'47','LETIGIO, REJOY POGADO','2022-06-17','2022-06-17 07:45:05','2022-06-17 12:04:05','','2022-06-17 12:19:14','2022-06-17 18:16:32','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1202647080',0,'47','LETIGIO, REJOY POGADO','2022-06-20','2022-06-20 07:22:45','2022-06-20 12:34:25','','2022-06-20 12:58:54','2022-06-20 17:27:53','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1208115753',0,'47','LETIGIO, REJOY POGADO','2022-06-21','2022-06-21 07:46:21','2022-06-21 12:00:55','','2022-06-21 12:45:11','2022-06-21 17:21:03','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('148522037',0,'47','LETIGIO, REJOY POGADO','2022-06-22','2022-06-22 08:09:30','2022-06-22 12:26:48','','2022-06-22 12:11:54','2022-06-22 17:21:33','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1331841576',0,'47','LETIGIO, REJOY POGADO','2022-06-23','2022-06-23 07:43:51',NULL,'',NULL,'2022-06-23 17:24:33','',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1412169544',0,'47','LETIGIO, REJOY POGADO','2022-06-24','2022-06-24 07:46:58',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1750449743',0,'47','LETIGIO, REJOY POGADO','2022-06-27','2022-06-27 07:55:49','2022-06-27 12:04:59','','2022-06-27 12:24:40','2022-06-27 17:14:44','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1050735321',0,'47','LETIGIO, REJOY POGADO','2022-06-28','2022-06-28 08:00:04','2022-06-28 12:01:12','','2022-06-28 12:12:27','2022-06-28 17:10:44','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('995433213',0,'47','LETIGIO, REJOY POGADO','2022-06-29','2022-06-29 08:07:47','2022-06-29 12:22:57','','2022-06-29 12:33:54','2022-06-29 17:23:39','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1297781854',0,'47','LETIGIO, REJOY POGADO','2022-06-30','2022-06-30 08:01:01','2022-06-30 12:29:19','','2022-06-30 12:47:05','2022-06-30 17:08:05','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1539508334',0,'47','LETIGIO, REJOY POGADO','2022-07-18','2022-07-18 08:00:04','2022-07-18 12:17:00','','2022-07-18 13:08:01','2022-07-18 17:04:26','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('724466216',0,'47','LETIGIO, REJOY POGADO','2022-07-19','2022-07-19 08:04:11','2022-07-19 12:23:38','','2022-07-19 12:33:57','2022-07-19 17:09:02','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('892231962',0,'47','LETIGIO, REJOY POGADO','2022-07-20','2022-07-20 08:05:56','2022-07-20 12:19:21','','2022-07-20 12:36:13','2022-07-20 17:29:26','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1744979491',0,'47','LETIGIO, REJOY POGADO','2022-07-21','2022-07-21 08:15:12','2022-07-21 12:04:06','','2022-07-21 12:33:24','2022-07-21 17:12:57','',0.25,0,7.75,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1476134200',0,'47','LETIGIO, REJOY POGADO','2022-07-25','2022-07-25 08:18:19','2022-07-25 12:05:40','','2022-07-25 12:40:28','2022-07-25 17:24:03','',0.3,0,7.7,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('84462578',0,'47','LETIGIO, REJOY POGADO','2022-07-26','2022-07-26 07:55:54',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('385683571',0,'48','LICO, ROZYL ROMA','2022-06-01','2022-06-01 07:57:04','2022-06-01 12:08:09','','2022-06-01 12:46:54','2022-06-01 17:16:38','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('450287594',0,'48','LICO, ROZYL ROMA','2022-06-02','2022-06-02 07:33:52','2022-06-02 12:20:13','','2022-06-02 12:31:53','2022-06-02 17:06:40','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('933165476',0,'48','LICO, ROZYL ROMA','2022-06-03','2022-06-03 07:53:19','2022-06-03 12:12:58','','2022-06-03 12:54:33','2022-06-03 17:07:54','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1795909953',0,'48','LICO, ROZYL ROMA','2022-06-06','2022-06-06 06:09:45','2022-06-06 12:03:13','','2022-06-06 12:49:21','2022-06-06 18:05:02','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('649577966',0,'48','LICO, ROZYL ROMA','2022-06-07','2022-06-07 07:24:08','2022-06-07 12:25:34','','2022-06-07 12:39:11','2022-06-07 17:59:14','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('348851939',0,'48','LICO, ROZYL ROMA','2022-06-08','2022-06-08 07:39:49','2022-06-08 12:00:26','','2022-06-08 12:45:47','2022-06-08 17:22:52','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('197096146',0,'48','LICO, ROZYL ROMA','2022-06-09','2022-06-09 07:28:06','2022-06-09 12:32:19','','2022-06-09 12:45:42','2022-06-09 17:25:45','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1600794735',0,'48','LICO, ROZYL ROMA','2022-06-10','2022-06-10 07:53:08','2022-06-10 12:00:25','','2022-06-10 12:23:55','2022-06-10 17:03:52','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('251198263',0,'48','LICO, ROZYL ROMA','2022-06-13','2022-06-13 07:43:27','2022-06-13 12:29:41','','2022-06-13 12:43:55','2022-06-13 17:03:00','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1455706104',0,'48','LICO, ROZYL ROMA','2022-06-14','2022-06-14 07:52:15','2022-06-14 12:08:41','','2022-06-14 12:48:15','2022-06-14 17:57:23','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('604843202',0,'48','LICO, ROZYL ROMA','2022-06-15','2022-06-15 07:57:36','2022-06-15 12:01:44','','2022-06-15 12:40:05','2022-06-15 17:56:39','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('35432451',0,'48','LICO, ROZYL ROMA','2022-06-16','2022-06-16 07:58:50','2022-06-16 12:00:05','','2022-06-16 12:31:03','2022-06-16 18:27:11','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('925727083',0,'48','LICO, ROZYL ROMA','2022-06-17','2022-06-17 07:59:08','2022-06-17 12:05:55','','2022-06-17 12:50:11','2022-06-17 17:17:06','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('884365936',0,'48','LICO, ROZYL ROMA','2022-06-20','2022-06-20 07:42:26','2022-06-20 12:15:02','','2022-06-20 12:32:50','2022-06-20 18:16:22','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('696160617',0,'48','LICO, ROZYL ROMA','2022-06-21','2022-06-21 07:27:15','2022-06-21 12:02:37','','2022-06-21 12:40:41','2022-06-21 17:27:43','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1665861855',0,'48','LICO, ROZYL ROMA','2022-06-22','2022-06-22 07:34:50',NULL,'',NULL,'2022-06-22 19:02:12','',0,0,0,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('965226349',0,'48','LICO, ROZYL ROMA','2022-06-23','2022-06-23 07:58:05','2022-06-23 12:03:01','','2022-06-23 12:43:24','2022-06-23 18:30:55','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1963428124',0,'48','LICO, ROZYL ROMA','2022-06-24','2022-06-24 07:50:51','2022-06-24 12:09:08','','2022-06-24 12:32:27','2022-06-24 17:25:16','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('23663552',0,'48','LICO, ROZYL ROMA','2022-06-27','2022-06-27 07:55:56','2022-06-27 12:00:10','','2022-06-27 12:51:20','2022-06-27 17:41:32','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('237393556',0,'48','LICO, ROZYL ROMA','2022-06-28','2022-06-28 07:57:36','2022-06-28 12:00:45','','2022-06-28 12:45:22','2022-06-28 17:15:47','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1879912147',0,'48','LICO, ROZYL ROMA','2022-06-29','2022-06-29 07:56:22','2022-06-29 12:00:26','','2022-06-29 12:30:23','2022-06-29 19:13:09','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('203381609',0,'48','LICO, ROZYL ROMA','2022-06-30','2022-06-30 07:57:37','2022-06-30 12:08:41','','2022-06-30 12:20:43','2022-06-30 17:08:22','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1472845657',0,'48','LICO, ROZYL ROMA','2022-07-18','2022-07-18 07:58:43','2022-07-18 12:02:45','','2022-07-18 12:14:47','2022-07-18 17:24:22','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('100764164',0,'48','LICO, ROZYL ROMA','2022-07-19','2022-07-19 07:57:15','2022-07-19 12:28:53','','2022-07-19 12:39:50','2022-07-19 17:10:04','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('889819335',0,'48','LICO, ROZYL ROMA','2022-07-20','2022-07-20 07:58:29','2022-07-20 12:00:56','','2022-07-20 12:15:00','2022-07-20 17:19:25','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1229913552',0,'48','LICO, ROZYL ROMA','2022-07-21','2022-07-21 07:58:30','2022-07-21 12:05:05','','2022-07-21 12:56:59','2022-07-21 17:00:41','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('2083622808',0,'48','LICO, ROZYL ROMA','2022-07-22','2022-07-22 07:58:50','2022-07-22 12:03:02','','2022-07-22 12:59:03','2022-07-22 17:23:15','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('158926360',0,'48','LICO, ROZYL ROMA','2022-07-25','2022-07-25 07:52:05','2022-07-25 12:02:05','','2022-07-25 12:51:11','2022-07-25 17:13:34','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1275091021',0,'48','LICO, ROZYL ROMA','2022-07-26','2022-07-26 08:00:29',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('521013888',0,'49','LOPEZ, NORA LUMIARES','2022-06-01','2022-06-01 07:33:49',NULL,'',NULL,'2022-06-01 17:10:53','',0,0,0,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('778062906',0,'49','LOPEZ, NORA LUMIARES','2022-06-02','2022-06-02 07:26:15',NULL,'',NULL,'2022-06-02 17:05:33','',0,0,0,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('404895353',0,'49','LOPEZ, NORA LUMIARES','2022-06-03','2022-06-03 07:08:04',NULL,'',NULL,'2022-06-03 17:04:04','',0,0,0,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1234439713',0,'49','LOPEZ, NORA LUMIARES','2022-06-06','2022-06-06 07:11:59',NULL,'',NULL,'2022-06-06 17:06:06','',0,0,0,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1139635901',0,'49','LOPEZ, NORA LUMIARES','2022-06-07','2022-06-07 07:20:43',NULL,'',NULL,'2022-06-07 17:05:11','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1069732270',0,'49','LOPEZ, NORA LUMIARES','2022-06-08','2022-06-08 07:30:18',NULL,'',NULL,'2022-06-08 17:06:44','',0,0,0,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('581368953',0,'49','LOPEZ, NORA LUMIARES','2022-06-09','2022-06-09 07:23:16',NULL,'',NULL,'2022-06-09 17:06:49','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1545682679',0,'49','LOPEZ, NORA LUMIARES','2022-06-10','2022-06-10 07:35:57',NULL,'',NULL,'2022-06-10 17:07:47','',0,0,0,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('896668335',0,'49','LOPEZ, NORA LUMIARES','2022-06-13','2022-06-13 06:48:53',NULL,'',NULL,'2022-06-13 17:07:21','',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1382142618',0,'49','LOPEZ, NORA LUMIARES','2022-06-14','2022-06-14 07:20:32',NULL,'',NULL,'2022-06-14 17:07:51','',0,0,0,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('151539222',0,'49','LOPEZ, NORA LUMIARES','2022-06-15','2022-06-15 07:24:55',NULL,'',NULL,'2022-06-15 17:08:55','',0,0,0,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('2020782444',0,'49','LOPEZ, NORA LUMIARES','2022-06-16','2022-06-16 07:13:59',NULL,'',NULL,'2022-06-16 17:06:25','',0,0,0,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('560568046',0,'49','LOPEZ, NORA LUMIARES','2022-06-17','2022-06-17 07:33:26',NULL,'',NULL,'2022-06-17 17:04:29','',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1376951893',0,'49','LOPEZ, NORA LUMIARES','2022-06-20','2022-06-20 07:11:45',NULL,'',NULL,'2022-06-20 17:06:00','',0,0,0,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1736011463',0,'49','LOPEZ, NORA LUMIARES','2022-06-21','2022-06-21 07:40:35',NULL,'',NULL,'2022-06-21 17:07:05','',0,0,0,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1198762433',0,'49','LOPEZ, NORA LUMIARES','2022-06-22','2022-06-22 07:27:55',NULL,'',NULL,'2022-06-22 17:08:56','',0,0,0,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('860607828',0,'49','LOPEZ, NORA LUMIARES','2022-06-23','2022-06-23 07:25:10',NULL,'',NULL,'2022-06-23 17:04:52','',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('129972829',0,'49','LOPEZ, NORA LUMIARES','2022-06-24','2022-06-24 07:29:53',NULL,'','2022-06-24 12:53:32','2022-06-24 17:06:10','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('468965814',0,'49','LOPEZ, NORA LUMIARES','2022-06-26','2022-06-26 08:11:09',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('1048515114',0,'49','LOPEZ, NORA LUMIARES','2022-06-27','2022-06-27 07:36:10',NULL,'',NULL,'2022-06-27 20:44:15','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('669583084',0,'49','LOPEZ, NORA LUMIARES','2022-06-28','2022-06-28 07:45:48',NULL,'',NULL,'2022-06-28 17:13:08','',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1418638849',0,'49','LOPEZ, NORA LUMIARES','2022-06-29','2022-06-29 05:46:07',NULL,'',NULL,'2022-06-29 20:37:09','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1106404720',0,'49','LOPEZ, NORA LUMIARES','2022-06-30','2022-06-30 07:12:02',NULL,'',NULL,'2022-06-30 17:05:48','',0,0,0,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('770025319',0,'49','LOPEZ, NORA LUMIARES','2022-07-18','2022-07-18 07:34:34',NULL,'',NULL,'2022-07-18 17:14:17','',0,0,0,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1421284371',0,'49','LOPEZ, NORA LUMIARES','2022-07-19','2022-07-19 07:29:41',NULL,'',NULL,'2022-07-19 17:08:28','',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1573088443',0,'49','LOPEZ, NORA LUMIARES','2022-07-20','2022-07-20 07:17:47',NULL,'','2022-07-20 17:14:31',NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('566501766',0,'49','LOPEZ, NORA LUMIARES','2022-07-21','2022-07-21 07:20:33','2022-07-21 12:15:41','',NULL,'2022-07-21 17:07:29','',0,0,4,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1691822880',0,'49','LOPEZ, NORA LUMIARES','2022-07-22','2022-07-22 07:35:37',NULL,'',NULL,'2022-07-22 17:04:55','',0,0,0,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1179680393',0,'49','LOPEZ, NORA LUMIARES','2022-07-25','2022-07-25 07:36:46',NULL,'',NULL,'2022-07-25 17:06:50','',0,0,0,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1548623264',0,'49','LOPEZ, NORA LUMIARES','2022-07-26','2022-07-26 07:27:44',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('111744800',0,'5','ARCALA, RITA TABAMO','2022-06-01','2022-06-01 07:19:13','2022-06-01 12:09:27','','2022-06-01 12:20:05','2022-06-01 17:00:12','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('911552699',0,'5','ARCALA, RITA TABAMO','2022-06-02','2022-06-02 07:22:02','2022-06-02 12:02:17','','2022-06-02 12:13:02','2022-06-02 17:00:06','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('791120669',0,'5','ARCALA, RITA TABAMO','2022-06-03','2022-06-03 07:02:36',NULL,'','2022-06-03 12:12:46','2022-06-03 16:42:44','',0,0.2833333333333333,3.72,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1470307523',0,'5','ARCALA, RITA TABAMO','2022-06-06','2022-06-06 07:05:30','2022-06-06 12:20:47','','2022-06-06 12:31:10','2022-06-06 16:59:19','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1037346478',0,'5','ARCALA, RITA TABAMO','2022-06-07','2022-06-07 08:28:39','2022-06-07 12:04:19','','2022-06-07 12:15:10','2022-06-07 16:20:17','',0.4666666666666667,0.65,6.88,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1756960335',0,'5','ARCALA, RITA TABAMO','2022-06-08','2022-06-08 07:27:28','2022-06-08 12:09:23','','2022-06-08 12:24:25','2022-06-08 17:00:01','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1486130691',0,'5','ARCALA, RITA TABAMO','2022-06-09',NULL,'2022-06-09 12:11:06','',NULL,'2022-06-09 17:02:18','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('575956778',0,'5','ARCALA, RITA TABAMO','2022-06-10',NULL,'2022-06-10 12:31:11','','2022-06-10 12:57:35','2022-06-10 17:00:01','',0,0,4,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('49846675',0,'5','ARCALA, RITA TABAMO','2022-06-13','2022-06-13 07:15:57','2022-06-13 12:00:01','','2022-06-13 12:11:22','2022-06-13 17:00:28','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1510377162',0,'5','ARCALA, RITA TABAMO','2022-06-14','2022-06-14 07:40:00','2022-06-14 12:26:54','','2022-06-14 12:37:01',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1547086409',0,'5','ARCALA, RITA TABAMO','2022-06-15','2022-06-15 06:59:40','2022-06-15 12:22:02','','2022-06-15 12:34:36','2022-06-15 15:23:12','',0,1.6,6.4,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1914522110',0,'5','ARCALA, RITA TABAMO','2022-06-16','2022-06-16 07:26:29','2022-06-16 12:23:09','','2022-06-16 12:34:03','2022-06-16 17:00:37','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1683142449',0,'5','ARCALA, RITA TABAMO','2022-06-17','2022-06-17 07:43:29','2022-06-17 12:30:10','','2022-06-17 12:41:20',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1890476843',0,'5','ARCALA, RITA TABAMO','2022-06-20','2022-06-20 07:37:35','2022-06-20 12:11:20','','2022-06-20 12:23:13',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('328916991',0,'5','ARCALA, RITA TABAMO','2022-06-21','2022-06-21 07:46:16','2022-06-21 12:19:15','','2022-06-21 12:30:20',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1974920314',0,'5','ARCALA, RITA TABAMO','2022-06-22',NULL,'2022-06-22 12:18:52','','2022-06-22 12:30:26','2022-06-22 17:06:02','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('163767982',0,'5','ARCALA, RITA TABAMO','2022-06-23','2022-06-23 07:19:18',NULL,'','2022-06-23 13:09:50','2022-06-23 17:00:17','',0.15,0,3.85,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('898138907',0,'5','ARCALA, RITA TABAMO','2022-06-24','2022-06-24 07:21:58',NULL,'','2022-06-24 12:50:13','2022-06-24 17:00:14','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1619443520',0,'5','ARCALA, RITA TABAMO','2022-06-27','2022-06-27 07:17:01','2022-06-27 12:00:50','','2022-06-27 12:13:19',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('2014406082',0,'5','ARCALA, RITA TABAMO','2022-06-28','2022-06-28 08:31:12','2022-06-28 12:05:46','','2022-06-28 12:37:38','2022-06-28 17:16:03','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('789384513',0,'5','ARCALA, RITA TABAMO','2022-06-30','2022-06-30 07:11:30',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('2105157581',0,'5','ARCALA, RITA TABAMO','2022-07-21','2022-07-21 08:08:10','2022-07-21 12:06:33','','2022-07-21 12:17:17','2022-07-21 16:53:50','',0.13333333333333333,0.1,7.77,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1770591161',0,'5','ARCALA, RITA TABAMO','2022-07-22','2022-07-22 08:19:27','2022-07-22 12:01:28','','2022-07-22 12:16:14','2022-07-22 17:00:02','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1727697083',0,'5','ARCALA, RITA TABAMO','2022-07-23',NULL,NULL,'','2022-07-23 12:47:17',NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-23 08:00:00','2022-07-23 17:00:00','regular','N/A','N/A',0,0),('1097429896',0,'5','ARCALA, RITA TABAMO','2022-07-25','2022-07-25 07:42:47','2022-07-25 12:13:21','','2022-07-25 12:23:59','2022-07-25 17:01:07','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('464246499',0,'5','ARCALA, RITA TABAMO','2022-07-26','2022-07-26 08:06:08',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('191487145',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-01','2022-06-01 08:11:20','2022-06-01 12:03:22','','2022-06-01 12:41:48','2022-06-01 17:42:16','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('923144339',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-02','2022-06-02 08:20:16','2022-06-02 12:05:55','','2022-06-02 12:23:18','2022-06-02 17:53:35','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('897491590',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-03','2022-06-03 08:09:18','2022-06-03 12:03:22','','2022-06-03 12:22:28','2022-06-03 19:53:17','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1269384863',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-06','2022-06-06 08:12:56',NULL,'',NULL,'2022-06-06 17:47:03','',0,0,0,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('159455125',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-07','2022-06-07 07:48:26','2022-06-07 12:00:35','','2022-06-07 12:10:45','2022-06-07 18:05:43','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1744577475',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-08','2022-06-08 08:03:33','2022-06-08 12:16:05','','2022-06-08 12:31:40','2022-06-08 18:38:09','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1077927319',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-09','2022-06-09 08:21:46','2022-06-09 12:10:47','','2022-06-09 12:34:14','2022-06-09 16:27:03','',0.35,0.5333333333333333,7.12,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('181263672',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-13','2022-06-13 07:47:55','2022-06-13 12:29:12','','2022-06-13 12:50:45','2022-06-13 17:37:32','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('622028331',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-14','2022-06-14 08:26:56','2022-06-14 12:09:14','','2022-06-14 12:27:32','2022-06-14 17:33:18','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1630763424',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-15','2022-06-15 08:19:07','2022-06-15 12:21:28','','2022-06-15 12:31:54','2022-06-15 17:27:45','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1370999224',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-16','2022-06-16 08:17:23','2022-06-16 12:06:42','','2022-06-16 12:16:55','2022-06-16 21:30:29','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('2009338817',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-17','2022-06-17 08:16:51','2022-06-17 12:11:50','','2022-06-17 12:22:53','2022-06-17 18:18:25','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('219025542',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-20','2022-06-20 07:55:31','2022-06-20 12:30:39','','2022-06-20 12:42:04','2022-06-20 17:23:49','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('632682055',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-21','2022-06-21 08:19:57','2022-06-21 12:46:54','','2022-06-21 12:56:58','2022-06-21 17:13:03','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1298136308',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-22','2022-06-22 09:02:07','2022-06-22 12:24:23','','2022-06-22 12:51:31','2022-06-22 17:29:42','',1.0333333333333334,0,6.970000000000001,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1437668247',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-23','2022-06-23 08:10:08','2022-06-23 12:04:33','','2022-06-23 12:24:03','2022-06-23 17:57:07','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1540256775',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-24','2022-06-24 08:19:19','2022-06-24 12:02:59','','2022-06-24 12:34:15','2022-06-24 17:59:03','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1216436716',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-27','2022-06-27 08:04:03','2022-06-27 12:08:15','','2022-06-27 12:25:43','2022-06-27 17:18:56','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('312571049',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-28','2022-06-28 08:22:04','2022-06-28 12:01:29','','2022-06-28 12:31:48','2022-06-28 17:52:06','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('2096455488',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-29','2022-06-29 08:20:29','2022-06-29 12:01:59','','2022-06-29 12:13:49','2022-06-29 19:22:38','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1234410211',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-06-30','2022-06-30 08:11:28','2022-06-30 12:28:39','','2022-06-30 12:47:38','2022-06-30 17:38:51','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1196019372',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-07-19','2022-07-19 08:18:33',NULL,'',NULL,'2022-07-19 17:10:29','',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('401837805',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-07-20','2022-07-20 08:29:39','2022-07-20 12:00:36','','2022-07-20 12:35:05','2022-07-20 17:30:02','',0.48333333333333334,0,7.52,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1549435726',0,'50','LULAB, AEYMH ZHAYL LAUSA','2022-07-25','2022-07-25 08:32:15','2022-07-25 12:05:10','','2022-07-25 12:19:40','2022-07-25 19:39:35','',0.5333333333333333,0,7.470000000000001,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('573684429',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-02','2022-06-02 08:13:44',NULL,'',NULL,'2022-06-02 17:05:22','',0,0,0,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1305533345',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-03','2022-06-03 08:02:47','2022-06-03 12:01:45','',NULL,NULL,'',0.03333333333333333,0,3.97,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1045219866',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-06','2022-06-06 08:17:01','2022-06-06 12:21:30','','2022-06-06 12:57:51','2022-06-06 17:07:08','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('354470927',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-07','2022-06-07 07:59:11','2022-06-07 12:14:53','','2022-06-07 12:59:09',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1458416668',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-08','2022-06-08 08:35:05','2022-06-08 12:34:32','','2022-06-08 12:58:31','2022-06-08 17:07:10','',0.5833333333333334,0,7.42,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1885345903',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-09','2022-06-09 08:12:07','2022-06-09 12:10:56','','2022-06-09 13:00:46','2022-06-09 17:31:47','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1972618308',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-10','2022-06-10 08:08:15','2022-06-10 12:25:36','','2022-06-10 12:57:48','2022-06-10 18:03:01','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('389301837',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-14','2022-06-14 08:05:43','2022-06-14 12:00:21','','2022-06-14 12:31:58','2022-06-14 17:08:58','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('877001335',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-15','2022-06-15 08:12:40','2022-06-15 12:38:32','','2022-06-15 12:50:52','2022-06-15 17:15:09','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('924224182',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-16','2022-06-16 08:13:47','2022-06-16 12:00:07','','2022-06-16 12:50:44','2022-06-16 17:15:05','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('219361393',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-17','2022-06-17 08:27:41','2022-06-17 12:01:17','',NULL,NULL,'',0.45,0,3.55,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('436897186',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-20','2022-06-20 08:17:25','2022-06-20 12:00:54','','2022-06-20 12:45:16','2022-06-20 17:02:19','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('129002345',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-21','2022-06-21 08:25:19','2022-06-21 12:02:30','',NULL,'2022-06-21 17:00:59','',0.4166666666666667,0,3.58,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1100088154',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-22','2022-06-22 08:22:33','2022-06-22 12:15:37','','2022-06-22 12:52:10','2022-06-22 17:19:32','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('770946164',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-23','2022-06-23 08:26:15','2022-06-23 12:15:36','','2022-06-23 12:28:15','2022-06-23 17:05:59','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1178221963',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-24','2022-06-24 08:45:53',NULL,'','2022-06-24 12:58:43','2022-06-24 17:39:04','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1476911242',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-27','2022-06-27 08:01:14',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('2058273315',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-28','2022-06-28 08:21:50',NULL,'','2022-06-28 13:09:41',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('92861670',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-06-30','2022-06-30 08:22:35','2022-06-30 12:16:30','','2022-06-30 12:48:33','2022-06-30 17:05:37','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('762560859',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-07-19','2022-07-19 08:12:45','2022-07-19 12:13:32','','2022-07-19 12:29:37','2022-07-19 17:12:00','',0.2,0,7.8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1115365206',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-07-20','2022-07-20 08:26:15','2022-07-20 12:27:28','','2022-07-20 17:14:50',NULL,'',0.43333333333333335,0,3.57,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1369706569',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-07-21','2022-07-21 08:27:05','2022-07-21 12:13:06','','2022-07-21 12:24:44','2022-07-21 17:03:20','',0.45,0,7.55,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1425790005',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-07-22','2022-07-22 08:06:01','2022-07-22 12:08:12','','2022-07-22 12:19:09','2022-07-22 17:21:35','',0.1,0,7.9,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('2034456803',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-07-25','2022-07-25 08:06:31','2022-07-25 12:29:01','',NULL,'2022-07-25 17:07:32','',0.1,0,3.9,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('322561636',0,'51','LUMPAY, MARGIE LYN LACUMBES','2022-07-26','2022-07-26 08:16:58',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1085879875',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-01','2022-06-01 07:59:24','2022-06-01 12:01:05','','2022-06-01 12:43:39','2022-06-01 17:50:14','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1682867848',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-02','2022-06-02 07:59:16','2022-06-02 12:07:19','',NULL,'2022-06-02 18:02:31','',0,0,4,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1047820186',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-03','2022-06-03 07:57:12','2022-06-03 12:21:03','','2022-06-03 12:44:32','2022-06-03 17:55:19','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1410800589',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-06','2022-06-06 08:06:52','2022-06-06 12:04:13','','2022-06-06 12:25:58','2022-06-06 18:33:12','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1731100473',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-07','2022-06-07 07:43:05','2022-06-07 12:06:56','','2022-06-07 12:32:38',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('380492749',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-08','2022-06-08 08:45:28','2022-06-08 12:12:52','','2022-06-08 12:47:50','2022-06-08 17:32:59','',0.75,0,7.25,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1141793567',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-09','2022-06-09 07:44:48',NULL,'',NULL,'2022-06-09 17:15:25','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1331327804',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-10','2022-06-10 08:26:43','2022-06-10 12:08:59','',NULL,'2022-06-10 18:13:04','',0.43333333333333335,0,3.57,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1967558303',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-13','2022-06-13 08:19:38',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1216718269',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-14','2022-06-14 08:15:53','2022-06-14 12:26:20','','2022-06-14 12:38:07','2022-06-14 17:29:05','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('131274564',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-15','2022-06-15 08:15:53','2022-06-15 12:22:17','','2022-06-15 12:32:35','2022-06-15 17:51:23','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1273978390',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-16','2022-06-16 08:14:30','2022-06-16 12:10:07','','2022-06-16 12:39:56','2022-06-16 19:04:20','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('184747442',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-17','2022-06-17 08:04:06','2022-06-17 12:05:31','','2022-06-17 12:21:06',NULL,'',0.06666666666666667,0,3.93,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1171910821',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-20','2022-06-20 08:03:32','2022-06-20 12:30:44','','2022-06-20 12:41:43','2022-06-20 17:27:45','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('254905350',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-21','2022-06-21 08:14:09','2022-06-21 12:26:37','',NULL,'2022-06-21 17:33:20','',0.4666666666666667,0,7.54,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1899150342',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-22','2022-06-22 08:46:21','2022-06-22 12:14:33','','2022-06-22 12:51:49','2022-06-22 18:41:04','',0.7666666666666667,0,7.23,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1699365617',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-23','2022-06-23 08:18:51','2022-06-23 12:09:20','','2022-06-23 12:25:20','2022-06-23 17:40:10','',0.3,0,7.7,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1237755209',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-24','2022-06-24 08:53:56','2022-06-24 12:09:22','','2022-06-24 12:22:54','2022-06-24 17:52:43','',0.8833333333333333,0,7.12,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('647769844',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-27','2022-06-27 08:14:14','2022-06-27 12:06:56','','2022-06-27 12:28:47','2022-06-27 17:33:12','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('779907433',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-28','2022-06-28 08:39:03','2022-06-28 12:05:33','','2022-06-28 12:34:45','2022-06-28 17:43:25','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('197677688',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-29','2022-06-29 08:26:37','2022-06-29 12:05:47','','2022-06-29 12:16:01','2022-06-29 18:33:35','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1319513774',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-06-30','2022-06-30 08:38:44','2022-06-30 12:44:29','','2022-06-30 12:58:52','2022-06-30 18:01:46','',0.6333333333333333,0,7.37,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1449712270',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-07-18','2022-07-18 07:34:17','2022-07-18 12:20:00','','2022-07-18 12:30:34','2022-07-18 17:03:41','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1580935664',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-07-19','2022-07-19 07:13:31','2022-07-19 12:29:57','','2022-07-19 12:44:09','2022-07-19 17:16:37','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1877796672',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-07-20','2022-07-20 07:11:50','2022-07-20 12:02:40','','2022-07-20 12:38:36','2022-07-20 17:28:28','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1033918390',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-07-21',NULL,'2022-07-21 12:04:55','','2022-07-21 12:53:43','2022-07-21 17:30:58','',0,0,4,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('441520341',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-07-22','2022-07-22 07:29:23','2022-07-22 12:19:33','',NULL,'2022-07-22 17:52:53','',0,0,4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1954702727',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-07-25','2022-07-25 08:28:44','2022-07-25 12:07:38','','2022-07-25 12:22:41','2022-07-25 17:23:18','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1478949340',0,'52','MABANAG, RUTHCELYNE SALUDO','2022-07-26','2022-07-26 07:23:29',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('764070293',0,'53','EVELYN BAJAR MALLERNA','2022-06-01','2022-06-01 05:14:05','2022-06-01 12:00:47','','2022-06-01 12:13:22','2022-06-01 17:00:16','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('245422207',0,'53','EVELYN BAJAR MALLERNA','2022-06-02','2022-06-02 05:22:36','2022-06-02 12:01:37','','2022-06-02 12:14:15','2022-06-02 17:00:15','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1806857178',0,'53','EVELYN BAJAR MALLERNA','2022-06-03','2022-06-03 05:17:44','2022-06-03 12:02:23','','2022-06-03 12:14:18','2022-06-03 17:00:14','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1519115403',0,'53','EVELYN BAJAR MALLERNA','2022-06-06','2022-06-06 05:17:55','2022-06-06 12:09:35','','2022-06-06 12:28:51','2022-06-06 17:00:11','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('622889245',0,'53','EVELYN BAJAR MALLERNA','2022-06-07','2022-06-07 05:16:38','2022-06-07 12:00:30','','2022-06-07 12:17:49','2022-06-07 17:00:17','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1367374902',0,'53','EVELYN BAJAR MALLERNA','2022-06-08','2022-06-08 05:24:52','2022-06-08 12:09:32','','2022-06-08 12:23:08','2022-06-08 17:02:23','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('916343156',0,'53','EVELYN BAJAR MALLERNA','2022-06-09','2022-06-09 05:19:27','2022-06-09 12:00:23','','2022-06-09 12:11:58','2022-06-09 16:59:56','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1610869406',0,'53','EVELYN BAJAR MALLERNA','2022-06-10','2022-06-10 05:24:31','2022-06-10 12:00:33','','2022-06-10 12:13:16','2022-06-10 17:01:07','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('62353114',0,'53','EVELYN BAJAR MALLERNA','2022-06-13','2022-06-13 05:21:32','2022-06-13 12:01:02','','2022-06-13 12:19:28','2022-06-13 17:00:36','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1980765807',0,'53','EVELYN BAJAR MALLERNA','2022-06-14','2022-06-14 05:39:11','2022-06-14 12:00:06','','2022-06-14 12:24:03','2022-06-14 17:01:37','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('2147256905',0,'53','EVELYN BAJAR MALLERNA','2022-06-15','2022-06-15 05:23:24','2022-06-15 12:00:54','','2022-06-15 12:24:13','2022-06-15 17:00:41','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('778411444',0,'53','EVELYN BAJAR MALLERNA','2022-06-16','2022-06-16 05:16:24','2022-06-16 12:01:31','','2022-06-16 12:17:16','2022-06-16 17:00:43','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('356663583',0,'53','EVELYN BAJAR MALLERNA','2022-06-17','2022-06-17 05:23:58','2022-06-17 12:00:47','','2022-06-17 12:13:44','2022-06-17 17:00:54','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1511923490',0,'53','EVELYN BAJAR MALLERNA','2022-06-20','2022-06-20 05:15:57','2022-06-20 12:01:22','','2022-06-20 12:11:32','2022-06-20 17:00:55','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1836607720',0,'53','EVELYN BAJAR MALLERNA','2022-06-21','2022-06-21 05:23:51','2022-06-21 12:04:58','','2022-06-21 12:17:33','2022-06-21 17:00:38','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2086080177',0,'53','EVELYN BAJAR MALLERNA','2022-06-22','2022-06-22 05:20:54','2022-06-22 12:02:12','','2022-06-22 12:13:13','2022-06-22 17:00:41','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1904476380',0,'53','EVELYN BAJAR MALLERNA','2022-06-23','2022-06-23 05:20:32','2022-06-23 12:03:30','','2022-06-23 12:13:40','2022-06-23 17:00:36','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1247350550',0,'53','EVELYN BAJAR MALLERNA','2022-06-24','2022-06-24 05:21:50','2022-06-24 12:07:39','','2022-06-24 12:18:31','2022-06-24 17:00:24','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1843689200',0,'53','EVELYN BAJAR MALLERNA','2022-06-27','2022-06-27 05:28:58','2022-06-27 12:05:17','','2022-06-27 12:16:19','2022-06-27 17:00:18','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('590280327',0,'53','EVELYN BAJAR MALLERNA','2022-06-28','2022-06-28 05:19:03',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('68038690',0,'53','EVELYN BAJAR MALLERNA','2022-06-29','2022-06-29 05:16:03','2022-06-29 12:04:36','','2022-06-29 12:19:03','2022-06-29 19:47:47','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('49003039',0,'53','EVELYN BAJAR MALLERNA','2022-06-30','2022-06-30 05:56:02','2022-06-30 12:09:04','','2022-06-30 12:20:31','2022-06-30 17:00:20','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1737722250',0,'53','EVELYN BAJAR MALLERNA','2022-07-18','2022-07-18 05:20:09','2022-07-18 12:09:13','','2022-07-18 12:27:48','2022-07-18 17:00:18','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1941329988',0,'53','EVELYN BAJAR MALLERNA','2022-07-19','2022-07-19 05:29:48','2022-07-19 12:02:07','','2022-07-19 12:19:41','2022-07-19 17:00:04','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1763096923',0,'53','EVELYN BAJAR MALLERNA','2022-07-20','2022-07-20 05:17:56','2022-07-20 12:01:55','','2022-07-20 12:13:50','2022-07-20 17:00:06','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('701301898',0,'53','EVELYN BAJAR MALLERNA','2022-07-21','2022-07-21 05:37:55','2022-07-21 12:06:25','','2022-07-21 12:19:07','2022-07-21 17:01:02','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1990310489',0,'53','EVELYN BAJAR MALLERNA','2022-07-25','2022-07-25 05:37:30','2022-07-25 12:12:09','','2022-07-25 12:22:20','2022-07-25 17:00:16','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1877340412',0,'53','EVELYN BAJAR MALLERNA','2022-07-26','2022-07-26 05:26:24',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1012237560',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-01','2022-06-01 08:08:42','2022-06-01 12:00:12','','2022-06-01 13:04:06','2022-06-01 17:00:05','',0.2,0,7.800000000000001,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('356210115',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-02','2022-06-02 08:13:16',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1811598146',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-06','2022-06-06 07:47:22','2022-06-06 12:38:12','','2022-06-06 12:49:03','2022-06-06 17:00:17','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('331302631',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-07','2022-06-07 08:07:51','2022-06-07 11:59:04','','2022-06-07 13:09:42','2022-06-07 17:02:23','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1860639903',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-08','2022-06-08 08:08:41','2022-06-08 11:45:08','','2022-06-08 13:01:21','2022-06-08 17:00:27','',0.15,0.23333333333333334,7.609999999999999,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1954326569',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-09','2022-06-09 08:11:02','2022-06-09 12:00:07','','2022-06-09 13:04:47','2022-06-09 17:00:05','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1942058571',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-10','2022-06-10 08:21:53','2022-06-10 12:00:02','','2022-06-10 13:04:36','2022-06-10 15:50:32','',0.41666666666666663,1.15,6.43,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1876221238',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-13','2022-06-13 08:13:20','2022-06-13 12:00:12','','2022-06-13 13:08:15','2022-06-13 17:00:30','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('2097140700',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-14','2022-06-14 08:09:08','2022-06-14 12:00:16','','2022-06-14 12:10:47','2022-06-14 17:00:15','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('555793372',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-15','2022-06-15 08:01:52','2022-06-15 12:01:04','','2022-06-15 12:51:50','2022-06-15 17:00:18','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1033497558',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-16','2022-06-16 08:10:22','2022-06-16 12:00:14','','2022-06-16 12:57:32','2022-06-16 17:14:34','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1983718934',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-17','2022-06-17 08:15:27','2022-06-17 12:00:06','','2022-06-17 12:53:50','2022-06-17 17:17:38','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('812207009',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-20','2022-06-20 08:09:24','2022-06-20 12:00:22','','2022-06-20 13:07:50','2022-06-20 17:00:19','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('723990487',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-21','2022-06-21 08:12:19','2022-06-21 12:00:07','','2022-06-21 13:17:45','2022-06-21 17:00:10','',0.48333333333333334,0,7.52,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1293473581',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-22','2022-06-22 08:08:55','2022-06-22 12:00:33','','2022-06-22 12:11:12','2022-06-22 17:00:07','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('170185010',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-23','2022-06-23 08:23:39','2022-06-23 12:47:17','','2022-06-23 12:58:18',NULL,'',0.38333333333333336,0,3.62,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('2108547625',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-27','2022-06-27 08:17:06','2022-06-27 12:44:42','','2022-06-27 13:05:05',NULL,'',0.2833333333333333,0,3.72,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('176581971',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-28','2022-06-28 08:00:26','2022-06-28 12:00:09','','2022-06-28 12:10:47','2022-06-28 17:00:06','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1431234567',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-29',NULL,NULL,'','2022-06-29 13:03:40',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('608568494',0,'54','MAMALIAS, JOAN MABOLIS','2022-06-30','2022-06-30 08:25:02','2022-06-30 12:00:18','','2022-06-30 13:02:28','2022-06-30 16:55:53','',0.45,0.06666666666666667,7.48,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('628025483',0,'54','MAMALIAS, JOAN MABOLIS','2022-07-18','2022-07-18 08:13:25','2022-07-18 12:00:15','','2022-07-18 13:06:32','2022-07-18 17:00:14','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2024723020',0,'54','MAMALIAS, JOAN MABOLIS','2022-07-19','2022-07-19 08:19:40','2022-07-19 11:43:06','','2022-07-19 13:00:42','2022-07-19 17:00:11','',0.31666666666666665,0.26666666666666666,7.42,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1729206013',0,'54','MAMALIAS, JOAN MABOLIS','2022-07-20','2022-07-20 08:18:26','2022-07-20 12:00:06','','2022-07-20 13:03:28','2022-07-20 17:00:21','',0.35,0,7.65,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('590114192',0,'54','MAMALIAS, JOAN MABOLIS','2022-07-21','2022-07-21 08:12:48','2022-07-21 12:00:08','','2022-07-21 13:01:20','2022-07-21 17:00:53','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1190010852',0,'54','MAMALIAS, JOAN MABOLIS','2022-07-25','2022-07-25 08:06:08','2022-07-25 11:50:11','','2022-07-25 13:04:16','2022-07-25 17:00:06','',0.16666666666666669,0.15,7.68,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('2080033631',0,'54','MAMALIAS, JOAN MABOLIS','2022-07-26','2022-07-26 08:16:07',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('160779558',0,'55','MANEJA, JERSON OCON','2022-06-06','2022-06-06 08:06:46','2022-06-06 12:03:23','',NULL,NULL,'',0.1,0,3.9,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1635533152',0,'55','MANEJA, JERSON OCON','2022-06-07',NULL,NULL,'','2022-06-07 13:19:17','2022-06-07 17:10:42','',0.31666666666666665,0,3.68,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('832959488',0,'55','MANEJA, JERSON OCON','2022-06-13','2022-06-13 08:01:11','2022-06-13 12:02:35','','2022-06-13 13:11:48','2022-06-13 17:00:55','',0.19999999999999998,0,7.8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('499065439',0,'55','MANEJA, JERSON OCON','2022-06-14','2022-06-14 08:35:47',NULL,'','2022-06-14 13:08:13','2022-06-14 17:03:38','',0.13333333333333333,0,3.87,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('387118600',0,'55','MANEJA, JERSON OCON','2022-06-15','2022-06-15 08:20:52','2022-06-15 12:00:12','','2022-06-15 13:05:03','2022-06-15 17:03:02','',0.41666666666666663,0,7.59,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('34284215',0,'55','MANEJA, JERSON OCON','2022-06-17','2022-06-17 08:24:20','2022-06-17 12:10:15','','2022-06-17 13:07:52','2022-06-17 17:07:30','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1026855505',0,'55','MANEJA, JERSON OCON','2022-06-20','2022-06-20 08:03:08','2022-06-20 12:02:00','','2022-06-20 13:07:53','2022-06-20 17:03:49','',0.16666666666666669,0,7.83,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('2081014752',0,'55','MANEJA, JERSON OCON','2022-06-21','2022-06-21 08:09:13','2022-06-21 12:04:03','','2022-06-21 13:24:34','2022-06-21 17:02:21','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('401436607',0,'55','MANEJA, JERSON OCON','2022-06-22','2022-06-22 08:38:11','2022-06-22 12:02:57','','2022-06-22 13:32:53','2022-06-22 17:01:37','',1.1666666666666665,0,6.84,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('281943278',0,'55','MANEJA, JERSON OCON','2022-06-23',NULL,NULL,'','2022-06-23 13:01:55','2022-06-23 19:51:32','',0.016666666666666666,0,3.98,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('986372931',0,'55','MANEJA, JERSON OCON','2022-06-24',NULL,NULL,'','2022-06-24 13:19:15','2022-06-24 17:02:03','',0.31666666666666665,0,3.68,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('775629619',0,'55','MANEJA, JERSON OCON','2022-06-25',NULL,NULL,'','2022-06-25 13:49:16','2022-06-25 16:51:53','',0.8166666666666667,0.13333333333333333,3.05,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('1763803889',0,'55','MANEJA, JERSON OCON','2022-06-27','2022-06-27 08:24:29','2022-06-27 12:00:31','','2022-06-27 13:12:36','2022-06-27 16:57:12','',0.6000000000000001,0.03333333333333333,7.37,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1452915985',0,'55','MANEJA, JERSON OCON','2022-06-28','2022-06-28 08:18:16',NULL,'','2022-06-28 13:00:47',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('30159009',0,'55','MANEJA, JERSON OCON','2022-07-18','2022-07-18 08:23:16','2022-07-18 12:00:46','','2022-07-18 12:58:37','2022-07-18 17:14:23','',0.38333333333333336,0,7.62,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1760841215',0,'55','MANEJA, JERSON OCON','2022-07-19','2022-07-19 08:12:26','2022-07-19 12:01:44','','2022-07-19 13:09:35','2022-07-19 17:03:30','',0.35,0,7.65,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1800238557',0,'55','MANEJA, JERSON OCON','2022-07-20','2022-07-20 08:23:28','2022-07-20 12:00:19','','2022-07-20 13:07:39','2022-07-20 17:02:37','',0.5,0,7.5,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('125578764',0,'55','MANEJA, JERSON OCON','2022-07-22','2022-07-22 08:10:55','2022-07-22 12:02:27','','2022-07-22 13:21:12','2022-07-22 17:05:54','',0.5166666666666666,0,7.48,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1176235157',0,'55','MANEJA, JERSON OCON','2022-07-25','2022-07-25 08:16:25','2022-07-25 12:04:36','','2022-07-25 13:15:34','2022-07-25 17:03:14','',0.5166666666666666,0,7.48,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1427912797',0,'55','MANEJA, JERSON OCON','2022-07-26','2022-07-26 08:03:29',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('2032640678',0,'56','MANEJA, NELIA MANGUBAT','2022-06-02','2022-06-02 08:09:08','2022-06-02 12:00:10','','2022-06-02 13:10:55','2022-06-02 17:01:45','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1953845979',0,'56','MANEJA, NELIA MANGUBAT','2022-06-03','2022-06-03 08:27:05',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1266518484',0,'56','MANEJA, NELIA MANGUBAT','2022-06-07','2022-06-07 08:13:00','2022-06-07 12:00:01','',NULL,NULL,'',0.21666666666666667,0,3.78,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('182833089',0,'56','MANEJA, NELIA MANGUBAT','2022-06-08','2022-06-08 08:09:18','2022-06-08 12:00:02','','2022-06-08 13:24:58',NULL,'',0.15,0,3.85,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('719342543',0,'56','MANEJA, NELIA MANGUBAT','2022-06-13','2022-06-13 08:01:15','2022-06-13 12:00:33','','2022-06-13 13:11:35','2022-06-13 17:00:18','',0.19999999999999998,0,7.8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('672316847',0,'56','MANEJA, NELIA MANGUBAT','2022-06-14','2022-06-14 08:35:43',NULL,'','2022-06-14 13:08:08','2022-06-14 17:00:08','',0.13333333333333333,0,3.87,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('561836190',0,'56','MANEJA, NELIA MANGUBAT','2022-06-15','2022-06-15 08:20:48','2022-06-15 12:00:43','','2022-06-15 13:04:52','2022-06-15 17:03:16','',0.39999999999999997,0,7.6,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1534764456',0,'56','MANEJA, NELIA MANGUBAT','2022-06-16','2022-06-16 08:08:42','2022-06-16 12:05:13','','2022-06-16 13:18:50','2022-06-16 17:14:17','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('718695826',0,'56','MANEJA, NELIA MANGUBAT','2022-06-17','2022-06-17 08:24:18','2022-06-17 12:00:25','','2022-06-17 13:07:57','2022-06-17 17:01:08','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1739010644',0,'56','MANEJA, NELIA MANGUBAT','2022-06-20','2022-06-20 08:03:11','2022-06-20 12:01:52','','2022-06-20 13:07:46','2022-06-20 17:04:03','',0.16666666666666669,0,7.83,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1281665204',0,'56','MANEJA, NELIA MANGUBAT','2022-06-21',NULL,'2022-06-21 12:00:10','','2022-06-21 13:24:25','2022-06-21 17:06:45','',0.4,0,3.6,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('979981729',0,'56','MANEJA, NELIA MANGUBAT','2022-06-22','2022-06-22 08:38:14','2022-06-22 12:00:38','','2022-06-22 13:32:58','2022-06-22 17:08:31','',1.1666666666666665,0,6.84,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('96232654',0,'56','MANEJA, NELIA MANGUBAT','2022-06-23','2022-06-23 08:31:03','2022-06-23 12:00:01','',NULL,NULL,'',0.5166666666666667,0,3.48,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('169062099',0,'56','MANEJA, NELIA MANGUBAT','2022-06-24','2022-06-24 09:07:15','2022-06-24 12:05:54','',NULL,NULL,'',1.1166666666666667,0,2.88,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1071900759',0,'56','MANEJA, NELIA MANGUBAT','2022-06-27','2022-06-27 08:23:58','2022-06-27 12:02:42','','2022-06-27 13:12:32','2022-06-27 16:57:16','',0.5833333333333334,0.03333333333333333,7.390000000000001,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('7381033',0,'56','MANEJA, NELIA MANGUBAT','2022-06-28','2022-06-28 08:17:49',NULL,'','2022-06-28 13:00:50',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1821777793',0,'56','MANEJA, NELIA MANGUBAT','2022-07-18','2022-07-18 08:22:57','2022-07-18 12:01:47','','2022-07-18 12:58:30','2022-07-18 17:17:41','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1820372385',0,'56','MANEJA, NELIA MANGUBAT','2022-07-19','2022-07-19 08:12:20','2022-07-19 12:00:04','','2022-07-19 13:09:27','2022-07-19 17:05:22','',0.35,0,7.65,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('234936632',0,'56','MANEJA, NELIA MANGUBAT','2022-07-20','2022-07-20 08:23:23','2022-07-20 12:00:14','','2022-07-20 13:07:37',NULL,'',0.38333333333333336,0,3.62,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('874175784',0,'56','MANEJA, NELIA MANGUBAT','2022-07-21','2022-07-21 07:57:09','2022-07-21 12:00:15','','2022-07-21 13:02:48','2022-07-21 17:00:30','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('569645979',0,'56','MANEJA, NELIA MANGUBAT','2022-07-22','2022-07-22 08:10:59','2022-07-22 12:00:17','','2022-07-22 13:21:05','2022-07-22 17:00:07','',0.5166666666666666,0,7.48,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1658689973',0,'56','MANEJA, NELIA MANGUBAT','2022-07-25','2022-07-25 08:16:19','2022-07-25 12:02:23','','2022-07-25 13:15:29','2022-07-25 17:26:22','',0.5166666666666666,0,7.48,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1298310432',0,'56','MANEJA, NELIA MANGUBAT','2022-07-26','2022-07-26 08:03:31',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('2121669604',0,'57','MANGUBAT, JONALY DESPI','2022-06-01','2022-06-01 08:19:22','2022-06-01 12:46:30','',NULL,'2022-06-01 17:26:55','',0.31666666666666665,0,3.68,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1033138992',0,'57','MANGUBAT, JONALY DESPI','2022-06-02','2022-06-02 07:54:29','2022-06-02 12:04:08','','2022-06-02 12:26:26','2022-06-02 18:02:16','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('101543913',0,'57','MANGUBAT, JONALY DESPI','2022-06-03','2022-06-03 08:30:03','2022-06-03 12:08:35','','2022-06-03 12:20:16','2022-06-03 19:48:57','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('2049186515',0,'57','MANGUBAT, JONALY DESPI','2022-06-06','2022-06-06 07:51:45',NULL,'',NULL,'2022-06-06 17:22:23','',0,0,0,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1113037902',0,'57','MANGUBAT, JONALY DESPI','2022-06-07','2022-06-07 08:12:14',NULL,'',NULL,'2022-06-07 18:30:41','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('834015180',0,'57','MANGUBAT, JONALY DESPI','2022-06-08','2022-06-08 08:13:08','2022-06-08 12:15:47','','2022-06-08 12:30:54','2022-06-08 17:07:29','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('762701049',0,'57','MANGUBAT, JONALY DESPI','2022-06-09','2022-06-09 08:08:34','2022-06-09 12:10:32','','2022-06-09 12:35:30','2022-06-09 17:21:50','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('617440014',0,'57','MANGUBAT, JONALY DESPI','2022-06-13','2022-06-13 07:37:33','2022-06-13 12:01:47','','2022-06-13 12:11:50','2022-06-13 17:59:24','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1000721163',0,'57','MANGUBAT, JONALY DESPI','2022-06-14','2022-06-14 08:39:15','2022-06-14 12:07:43','','2022-06-14 12:17:49','2022-06-14 17:28:46','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1136039733',0,'57','MANGUBAT, JONALY DESPI','2022-06-15','2022-06-15 10:10:56','2022-06-15 12:26:30','','2022-06-15 12:41:08','2022-06-15 17:45:42','',2.1666666666666665,0,5.83,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('808993418',0,'57','MANGUBAT, JONALY DESPI','2022-06-16','2022-06-16 07:44:47','2022-06-16 12:06:23','','2022-06-16 12:46:10','2022-06-16 21:17:43','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1086276567',0,'57','MANGUBAT, JONALY DESPI','2022-06-17','2022-06-17 08:30:54','2022-06-17 12:12:46','','2022-06-17 12:24:34','2022-06-17 17:58:52','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1706823977',0,'57','MANGUBAT, JONALY DESPI','2022-06-20','2022-06-20 07:52:56','2022-06-20 12:12:53','','2022-06-20 12:24:41','2022-06-20 17:16:12','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('341465987',0,'57','MANGUBAT, JONALY DESPI','2022-06-22','2022-06-22 08:46:39','2022-06-22 12:33:38','','2022-06-22 12:51:23','2022-06-22 18:25:58','',0.7666666666666667,0,7.23,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('675672732',0,'57','MANGUBAT, JONALY DESPI','2022-06-23','2022-06-23 08:16:58','2022-06-23 12:03:22','','2022-06-23 12:16:52','2022-06-23 19:11:22','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('17901381',0,'57','MANGUBAT, JONALY DESPI','2022-06-27',NULL,'2022-06-27 12:03:33','','2022-06-27 12:25:28','2022-06-27 17:51:25','',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1760670920',0,'57','MANGUBAT, JONALY DESPI','2022-06-28','2022-06-28 07:54:42','2022-06-28 12:01:42','','2022-06-28 12:34:07','2022-06-28 18:00:10','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('714667098',0,'57','MANGUBAT, JONALY DESPI','2022-06-29','2022-06-29 08:07:23','2022-06-29 12:01:37','','2022-06-29 12:13:24','2022-06-29 18:20:25','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('933894381',0,'57','MANGUBAT, JONALY DESPI','2022-06-30','2022-06-30 08:20:13','2022-06-30 12:13:59','','2022-06-30 12:24:33','2022-06-30 17:46:43','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('69057789',0,'57','MANGUBAT, JONALY DESPI','2022-07-18','2022-07-18 09:16:10','2022-07-18 12:19:21','','2022-07-18 12:31:02','2022-07-18 17:40:54','',1.2666666666666666,0,6.73,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1457802756',0,'57','MANGUBAT, JONALY DESPI','2022-07-19','2022-07-19 08:01:09','2022-07-19 12:20:40','','2022-07-19 12:31:58','2022-07-19 17:22:28','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1063059072',0,'57','MANGUBAT, JONALY DESPI','2022-07-20','2022-07-20 08:35:52','2022-07-20 12:10:23','','2022-07-20 12:20:55','2022-07-20 17:31:14','',0.5833333333333334,0,7.42,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1898968313',0,'57','MANGUBAT, JONALY DESPI','2022-07-21','2022-07-21 09:16:21','2022-07-21 12:00:53','','2022-07-21 12:22:41','2022-07-21 17:00:37','',1.2666666666666666,0,6.73,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('536064531',0,'57','MANGUBAT, JONALY DESPI','2022-07-25','2022-07-25 08:26:04','2022-07-25 12:20:43','','2022-07-25 12:31:54','2022-07-25 17:27:45','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('2055932998',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-01','2022-06-01 08:37:33','2022-06-01 12:47:31','','2022-06-01 13:04:29','2022-06-01 17:24:41','',0.6833333333333333,0,7.3100000000000005,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('555920709',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-02','2022-06-02 08:51:33','2022-06-02 12:50:05','','2022-06-02 13:01:35','2022-06-02 17:14:33','',0.8666666666666667,0,7.13,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('985157769',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-06','2022-06-06 08:23:47','2022-06-06 12:11:13','','2022-06-06 12:46:53','2022-06-06 19:50:08','',0.38333333333333336,0,7.62,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1271357474',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-07','2022-06-07 08:51:44','2022-06-07 12:41:25','','2022-06-07 12:54:20','2022-06-07 17:46:48','',0.85,0,7.15,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1676728310',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-08','2022-06-08 07:17:06','2022-06-08 12:36:24','','2022-06-08 12:56:59','2022-06-08 17:35:27','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1995218464',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-10','2022-06-10 08:48:38','2022-06-10 11:56:02','','2022-06-10 14:12:11','2022-06-10 17:59:49','',2,0.05,5.949999999999999,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1195137898',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-11',NULL,NULL,'','2022-06-11 15:27:21','2022-06-11 17:54:43','',2.45,0,1.55,'0','','','','','','','',0,'2022-06-11 08:00:00','2022-06-11 17:00:00','regular','N/A','N/A',0,0),('1692946409',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-13','2022-06-13 08:34:08','2022-06-13 12:02:10','','2022-06-13 12:48:36','2022-06-13 17:15:11','',0.5666666666666667,0,7.43,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('640363793',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-14','2022-06-14 08:39:07','2022-06-14 12:00:36','','2022-06-14 12:39:39','2022-06-14 17:08:42','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1189367688',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-15','2022-06-15 10:34:48',NULL,'',NULL,'2022-06-15 17:16:07','',0,0,0,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1675621468',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-16','2022-06-16 08:44:08','2022-06-16 12:17:28','','2022-06-16 12:33:38','2022-06-16 17:43:06','',0.7333333333333333,0,7.27,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1146946282',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-17','2022-06-17 08:48:49','2022-06-17 12:46:42','',NULL,'2022-06-17 13:26:21','',0.8,0,3.2,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1664056977',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-20','2022-06-20 07:45:36','2022-06-20 12:40:55','','2022-06-20 12:54:58','2022-06-20 17:40:57','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('375923532',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-21','2022-06-21 08:10:41','2022-06-21 12:01:33','','2022-06-21 12:12:36','2022-06-21 17:51:40','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2146094218',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-22','2022-06-22 08:42:06','2022-06-22 12:07:19','',NULL,'2022-06-22 17:37:55','',0.7,0,3.3,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('613383204',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-23','2022-06-23 08:05:55',NULL,'',NULL,'2022-06-23 18:03:49','',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1103878849',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-24','2022-06-24 08:30:50','2022-06-24 11:46:29','','2022-06-24 12:59:00','2022-06-24 17:39:27','',0.5,0.21666666666666667,7.279999999999999,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1071044891',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-27','2022-06-27 08:47:11',NULL,'',NULL,'2022-06-27 21:42:55','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('973584931',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-28','2022-06-28 09:16:13','2022-06-28 12:59:45','','2022-06-28 13:11:19',NULL,'',1.2666666666666666,0,2.73,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1672647261',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-29','2022-06-29 07:49:13',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1954984200',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-06-30','2022-06-30 08:50:24','2022-06-30 12:26:07','',NULL,NULL,'',1.6666666666666667,0,6.34,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('348209064',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-07-16',NULL,NULL,'',NULL,'2022-07-16 18:04:34','',0,0,0,'0','','','','','','','',0,'2022-07-16 08:00:00','2022-07-16 17:00:00','regular','N/A','N/A',0,0),('532334318',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-07-18','2022-07-18 09:03:41','2022-07-18 12:23:00','','2022-07-18 12:33:52',NULL,'',1.05,0,2.95,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('64723352',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-07-19','2022-07-19 08:58:04','2022-07-19 12:47:47','','2022-07-19 13:00:28','2022-07-19 17:52:26','',0.9666666666666667,0,7.029999999999999,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('824285885',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-07-20','2022-07-20 08:47:09','2022-07-20 12:02:18','','2022-07-20 12:18:02','2022-07-20 17:58:18','',0.7833333333333333,0,7.220000000000001,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('276050986',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-07-21','2022-07-21 08:45:41',NULL,'',NULL,'2022-07-21 17:10:08','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1918699025',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-07-22','2022-07-22 08:19:39',NULL,'','2022-07-22 12:13:42','2022-07-22 17:35:12','',0,0,4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1979274464',0,'58','CHRISTIAN IAN MARILLA MANTE','2022-07-25','2022-07-25 08:48:40','2022-07-25 12:16:27','','2022-07-25 12:27:31',NULL,'',0.8,0,3.2,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('205818940',0,'59','MANTE, JESSERIE ANN','2022-06-01','2022-06-01 08:17:39','2022-06-01 12:06:35','','2022-06-01 12:17:07','2022-06-01 17:32:50','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1138488434',0,'59','MANTE, JESSERIE ANN','2022-06-02','2022-06-02 08:14:22','2022-06-02 12:00:25','','2022-06-02 12:11:04','2022-06-02 17:28:19','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('382523141',0,'59','MANTE, JESSERIE ANN','2022-06-03',NULL,'2022-06-03 12:05:32','','2022-06-03 12:16:22','2022-06-03 17:11:02','',0,0,4,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('858539034',0,'59','MANTE, JESSERIE ANN','2022-06-06','2022-06-06 08:19:39','2022-06-06 12:01:04','','2022-06-06 12:12:20','2022-06-06 17:12:30','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1586281230',0,'59','MANTE, JESSERIE ANN','2022-06-07','2022-06-07 08:32:43','2022-06-07 12:01:29','','2022-06-07 12:12:01','2022-06-07 17:07:38','',0.5333333333333333,0,7.470000000000001,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('595564390',0,'59','MANTE, JESSERIE ANN','2022-06-08','2022-06-08 08:11:28','2022-06-08 12:07:44','','2022-06-08 12:21:55','2022-06-08 17:05:22','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('590141440',0,'59','MANTE, JESSERIE ANN','2022-06-09','2022-06-09 08:26:54','2022-06-09 12:00:41','','2022-06-09 12:12:13','2022-06-09 17:07:08','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1361422967',0,'59','MANTE, JESSERIE ANN','2022-06-10','2022-06-10 08:37:36','2022-06-10 12:03:28','','2022-06-10 12:17:02','2022-06-10 17:17:47','',0.6166666666666667,0,7.38,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('847452310',0,'59','MANTE, JESSERIE ANN','2022-06-13','2022-06-13 08:28:53','2022-06-13 12:01:36','','2022-06-13 12:12:25','2022-06-13 17:27:44','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1531760112',0,'59','MANTE, JESSERIE ANN','2022-06-14','2022-06-14 08:42:23','2022-06-14 12:00:58','','2022-06-14 12:12:25','2022-06-14 17:05:02','',0.7,0,7.3,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1255729596',0,'59','MANTE, JESSERIE ANN','2022-06-15','2022-06-15 08:09:27','2022-06-15 12:00:27','','2022-06-15 12:11:54','2022-06-15 17:09:59','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('474034762',0,'59','MANTE, JESSERIE ANN','2022-06-16','2022-06-16 08:25:25','2022-06-16 12:03:44','','2022-06-16 12:14:56','2022-06-16 17:11:43','',0.4166666666666667,0,7.58,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('55899578',0,'59','MANTE, JESSERIE ANN','2022-06-17','2022-06-17 08:15:54',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('676241338',0,'59','MANTE, JESSERIE ANN','2022-06-21','2022-06-21 08:12:50','2022-06-21 12:43:58','','2022-06-21 12:54:02','2022-06-21 17:22:16','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1983689715',0,'59','MANTE, JESSERIE ANN','2022-06-22','2022-06-22 08:25:12','2022-06-22 12:11:27','',NULL,'2022-06-22 17:37:33','',0.8333333333333334,0,7.16,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2096109007',0,'59','MANTE, JESSERIE ANN','2022-06-23','2022-06-23 08:14:58','2022-06-23 12:07:14','','2022-06-23 12:18:09','2022-06-23 17:21:14','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('861247324',0,'59','MANTE, JESSERIE ANN','2022-06-24','2022-06-24 08:32:13','2022-06-24 12:04:34','',NULL,'2022-06-24 17:07:16','',0.5333333333333333,0,3.47,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1232056757',0,'59','MANTE, JESSERIE ANN','2022-06-27','2022-06-27 07:50:58','2022-06-27 12:00:43','','2022-06-27 12:11:20','2022-06-27 17:07:34','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1769096693',0,'59','MANTE, JESSERIE ANN','2022-06-28','2022-06-28 08:12:15','2022-06-28 12:01:39','','2022-06-28 12:12:13','2022-06-28 17:44:56','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1525553732',0,'59','MANTE, JESSERIE ANN','2022-06-29','2022-06-29 07:40:10',NULL,'',NULL,'2022-06-29 20:45:37','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('245571529',0,'59','MANTE, JESSERIE ANN','2022-06-30','2022-06-30 08:32:37','2022-06-30 12:02:13','','2022-06-30 12:16:11','2022-06-30 17:29:55','',0.5333333333333333,0,7.470000000000001,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('722257292',0,'59','MANTE, JESSERIE ANN','2022-07-18','2022-07-18 08:23:02','2022-07-18 12:00:27','','2022-07-18 12:11:25','2022-07-18 17:10:25','',0.38333333333333336,0,7.62,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('78426311',0,'59','MANTE, JESSERIE ANN','2022-07-19','2022-07-19 08:43:15','2022-07-19 12:00:13','','2022-07-19 12:11:14','2022-07-19 17:05:48','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('243425886',0,'59','MANTE, JESSERIE ANN','2022-07-20','2022-07-20 08:28:48','2022-07-20 12:00:24','','2022-07-20 12:11:04','2022-07-20 17:22:14','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('771355259',0,'59','MANTE, JESSERIE ANN','2022-07-21','2022-07-21 08:13:23',NULL,'','2022-07-21 13:11:11','2022-07-21 17:25:43','',0.18333333333333332,0,3.82,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1307295918',0,'59','MANTE, JESSERIE ANN','2022-07-22','2022-07-22 08:10:51','2022-07-22 12:01:20','','2022-07-22 12:12:38',NULL,'',0.16666666666666666,0,3.83,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('421879548',0,'59','MANTE, JESSERIE ANN','2022-07-25','2022-07-25 08:26:42','2022-07-25 12:07:17','','2022-07-25 12:18:10','2022-07-25 17:11:58','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('196837458',0,'6','ARNOCO, ELMA MORENO','2022-06-13','2022-06-13 07:52:49','2022-06-13 12:02:28','','2022-06-13 12:48:41','2022-06-13 17:15:18','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('89320821',0,'6','ARNOCO, ELMA MORENO','2022-06-14',NULL,NULL,'','2022-06-14 12:51:32','2022-06-14 17:08:16','',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1323313894',0,'6','ARNOCO, ELMA MORENO','2022-06-15','2022-06-15 07:50:45','2022-06-15 12:34:20','','2022-06-15 12:45:01','2022-06-15 17:16:02','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('333592370',0,'6','ARNOCO, ELMA MORENO','2022-06-16','2022-06-16 07:32:34',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1727928044',0,'6','ARNOCO, ELMA MORENO','2022-06-17','2022-06-17 08:16:27',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('183617928',0,'6','ARNOCO, ELMA MORENO','2022-06-20','2022-06-20 08:00:34','2022-06-20 12:41:04','','2022-06-20 12:54:53','2022-06-20 17:08:45','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('903238222',0,'6','ARNOCO, ELMA MORENO','2022-06-21','2022-06-21 08:24:04','2022-06-21 12:01:50','','2022-06-21 12:12:39','2022-06-21 17:11:24','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('328023911',0,'6','ARNOCO, ELMA MORENO','2022-06-22','2022-06-22 08:15:19','2022-06-22 12:08:15','',NULL,'2022-06-22 17:01:03','',0.25,0,3.75,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1437161431',0,'6','ARNOCO, ELMA MORENO','2022-06-23','2022-06-23 08:26:20','2022-06-23 12:04:44','','2022-06-23 12:15:14',NULL,'',0.43333333333333335,0,3.57,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('956091026',0,'6','ARNOCO, ELMA MORENO','2022-06-24','2022-06-24 08:27:37',NULL,'','2022-06-24 12:59:06','2022-06-24 17:40:01','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1392673951',0,'6','ARNOCO, ELMA MORENO','2022-06-27','2022-06-27 08:03:29','2022-06-27 12:01:01','',NULL,'2022-06-27 18:17:09','',0.05,0,3.95,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('429619838',0,'6','ARNOCO, ELMA MORENO','2022-06-28','2022-06-28 08:48:46','2022-06-28 12:14:07','',NULL,NULL,'',0.8,0,3.2,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('154538443',0,'6','ARNOCO, ELMA MORENO','2022-06-30',NULL,'2022-06-30 12:10:27','','2022-06-30 12:26:17','2022-06-30 18:26:42','',0,0,4,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('163527312',0,'6','ARNOCO, ELMA MORENO','2022-07-18',NULL,NULL,'',NULL,'2022-07-18 17:39:08','',0,0,0,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('155366432',0,'6','ARNOCO, ELMA MORENO','2022-07-19','2022-07-19 08:25:34',NULL,'',NULL,'2022-07-19 17:52:32','',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('297165817',0,'6','ARNOCO, ELMA MORENO','2022-07-20',NULL,NULL,'','2022-07-20 12:18:09','2022-07-20 17:58:25','',0,0,4,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('414447738',0,'6','ARNOCO, ELMA MORENO','2022-07-21','2022-07-21 09:25:54',NULL,'',NULL,'2022-07-21 17:09:48','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('724381998',0,'6','ARNOCO, ELMA MORENO','2022-07-25','2022-07-25 09:02:08',NULL,'',NULL,'2022-07-25 21:00:01','',0,0,0,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1985318927',0,'60','MARTINES, SUSAN MORTAL','2022-06-01','2022-06-01 05:28:45','2022-06-01 12:00:17','','2022-06-01 12:15:33','2022-06-01 17:00:21','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('142154060',0,'60','MARTINES, SUSAN MORTAL','2022-06-02','2022-06-02 05:40:59','2022-06-02 12:00:46','','2022-06-02 12:13:56','2022-06-02 17:00:26','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1865237337',0,'60','MARTINES, SUSAN MORTAL','2022-06-03','2022-06-03 05:37:27','2022-06-03 12:00:46','','2022-06-03 12:13:17','2022-06-03 17:00:09','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('138433376',0,'60','MARTINES, SUSAN MORTAL','2022-06-06','2022-06-06 05:40:01','2022-06-06 12:09:24','','2022-06-06 12:28:41','2022-06-06 17:00:04','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('157592943',0,'60','MARTINES, SUSAN MORTAL','2022-06-07','2022-06-07 05:38:25','2022-06-07 12:00:25','','2022-06-07 12:12:10','2022-06-07 17:00:09','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1830836447',0,'60','MARTINES, SUSAN MORTAL','2022-06-08','2022-06-08 06:12:16','2022-06-08 12:09:16','','2022-06-08 12:22:52','2022-06-08 17:00:13','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('214209780',0,'60','MARTINES, SUSAN MORTAL','2022-06-09','2022-06-09 05:41:16','2022-06-09 12:00:17','','2022-06-09 12:11:53','2022-06-09 17:00:14','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1651245326',0,'60','MARTINES, SUSAN MORTAL','2022-06-10','2022-06-10 05:48:46','2022-06-10 12:00:15','','2022-06-10 12:13:10','2022-06-10 17:01:11','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1280630967',0,'60','MARTINES, SUSAN MORTAL','2022-06-13','2022-06-13 05:37:47','2022-06-13 12:00:16','','2022-06-13 12:10:18','2022-06-13 17:00:16','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('173826475',0,'60','MARTINES, SUSAN MORTAL','2022-06-14','2022-06-14 05:57:05','2022-06-14 12:00:30','','2022-06-14 12:23:49','2022-06-14 17:00:52','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('438189004',0,'60','MARTINES, SUSAN MORTAL','2022-06-15','2022-06-15 05:28:27','2022-06-15 12:00:09','','2022-06-15 12:22:38','2022-06-15 17:00:24','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('2141829365',0,'60','MARTINES, SUSAN MORTAL','2022-06-16','2022-06-16 05:36:17','2022-06-16 12:01:42','','2022-06-16 12:27:08','2022-06-16 17:00:29','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('632870863',0,'60','MARTINES, SUSAN MORTAL','2022-06-17','2022-06-17 05:42:58','2022-06-17 12:00:30','','2022-06-17 12:12:59','2022-06-17 17:00:11','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('117123490',0,'60','MARTINES, SUSAN MORTAL','2022-06-20','2022-06-20 06:21:37','2022-06-20 12:00:12','','2022-06-20 12:11:12','2022-06-20 17:00:39','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('329047301',0,'60','MARTINES, SUSAN MORTAL','2022-06-21','2022-06-21 05:58:43','2022-06-21 12:03:07','','2022-06-21 12:15:06','2022-06-21 17:00:04','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1447927794',0,'60','MARTINES, SUSAN MORTAL','2022-06-22','2022-06-22 06:05:13','2022-06-22 12:00:18','','2022-06-22 12:12:52','2022-06-22 17:03:15','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1613634379',0,'60','MARTINES, SUSAN MORTAL','2022-06-23','2022-06-23 05:42:14','2022-06-23 12:02:55','','2022-06-23 12:12:55','2022-06-23 17:00:30','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('6600931',0,'60','MARTINES, SUSAN MORTAL','2022-06-24','2022-06-24 05:47:21','2022-06-24 12:00:12','','2022-06-24 12:10:22','2022-06-24 17:00:20','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1196863582',0,'60','MARTINES, SUSAN MORTAL','2022-06-27','2022-06-27 05:32:38','2022-06-27 12:06:15','','2022-06-27 12:16:43','2022-06-27 17:37:12','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1552625713',0,'60','MARTINES, SUSAN MORTAL','2022-06-28','2022-06-28 05:58:33','2022-06-28 12:00:14','','2022-06-28 12:11:06',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('596567146',0,'60','MARTINES, SUSAN MORTAL','2022-06-30','2022-06-30 06:08:50','2022-06-30 12:03:30','','2022-06-30 12:13:41',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('42917552',0,'60','MARTINES, SUSAN MORTAL','2022-07-18','2022-07-18 05:53:30','2022-07-18 12:01:01','','2022-07-18 12:11:15','2022-07-18 17:00:24','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1628807965',0,'60','MARTINES, SUSAN MORTAL','2022-07-19','2022-07-19 06:01:16','2022-07-19 12:00:18','','2022-07-19 12:14:11','2022-07-19 17:00:17','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('196860227',0,'60','MARTINES, SUSAN MORTAL','2022-07-20','2022-07-20 05:53:42','2022-07-20 12:00:28','','2022-07-20 12:11:39','2022-07-20 17:00:12','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('894546707',0,'60','MARTINES, SUSAN MORTAL','2022-07-21','2022-07-21 06:02:44','2022-07-21 12:03:35','','2022-07-21 12:27:53','2022-07-21 17:00:35','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('271999691',0,'60','MARTINES, SUSAN MORTAL','2022-07-22','2022-07-22 05:56:15','2022-07-22 12:00:12','','2022-07-22 12:12:01','2022-07-22 17:00:12','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('2131367839',0,'60','MARTINES, SUSAN MORTAL','2022-07-25','2022-07-25 06:01:30','2022-07-25 12:00:12','','2022-07-25 12:11:57','2022-07-25 17:00:20','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('311117601',0,'60','MARTINES, SUSAN MORTAL','2022-07-26','2022-07-26 05:30:12',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1236083756',0,'61','MARZAN, JANETH ALGABRE','2022-06-01','2022-06-01 07:18:55','2022-06-01 12:05:42','','2022-06-01 12:17:18','2022-06-01 17:06:31','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1738299510',0,'61','MARZAN, JANETH ALGABRE','2022-06-02','2022-06-02 08:13:11','2022-06-02 12:34:31','',NULL,'2022-06-02 17:37:14','',0.21666666666666667,0,3.78,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('426828769',0,'61','MARZAN, JANETH ALGABRE','2022-06-03','2022-06-03 07:38:23','2022-06-03 12:07:39','','2022-06-03 12:30:44','2022-06-03 17:04:18','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('125983175',0,'61','MARZAN, JANETH ALGABRE','2022-06-06','2022-06-06 06:54:54','2022-06-06 12:11:26','','2022-06-06 12:23:18','2022-06-06 17:05:31','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('978646482',0,'61','MARZAN, JANETH ALGABRE','2022-06-07','2022-06-07 07:44:12',NULL,'',NULL,'2022-06-07 17:45:35','',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('324240488',0,'61','MARZAN, JANETH ALGABRE','2022-06-08','2022-06-08 07:32:23','2022-06-08 12:17:18','','2022-06-08 12:30:20','2022-06-08 17:27:30','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('628904866',0,'61','MARZAN, JANETH ALGABRE','2022-06-09','2022-06-09 07:46:27','2022-06-09 12:17:39','','2022-06-09 12:29:54','2022-06-09 17:05:23','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1233150416',0,'61','MARZAN, JANETH ALGABRE','2022-06-10','2022-06-10 07:32:16','2022-06-10 12:17:25','','2022-06-10 12:28:30','2022-06-10 17:07:40','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('2026448780',0,'61','MARZAN, JANETH ALGABRE','2022-06-13','2022-06-13 07:55:24','2022-06-13 12:39:23','','2022-06-13 12:51:29','2022-06-13 17:07:15','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1002768324',0,'61','MARZAN, JANETH ALGABRE','2022-06-14','2022-06-14 07:37:01','2022-06-14 12:08:23','','2022-06-14 12:20:20','2022-06-14 17:10:46','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('223957541',0,'61','MARZAN, JANETH ALGABRE','2022-06-15','2022-06-15 07:45:29','2022-06-15 12:07:56','','2022-06-15 12:29:40','2022-06-15 17:12:39','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1237899198',0,'61','MARZAN, JANETH ALGABRE','2022-06-16','2022-06-16 07:47:38','2022-06-16 12:07:05','','2022-06-16 12:21:51','2022-06-16 18:26:32','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('707213347',0,'61','MARZAN, JANETH ALGABRE','2022-06-20','2022-06-20 07:39:47',NULL,'','2022-06-20 12:36:20','2022-06-20 17:18:11','',0,0,4,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('2062527597',0,'61','MARZAN, JANETH ALGABRE','2022-06-21','2022-06-21 07:24:00','2022-06-21 12:06:27','',NULL,'2022-06-21 17:16:52','',0,0,4,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('473155077',0,'61','MARZAN, JANETH ALGABRE','2022-06-22','2022-06-22 07:55:41','2022-06-22 12:32:02','','2022-06-22 12:43:20','2022-06-22 17:20:11','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2008948132',0,'61','MARZAN, JANETH ALGABRE','2022-06-23','2022-06-23 07:50:01','2022-06-23 12:05:48','','2022-06-23 12:16:13','2022-06-23 17:54:25','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1737546999',0,'61','MARZAN, JANETH ALGABRE','2022-06-24',NULL,NULL,'','2022-06-24 13:35:40','2022-06-24 17:06:40','',0.5833333333333334,0,3.42,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1088390305',0,'61','MARZAN, JANETH ALGABRE','2022-06-27','2022-06-27 07:28:06',NULL,'',NULL,'2022-06-27 17:25:58','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1241302793',0,'61','MARZAN, JANETH ALGABRE','2022-06-28','2022-06-28 08:26:41','2022-06-28 12:33:27','','2022-06-28 12:45:30','2022-06-28 17:28:39','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1828387220',0,'61','MARZAN, JANETH ALGABRE','2022-06-29','2022-06-29 05:29:20',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1704412962',0,'61','MARZAN, JANETH ALGABRE','2022-06-30','2022-06-30 07:36:57',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('187728250',0,'61','MARZAN, JANETH ALGABRE','2022-07-18','2022-07-18 06:52:56','2022-07-18 12:00:07','','2022-07-18 12:17:40','2022-07-18 17:15:47','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('166440508',0,'61','MARZAN, JANETH ALGABRE','2022-07-19','2022-07-19 07:05:33','2022-07-19 12:07:50','','2022-07-19 12:18:14','2022-07-19 17:15:02','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1599013139',0,'61','MARZAN, JANETH ALGABRE','2022-07-20',NULL,'2022-07-20 12:37:58','','2022-07-20 12:48:04','2022-07-20 18:07:52','',0,0,4,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1013719425',0,'61','MARZAN, JANETH ALGABRE','2022-07-21','2022-07-21 07:17:24','2022-07-21 12:23:53','','2022-07-21 12:35:13','2022-07-21 17:14:42','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('154671197',0,'61','MARZAN, JANETH ALGABRE','2022-07-22','2022-07-22 07:22:57','2022-07-22 12:14:12','',NULL,'2022-07-22 17:00:23','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1596758834',0,'61','MARZAN, JANETH ALGABRE','2022-07-25','2022-07-25 07:11:44','2022-07-25 12:06:26','','2022-07-25 12:17:04','2022-07-25 17:04:02','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1174897049',0,'61','MARZAN, JANETH ALGABRE','2022-07-26','2022-07-26 07:43:11',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('950928685',0,'62','MARZAN, MARK BENN VILOAN','2022-06-01',NULL,NULL,'',NULL,'2022-06-01 17:31:20','',0,0,0,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('959804994',0,'62','MARZAN, MARK BENN VILOAN','2022-06-02',NULL,NULL,'','2022-06-02 13:06:28','2022-06-02 17:25:16','',0.1,0,3.9,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('498118224',0,'62','MARZAN, MARK BENN VILOAN','2022-06-03','2022-06-03 08:42:24',NULL,'',NULL,'2022-06-03 17:03:03','',0,0,0,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1230385717',0,'62','MARZAN, MARK BENN VILOAN','2022-06-06','2022-06-06 08:24:27',NULL,'',NULL,'2022-06-06 17:27:42','',0,0,0,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1387926993',0,'62','MARZAN, MARK BENN VILOAN','2022-06-07',NULL,NULL,'','2022-06-07 13:13:30','2022-06-07 17:07:12','',0.21666666666666667,0,3.78,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('954135633',0,'62','MARZAN, MARK BENN VILOAN','2022-06-08','2022-06-08 09:35:42',NULL,'',NULL,'2022-06-08 17:25:52','',0,0,0,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1401040186',0,'62','MARZAN, MARK BENN VILOAN','2022-06-09','2022-06-09 09:04:11',NULL,'',NULL,'2022-06-09 17:20:41','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1433976618',0,'62','MARZAN, MARK BENN VILOAN','2022-06-10','2022-06-10 09:32:17',NULL,'',NULL,'2022-06-10 17:49:26','',0,0,0,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('31617470',0,'62','MARZAN, MARK BENN VILOAN','2022-06-13','2022-06-13 08:21:39',NULL,'',NULL,'2022-06-13 17:34:54','',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1365034234',0,'62','MARZAN, MARK BENN VILOAN','2022-06-15','2022-06-15 08:58:46',NULL,'',NULL,'2022-06-15 17:03:29','',0,0,0,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('364985250',0,'62','MARZAN, MARK BENN VILOAN','2022-06-16','2022-06-16 08:34:22',NULL,'',NULL,'2022-06-16 17:20:49','',0,0,0,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1060652255',0,'62','MARZAN, MARK BENN VILOAN','2022-06-23','2022-06-23 08:25:15',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1177429227',0,'62','MARZAN, MARK BENN VILOAN','2022-06-27','2022-06-27 08:53:29',NULL,'',NULL,'2022-06-27 21:22:43','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1351497421',0,'62','MARZAN, MARK BENN VILOAN','2022-06-28','2022-06-28 09:23:13',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('932123213',0,'62','MARZAN, MARK BENN VILOAN','2022-06-29','2022-06-29 03:47:41',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('31007986',0,'62','MARZAN, MARK BENN VILOAN','2022-06-30',NULL,NULL,'','2022-06-30 13:09:57','2022-06-30 17:49:08','',0.15,0,3.85,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('2057811299',0,'62','MARZAN, MARK BENN VILOAN','2022-07-18','2022-07-18 09:41:32',NULL,'',NULL,'2022-07-18 17:38:16','',0,0,0,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2042950397',0,'62','MARZAN, MARK BENN VILOAN','2022-07-19','2022-07-19 09:20:11',NULL,'',NULL,'2022-07-19 17:11:31','',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('922386326',0,'62','MARZAN, MARK BENN VILOAN','2022-07-21','2022-07-21 09:15:20',NULL,'','2022-07-21 13:15:36',NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1778504854',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-01','2022-06-01 08:07:33','2022-06-01 12:09:35','','2022-06-01 13:07:26','2022-06-01 17:35:04','',0.23333333333333334,0,7.76,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1164494958',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-02','2022-06-02 08:20:42','2022-06-02 12:46:03','','2022-06-02 13:01:46','2022-06-02 17:37:05','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('2133272287',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-03','2022-06-03 08:08:15','2022-06-03 12:22:34','','2022-06-03 12:45:28','2022-06-03 17:38:26','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1615673583',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-06','2022-06-06 08:04:10','2022-06-06 12:02:21','','2022-06-06 12:22:27','2022-06-06 18:34:35','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('2034677433',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-07','2022-06-07 07:58:04','2022-06-07 12:07:03','','2022-06-07 12:58:08','2022-06-07 18:02:03','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('2054903782',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-08','2022-06-08 08:02:33','2022-06-08 12:11:06','','2022-06-08 12:22:36','2022-06-08 18:58:05','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1632816717',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-09','2022-06-09 08:00:58',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('2027680882',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-13','2022-06-13 07:50:32',NULL,'',NULL,'2022-06-13 17:43:40','',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('625980233',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-14','2022-06-14 08:10:17','2022-06-14 12:45:00','','2022-06-14 12:55:16','2022-06-14 17:24:23','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('2037968888',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-15','2022-06-15 08:00:40','2022-06-15 12:06:14','','2022-06-15 12:18:35','2022-06-15 17:51:04','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1913303714',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-16','2022-06-16 07:58:11','2022-06-16 12:48:50','','2022-06-16 13:00:29','2022-06-16 18:55:10','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('859963515',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-17','2022-06-17 07:54:59','2022-06-17 12:46:19','','2022-06-17 13:02:12','2022-06-17 17:55:42','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1404657482',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-18',NULL,NULL,'','2022-06-18 13:56:21','2022-06-18 17:12:17','',0.9333333333333333,0,3.07,'0','','','','','','','',0,'2022-06-18 08:00:00','2022-06-18 17:00:00','regular','N/A','N/A',0,0),('207794068',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-19',NULL,NULL,'','2022-06-19 16:41:44',NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-19 08:00:00','2022-06-19 17:00:00','regular','N/A','N/A',0,0),('1109362284',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-20','2022-06-20 06:41:17','2022-06-20 12:06:01','','2022-06-20 12:16:15','2022-06-20 17:35:07','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('537411402',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-21','2022-06-21 07:42:53','2022-06-21 12:05:44','','2022-06-21 12:32:40','2022-06-21 17:37:46','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1023200002',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-22','2022-06-22 08:03:07',NULL,'',NULL,'2022-06-22 17:43:17','',0,0,0,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1540054494',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-23','2022-06-23 07:39:48','2022-06-23 12:07:07','','2022-06-23 12:59:00','2022-06-23 18:18:10','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1691489017',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-24','2022-06-24 08:12:41','2022-06-24 12:11:22','','2022-06-24 12:24:33','2022-06-24 19:34:03','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1601069070',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-26',NULL,NULL,'','2022-06-26 14:54:25','2022-06-26 18:59:05','',1.9,0,2.1,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('223253258',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-27','2022-06-27 08:11:49','2022-06-27 12:14:43','','2022-06-27 12:40:09','2022-06-27 20:47:51','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1050065411',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-28','2022-06-28 07:40:56','2022-06-28 12:21:35','','2022-06-28 12:35:30','2022-06-28 17:54:53','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('721388847',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-29','2022-06-29 05:32:16',NULL,'',NULL,'2022-06-29 20:42:39','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1784670852',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-06-30','2022-06-30 08:07:18','2022-06-30 12:48:39','','2022-06-30 13:00:26','2022-06-30 18:16:08','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1279019275',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-16','2022-07-16 09:57:19',NULL,'',NULL,'2022-07-16 16:54:04','',0,0,0,'0','','','','','','','',0,'2022-07-16 08:00:00','2022-07-16 17:00:00','regular','N/A','N/A',0,0),('166971599',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-18','2022-07-18 07:59:43','2022-07-18 12:09:57','','2022-07-18 12:40:39','2022-07-18 17:25:15','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1205240571',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-19','2022-07-19 08:09:12','2022-07-19 12:10:30','','2022-07-19 12:42:49','2022-07-19 17:41:42','',0.15,0,7.85,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1006856276',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-20','2022-07-20 08:05:10','2022-07-20 12:22:59','','2022-07-20 12:45:43','2022-07-20 17:37:46','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1822419258',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-21','2022-07-21 08:04:43','2022-07-21 12:51:11','','2022-07-21 13:03:20','2022-07-21 18:00:20','',0.11666666666666667,0,7.880000000000001,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('461210358',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-22','2022-07-22 08:02:40','2022-07-22 12:16:44','','2022-07-22 12:41:51','2022-07-22 17:18:22','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1428732801',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-25','2022-07-25 08:08:29','2022-07-25 12:21:46','','2022-07-25 13:01:28','2022-07-25 17:36:53','',0.15,0,7.85,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1225410651',0,'63','MONATO, RAVELYEN CALIPAYAN','2022-07-26','2022-07-26 08:10:59',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1051787328',0,'64','MONTES, GENERICK GROTES','2022-06-01','2022-06-01 07:40:40','2022-06-01 12:00:31','','2022-06-01 12:16:23','2022-06-01 22:20:26','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1600811275',0,'64','MONTES, GENERICK GROTES','2022-06-02','2022-06-02 07:45:55',NULL,'',NULL,'2022-06-02 18:25:10','',0,0,0,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('971177936',0,'64','MONTES, GENERICK GROTES','2022-06-03','2022-06-03 07:37:14','2022-06-03 12:03:11','','2022-06-03 12:43:29',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('465696151',0,'64','MONTES, GENERICK GROTES','2022-06-06','2022-06-06 07:23:29','2022-06-06 12:10:36','','2022-06-06 12:21:04','2022-06-06 17:42:28','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('23094363',0,'64','MONTES, GENERICK GROTES','2022-06-07','2022-06-07 07:42:25','2022-06-07 12:02:44','','2022-06-07 12:25:02',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('2065926374',0,'64','MONTES, GENERICK GROTES','2022-06-08','2022-06-08 07:43:10','2022-06-08 12:03:39','','2022-06-08 12:49:51','2022-06-08 17:04:45','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('2039532409',0,'64','MONTES, GENERICK GROTES','2022-06-09','2022-06-09 07:21:28','2022-06-09 12:07:01','','2022-06-09 12:44:09','2022-06-09 21:41:53','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1950906851',0,'64','MONTES, GENERICK GROTES','2022-06-10','2022-06-10 07:33:14','2022-06-10 12:05:52','','2022-06-10 12:53:13','2022-06-10 17:27:44','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1688757093',0,'64','MONTES, GENERICK GROTES','2022-06-15',NULL,NULL,'','2022-06-15 13:03:03','2022-06-15 17:23:11','',0.05,0,3.95,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('864277538',0,'64','MONTES, GENERICK GROTES','2022-06-16','2022-06-16 07:41:09','2022-06-16 12:06:53','','2022-06-16 12:48:34','2022-06-16 17:53:33','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('2126045159',0,'64','MONTES, GENERICK GROTES','2022-06-17','2022-06-17 07:43:40','2022-06-17 12:12:14','','2022-06-17 12:56:59','2022-06-17 17:16:35','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1553876777',0,'64','MONTES, GENERICK GROTES','2022-06-20','2022-06-20 07:42:31','2022-06-20 12:03:34','','2022-06-20 13:01:56','2022-06-20 17:19:41','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1367605524',0,'64','MONTES, GENERICK GROTES','2022-06-21','2022-06-21 07:37:25','2022-06-21 12:06:10','','2022-06-21 13:02:10','2022-06-21 17:07:12','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2143646732',0,'64','MONTES, GENERICK GROTES','2022-06-22','2022-06-22 07:39:48','2022-06-22 12:05:47','','2022-06-22 12:46:46','2022-06-22 17:21:06','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1877516171',0,'64','MONTES, GENERICK GROTES','2022-06-23','2022-06-23 07:47:22','2022-06-23 12:09:42','','2022-06-23 12:51:06','2022-06-23 17:15:42','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1686360374',0,'64','MONTES, GENERICK GROTES','2022-06-24','2022-06-24 07:46:50','2022-06-24 12:06:37','','2022-06-24 12:41:47','2022-06-24 17:36:22','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1832330690',0,'64','MONTES, GENERICK GROTES','2022-06-26','2022-06-26 10:42:20',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('1873990065',0,'64','MONTES, GENERICK GROTES','2022-06-27','2022-06-27 07:47:54','2022-06-27 12:04:08','','2022-06-27 12:34:57','2022-06-27 17:21:32','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1865415395',0,'64','MONTES, GENERICK GROTES','2022-06-28','2022-06-28 07:45:10','2022-06-28 12:08:50','','2022-06-28 12:57:44','2022-06-28 18:24:46','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('370386849',0,'64','MONTES, GENERICK GROTES','2022-06-30','2022-06-30 07:35:19','2022-06-30 12:08:02','','2022-06-30 12:45:59','2022-06-30 18:01:23','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1308755915',0,'64','MONTES, GENERICK GROTES','2022-07-18','2022-07-18 07:45:55','2022-07-18 12:08:00','','2022-07-18 12:38:40','2022-07-18 17:53:45','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1711998417',0,'64','MONTES, GENERICK GROTES','2022-07-19','2022-07-19 07:45:54','2022-07-19 12:04:36','','2022-07-19 12:38:16','2022-07-19 17:58:28','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1330405187',0,'64','MONTES, GENERICK GROTES','2022-07-20','2022-07-20 07:52:03','2022-07-20 12:14:48','','2022-07-20 12:54:21','2022-07-20 17:54:38','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1690114961',0,'64','MONTES, GENERICK GROTES','2022-07-21','2022-07-21 07:46:32','2022-07-21 12:05:18','','2022-07-21 12:18:19','2022-07-21 17:13:08','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1668882757',0,'64','MONTES, GENERICK GROTES','2022-07-22','2022-07-22 07:33:24','2022-07-22 12:14:06','','2022-07-22 13:13:29','2022-07-22 21:05:52','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1116148761',0,'64','MONTES, GENERICK GROTES','2022-07-25','2022-07-25 07:50:56','2022-07-25 12:10:45','',NULL,'2022-07-25 17:46:49','',0,0,4,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('652635735',0,'64','MONTES, GENERICK GROTES','2022-07-26','2022-07-26 07:46:18',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1916948667',0,'66','NOVO, JUDYVIE EYANA','2022-06-01','2022-06-01 07:54:22','2022-06-01 12:00:27','','2022-06-01 12:16:15','2022-06-01 17:23:08','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1504173714',0,'66','NOVO, JUDYVIE EYANA','2022-06-02','2022-06-02 07:31:39',NULL,'',NULL,'2022-06-02 18:25:19','',0,0,0,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1902378541',0,'66','NOVO, JUDYVIE EYANA','2022-06-03','2022-06-03 07:50:29','2022-06-03 12:03:07','','2022-06-03 12:43:44','2022-06-03 17:54:37','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('745598429',0,'66','NOVO, JUDYVIE EYANA','2022-06-06','2022-06-06 07:45:17','2022-06-06 12:08:42','','2022-06-06 12:18:57','2022-06-06 17:19:23','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('726645700',0,'66','NOVO, JUDYVIE EYANA','2022-06-07','2022-06-07 07:28:20','2022-06-07 12:02:48','','2022-06-07 12:25:16','2022-06-07 17:44:13','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('202214249',0,'66','NOVO, JUDYVIE EYANA','2022-06-08','2022-06-08 07:48:40','2022-06-08 12:03:45','','2022-06-08 12:25:27','2022-06-08 17:01:34','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('763431470',0,'66','NOVO, JUDYVIE EYANA','2022-06-09','2022-06-09 07:43:16','2022-06-09 12:07:31','','2022-06-09 12:40:20','2022-06-09 17:28:02','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1842275844',0,'66','NOVO, JUDYVIE EYANA','2022-06-10','2022-06-10 07:49:15','2022-06-10 12:04:37','','2022-06-10 12:59:46','2022-06-10 17:23:10','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('358649548',0,'66','NOVO, JUDYVIE EYANA','2022-06-17','2022-06-17 07:23:36','2022-06-17 12:10:35','','2022-06-17 13:04:28','2022-06-17 17:11:09','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1574201896',0,'66','NOVO, JUDYVIE EYANA','2022-06-20','2022-06-20 07:44:16','2022-06-20 12:01:09','','2022-06-20 12:58:10','2022-06-20 17:15:50','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('604277506',0,'66','NOVO, JUDYVIE EYANA','2022-06-21','2022-06-21 07:24:34','2022-06-21 12:04:00','','2022-06-21 12:48:06','2022-06-21 17:02:17','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1831994814',0,'66','NOVO, JUDYVIE EYANA','2022-06-22','2022-06-22 07:43:54','2022-06-22 12:03:08','','2022-06-22 13:00:20','2022-06-22 17:02:26','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2082275199',0,'66','NOVO, JUDYVIE EYANA','2022-06-23','2022-06-23 07:50:55','2022-06-23 12:09:27','','2022-06-23 13:09:18','2022-06-23 17:34:58','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1629876231',0,'66','NOVO, JUDYVIE EYANA','2022-06-24','2022-06-24 07:49:21','2022-06-24 12:03:05','','2022-06-24 13:05:42','2022-06-24 17:33:35','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1416481218',0,'66','NOVO, JUDYVIE EYANA','2022-06-25',NULL,NULL,'','2022-06-25 13:06:41','2022-06-25 23:41:25','',0.1,0,3.9,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('1659927219',0,'66','NOVO, JUDYVIE EYANA','2022-06-26','2022-06-26 09:12:10',NULL,'',NULL,'2022-06-26 19:08:59','',0,0,0,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('2061140279',0,'66','NOVO, JUDYVIE EYANA','2022-06-27','2022-06-27 07:44:23','2022-06-27 12:01:39','','2022-06-27 12:35:03','2022-06-27 17:04:40','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('2086982390',0,'66','NOVO, JUDYVIE EYANA','2022-06-28','2022-06-28 07:46:41','2022-06-28 12:08:46','','2022-06-28 12:53:28','2022-06-28 18:44:20','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('613478718',0,'66','NOVO, JUDYVIE EYANA','2022-06-29',NULL,NULL,'',NULL,'2022-06-29 19:50:45','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1610474647',0,'66','NOVO, JUDYVIE EYANA','2022-06-30','2022-06-30 07:38:37','2022-06-30 12:08:08','','2022-06-30 12:46:02','2022-06-30 17:07:57','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('844944573',0,'66','NOVO, JUDYVIE EYANA','2022-07-18','2022-07-18 07:59:18','2022-07-18 12:00:50','','2022-07-18 12:53:25','2022-07-18 17:49:33','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1680002194',0,'66','NOVO, JUDYVIE EYANA','2022-07-19','2022-07-19 07:55:01','2022-07-19 12:02:50','','2022-07-19 12:57:53','2022-07-19 17:06:24','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1690616328',0,'66','NOVO, JUDYVIE EYANA','2022-07-20','2022-07-20 08:04:12','2022-07-20 12:01:16','',NULL,'2022-07-20 18:19:52','',0.06666666666666667,0,3.93,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('425627337',0,'66','NOVO, JUDYVIE EYANA','2022-07-21','2022-07-21 07:54:00','2022-07-21 12:03:52','','2022-07-21 13:06:58','2022-07-21 17:06:09','',0.1,0,7.9,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('189321905',0,'66','NOVO, JUDYVIE EYANA','2022-07-22','2022-07-22 07:49:33','2022-07-22 12:02:07','','2022-07-22 13:06:19','2022-07-22 17:09:48','',0.1,0,7.9,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1294991465',0,'66','NOVO, JUDYVIE EYANA','2022-07-25','2022-07-25 08:12:14','2022-07-25 12:03:17','','2022-07-25 13:22:25','2022-07-25 17:01:31','',0.5666666666666667,0,7.43,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1961910781',0,'66','NOVO, JUDYVIE EYANA','2022-07-26','2022-07-26 08:07:14',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('795960431',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-01','2022-06-01 08:01:02','2022-06-01 12:00:23','','2022-06-01 12:57:59','2022-06-01 17:03:14','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('581043860',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-02','2022-06-02 08:01:38','2022-06-02 12:00:18','','2022-06-02 13:00:54','2022-06-02 17:04:12','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('182633247',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-03','2022-06-03 07:49:17','2022-06-03 12:02:06','','2022-06-03 12:47:38','2022-06-03 17:01:51','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1382597060',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-06','2022-06-06 07:38:38','2022-06-06 12:37:35','',NULL,'2022-06-06 17:06:59','',0,0,4,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('352363455',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-07','2022-06-07 07:09:52','2022-06-07 12:36:34','','2022-06-07 12:46:36','2022-06-07 17:03:15','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1023689672',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-09','2022-06-09 07:58:48',NULL,'','2022-06-09 13:25:22','2022-06-09 17:19:31','',0.4166666666666667,0,3.58,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1999293311',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-10','2022-06-10 07:53:34','2022-06-10 12:05:32','','2022-06-10 13:13:45',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1685484082',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-13','2022-06-13 07:58:31','2022-06-13 12:01:25','','2022-06-13 12:11:45','2022-06-13 17:19:59','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('497728281',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-14','2022-06-14 07:58:20','2022-06-14 12:51:11','',NULL,'2022-06-14 17:10:55','',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('2090213652',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-15','2022-06-15 07:46:20','2022-06-15 12:01:17','','2022-06-15 12:53:40','2022-06-15 17:06:32','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1446375929',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-16','2022-06-16 07:24:46','2022-06-16 12:05:00','','2022-06-16 12:32:13','2022-06-16 18:04:28','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1470902322',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-17','2022-06-17 07:46:26','2022-06-17 12:06:06','','2022-06-17 12:48:52','2022-06-17 17:35:24','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('562421214',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-20','2022-06-20 07:55:02','2022-06-20 12:00:45','','2022-06-20 13:17:13','2022-06-20 17:16:39','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1182458628',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-21','2022-06-21 08:07:14','2022-06-21 12:06:51','',NULL,NULL,'',0.11666666666666667,0,3.88,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('893410154',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-22','2022-06-22 08:04:31','2022-06-22 12:00:11','','2022-06-22 13:01:44','2022-06-22 17:24:16','',0.08333333333333333,0,7.91,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1994513890',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-23','2022-06-23 07:52:59','2022-06-23 12:02:26','','2022-06-23 12:13:34','2022-06-23 17:06:29','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('434693117',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-24','2022-06-24 07:59:59','2022-06-24 12:27:34','','2022-06-24 12:45:32','2022-06-24 17:28:02','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('802838747',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-27','2022-06-27 07:48:01','2022-06-27 12:02:53','','2022-06-27 12:17:56','2022-06-27 17:08:19','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1553810047',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-28','2022-06-28 07:48:45','2022-06-28 12:57:37','',NULL,'2022-06-28 17:31:52','',0,0,4,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('2033771309',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-29',NULL,NULL,'',NULL,'2022-06-29 20:15:56','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1875680349',0,'67','PACULBA, EMMALEN SALDIVAR','2022-06-30','2022-06-30 07:55:09','2022-06-30 12:01:01','','2022-06-30 13:07:21','2022-06-30 17:07:53','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('150971893',0,'67','PACULBA, EMMALEN SALDIVAR','2022-07-18','2022-07-18 07:23:15','2022-07-18 12:05:15','','2022-07-18 12:53:03','2022-07-18 17:26:51','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1640375904',0,'67','PACULBA, EMMALEN SALDIVAR','2022-07-19','2022-07-19 07:46:54','2022-07-19 11:59:07','','2022-07-19 12:53:19','2022-07-19 17:06:07','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('338955937',0,'67','PACULBA, EMMALEN SALDIVAR','2022-07-20','2022-07-20 07:25:02','2022-07-20 12:52:14','',NULL,'2022-07-20 17:24:29','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('898670728',0,'67','PACULBA, EMMALEN SALDIVAR','2022-07-21',NULL,NULL,'',NULL,'2022-07-21 17:24:09','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('267384099',0,'67','PACULBA, EMMALEN SALDIVAR','2022-07-22','2022-07-22 07:08:58','2022-07-22 11:59:43','','2022-07-22 12:52:33','2022-07-22 17:24:02','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('824355318',0,'67','PACULBA, EMMALEN SALDIVAR','2022-07-25','2022-07-25 07:24:26','2022-07-25 12:02:47','','2022-07-25 12:45:28','2022-07-25 17:40:17','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1302614487',0,'67','PACULBA, EMMALEN SALDIVAR','2022-07-26','2022-07-26 07:08:52',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1610707633',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-07','2022-06-07 08:30:19','2022-06-07 12:51:01','','2022-06-07 13:03:31','2022-06-07 19:16:57','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1873983115',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-08','2022-06-08 07:58:59','2022-06-08 12:13:59','','2022-06-08 13:06:00',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('276854246',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-09','2022-06-09 05:18:51',NULL,'',NULL,'2022-06-09 17:55:52','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('336676369',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-10','2022-06-10 08:03:48','2022-06-10 12:09:04','',NULL,NULL,'',0.05,0,3.95,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1900696241',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-13','2022-06-13 08:25:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1962473811',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-14','2022-06-14 08:38:26',NULL,'','2022-06-14 12:59:23','2022-06-14 18:27:58','',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('438419133',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-15','2022-06-15 08:10:31','2022-06-15 12:02:30','','2022-06-15 13:05:08','2022-06-15 17:55:54','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('165270441',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-16','2022-06-16 08:17:27','2022-06-16 12:09:39','','2022-06-16 12:22:10','2022-06-16 21:47:36','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('385652093',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-17','2022-06-17 08:10:26',NULL,'',NULL,'2022-06-17 19:25:07','',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('582210365',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-20','2022-06-20 08:19:59','2022-06-20 12:00:48','','2022-06-20 13:00:13','2022-06-20 18:24:29','',0.31666666666666665,0,7.68,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1966966911',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-22','2022-06-22 08:25:55','2022-06-22 12:47:59','','2022-06-22 13:11:04','2022-06-22 17:16:23','',0.6,0,7.4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1997822930',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-27','2022-06-27 08:43:10','2022-06-27 12:28:53','','2022-06-27 12:58:26','2022-06-27 18:11:29','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('909650746',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-28','2022-06-28 07:58:46','2022-06-28 12:00:01','','2022-06-28 13:05:24',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('563526916',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-29','2022-06-29 08:06:50','2022-06-29 12:05:56','','2022-06-29 12:16:06','2022-06-29 23:59:29','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1055736417',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-06-30','2022-06-30 08:27:25','2022-06-30 12:31:20','','2022-06-30 12:53:34','2022-06-30 17:08:50','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1598459642',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-07-18',NULL,NULL,'','2022-07-18 12:01:32','2022-07-18 17:40:18','',0,0,4,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2086600901',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-07-19','2022-07-19 08:00:58','2022-07-19 12:03:53','','2022-07-19 13:01:10','2022-07-19 17:08:38','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('496673292',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-07-20','2022-07-20 08:18:57','2022-07-20 12:03:02','','2022-07-20 13:04:46','2022-07-20 17:42:55','',0.36666666666666664,0,7.630000000000001,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1073684969',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-07-21','2022-07-21 08:31:35','2022-07-21 12:04:12','','2022-07-21 12:22:10','2022-07-21 18:23:23','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1403455941',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-07-22','2022-07-22 07:58:30','2022-07-22 12:55:50','','2022-07-22 13:07:49','2022-07-22 17:27:12','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1625587933',0,'68','PALTIQUERA, ROSLYN MABANAN','2022-07-25','2022-07-25 08:09:17','2022-07-25 12:05:12','','2022-07-25 12:19:45','2022-07-25 17:48:10','',0.15,0,7.85,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('29736177',0,'69','PAREJA., THELMA POLANCOS','2022-06-06','2022-06-06 06:26:34','2022-06-06 12:48:21','','2022-06-06 13:01:15','2022-06-06 17:02:45','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1725278220',0,'69','PAREJA., THELMA POLANCOS','2022-06-07','2022-06-07 07:59:04','2022-06-07 12:55:58','','2022-06-07 13:06:05','2022-06-07 17:49:10','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('649471471',0,'69','PAREJA., THELMA POLANCOS','2022-06-08','2022-06-08 07:46:49','2022-06-08 12:58:26','','2022-06-08 13:08:50','2022-06-08 17:12:09','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1832553261',0,'69','PAREJA., THELMA POLANCOS','2022-06-09','2022-06-09 07:58:39','2022-06-09 12:33:03','','2022-06-09 12:43:28','2022-06-09 17:56:58','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1781340152',0,'69','PAREJA., THELMA POLANCOS','2022-06-10','2022-06-10 08:00:00','2022-06-10 12:08:43','','2022-06-10 12:20:11','2022-06-10 17:38:00','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('520924836',0,'69','PAREJA., THELMA POLANCOS','2022-06-13','2022-06-13 06:57:29','2022-06-13 12:40:44','','2022-06-13 12:51:59','2022-06-13 17:26:13','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('736458536',0,'69','PAREJA., THELMA POLANCOS','2022-06-14','2022-06-14 07:56:29','2022-06-14 12:29:36','','2022-06-14 12:51:26','2022-06-14 17:11:40','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1880213855',0,'69','PAREJA., THELMA POLANCOS','2022-06-15','2022-06-15 06:37:55','2022-06-15 12:42:18','','2022-06-15 12:52:42','2022-06-15 15:23:16','',0,1.6,6.4,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('597180900',0,'69','PAREJA., THELMA POLANCOS','2022-06-16','2022-06-16 06:42:58','2022-06-16 12:30:35','','2022-06-16 12:41:00','2022-06-16 17:17:03','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1004074952',0,'69','PAREJA., THELMA POLANCOS','2022-06-17','2022-06-17 08:20:04','2022-06-17 12:23:58','','2022-06-17 12:40:00','2022-06-17 17:45:08','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1168993697',0,'69','PAREJA., THELMA POLANCOS','2022-06-20','2022-06-20 08:07:42',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1413742023',0,'69','PAREJA., THELMA POLANCOS','2022-06-21','2022-06-21 07:05:51','2022-06-21 12:51:18','','2022-06-21 13:01:48',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('727863306',0,'69','PAREJA., THELMA POLANCOS','2022-06-22',NULL,NULL,'','2022-06-22 12:50:17','2022-06-22 17:22:15','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('10225196',0,'69','PAREJA., THELMA POLANCOS','2022-06-23','2022-06-23 07:29:46',NULL,'',NULL,'2022-06-23 17:59:07','',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('230338301',0,'69','PAREJA., THELMA POLANCOS','2022-06-24','2022-06-24 08:04:04','2022-06-24 12:03:51','','2022-06-24 12:14:20','2022-06-24 17:38:54','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1122071289',0,'69','PAREJA., THELMA POLANCOS','2022-06-27','2022-06-27 06:38:34',NULL,'',NULL,'2022-06-27 19:33:58','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('886027313',0,'69','PAREJA., THELMA POLANCOS','2022-06-28','2022-06-28 08:50:57','2022-06-28 12:27:16','','2022-06-28 12:37:31','2022-06-28 17:28:27','',0.8333333333333334,0,7.17,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1718506463',0,'69','PAREJA., THELMA POLANCOS','2022-06-29','2022-06-29 05:15:57','2022-06-29 12:00:55','','2022-06-29 12:11:09',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1528141811',0,'69','PAREJA., THELMA POLANCOS','2022-06-30','2022-06-30 07:56:02','2022-06-30 12:25:41','','2022-06-30 12:36:44',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('905813777',0,'69','PAREJA., THELMA POLANCOS','2022-07-18','2022-07-18 06:32:42','2022-07-18 12:18:50','','2022-07-18 12:30:20','2022-07-18 17:42:08','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2141123193',0,'69','PAREJA., THELMA POLANCOS','2022-07-19','2022-07-19 07:17:32',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1151925480',0,'69','PAREJA., THELMA POLANCOS','2022-07-20','2022-07-20 07:31:05','2022-07-20 12:51:53','','2022-07-20 13:08:50',NULL,'',0,0,4,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('2119669455',0,'69','PAREJA., THELMA POLANCOS','2022-07-21','2022-07-21 08:15:06','2022-07-21 12:40:24','','2022-07-21 12:53:36','2022-07-21 17:09:15','',0.25,0,7.75,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1356705844',0,'69','PAREJA., THELMA POLANCOS','2022-07-22','2022-07-22 07:42:51','2022-07-22 12:19:00','','2022-07-22 12:29:51','2022-07-22 17:19:26','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('2069653261',0,'69','PAREJA., THELMA POLANCOS','2022-07-25',NULL,'2022-07-25 12:41:13','','2022-07-25 12:54:11','2022-07-25 17:26:37','',0,0,4,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('427894390',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-01','2022-06-01 08:29:14','2022-06-01 12:01:57','','2022-06-01 12:14:22','2022-06-01 17:41:31','',0.48333333333333334,0,7.52,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('411964962',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-02','2022-06-02 08:43:34','2022-06-02 12:04:14','','2022-06-02 12:19:46','2022-06-02 18:02:44','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1385606178',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-03','2022-06-03 08:39:01','2022-06-03 12:02:27','','2022-06-03 12:20:27','2022-06-03 19:31:47','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('157783013',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-06','2022-06-06 08:19:14',NULL,'',NULL,'2022-06-06 18:06:09','',0,0,0,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1988878908',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-07','2022-06-07 08:36:52','2022-06-07 12:06:42','','2022-06-07 12:23:12','2022-06-07 18:21:15','',0.6,0,7.4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1278819661',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-08','2022-06-08 07:58:54','2022-06-08 12:04:23','','2022-06-08 12:21:19','2022-06-08 18:25:42','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('86825974',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-09','2022-06-09 08:02:49','2022-06-09 12:01:24','','2022-06-09 12:14:50','2022-06-09 17:12:04','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1381928936',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-10','2022-06-10 08:37:58','2022-06-10 12:07:01','','2022-06-10 12:22:24','2022-06-10 17:32:50','',0.6166666666666667,0,7.38,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('2107789512',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-13','2022-06-13 08:51:05','2022-06-13 12:00:31','','2022-06-13 12:20:48','2022-06-13 17:36:38','',0.85,0,7.15,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1363612500',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-14',NULL,'2022-06-14 12:07:16','','2022-06-14 12:25:29','2022-06-14 17:36:59','',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1066104095',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-15','2022-06-15 08:32:33','2022-06-15 12:09:43','','2022-06-15 12:20:57','2022-06-15 17:45:49','',0.5333333333333333,0,7.470000000000001,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1828480819',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-16','2022-06-16 07:48:20','2022-06-16 12:03:17','','2022-06-16 12:15:26','2022-06-16 17:57:11','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1565315037',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-17','2022-06-17 08:21:15','2022-06-17 12:04:11','','2022-06-17 12:19:30','2022-06-17 18:17:36','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('127170976',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-21','2022-06-21 08:08:03','2022-06-21 12:01:11','','2022-06-21 12:21:59','2022-06-21 17:41:42','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('103817008',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-22','2022-06-22 07:58:21','2022-06-22 12:04:01','','2022-06-22 12:14:23','2022-06-22 17:05:37','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('954783720',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-23','2022-06-23 07:49:47','2022-06-23 12:01:47','','2022-06-23 12:23:12','2022-06-23 17:06:58','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('2119406656',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-27','2022-06-27 08:12:29','2022-06-27 12:04:43','','2022-06-27 12:25:03','2022-06-27 18:12:55','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('2059370886',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-28','2022-06-28 08:01:31','2022-06-28 12:01:17','','2022-06-28 12:15:53','2022-06-28 17:15:53','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('577314364',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-29','2022-06-29 08:16:32','2022-06-29 12:01:00','','2022-06-29 12:22:39','2022-06-29 19:31:26','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1251240004',0,'7','ARRAJI, FATIMA ESPINIDO','2022-06-30','2022-06-30 08:56:40','2022-06-30 12:07:40','','2022-06-30 12:22:29','2022-06-30 18:08:45','',0.9333333333333333,0,7.07,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1000550305',0,'70','PASQUIL, REX TEMPLATORA','2022-06-13','2022-06-13 09:07:20','2022-06-13 12:09:41','','2022-06-13 12:22:22','2022-06-13 17:17:05','',1.1166666666666667,0,6.88,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1521724831',0,'70','PASQUIL, REX TEMPLATORA','2022-06-16',NULL,NULL,'','2022-06-16 13:07:13','2022-06-16 17:06:38','',0.11666666666666667,0,3.88,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1896335987',0,'70','PASQUIL, REX TEMPLATORA','2022-06-17','2022-06-17 08:33:06','2022-06-17 12:50:38','','2022-06-17 13:00:42','2022-06-17 17:43:40','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('195428941',0,'70','PASQUIL, REX TEMPLATORA','2022-06-20',NULL,NULL,'','2022-06-20 13:03:20','2022-06-20 17:03:06','',0.05,0,3.95,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('892985779',0,'70','PASQUIL, REX TEMPLATORA','2022-06-24','2022-06-24 08:27:13','2022-06-24 12:03:58','','2022-06-24 12:22:14','2022-06-24 17:04:56','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('443131537',0,'70','PASQUIL, REX TEMPLATORA','2022-06-27',NULL,'2022-06-27 12:04:55','','2022-06-27 12:40:39','2022-06-27 19:13:15','',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1491054329',0,'70','PASQUIL, REX TEMPLATORA','2022-06-28','2022-06-28 08:36:05','2022-06-28 12:13:46','','2022-06-28 12:34:16','2022-06-28 17:12:12','',0.6,0,7.4,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1182284424',0,'70','PASQUIL, REX TEMPLATORA','2022-07-18','2022-07-18 08:45:40','2022-07-18 12:12:06','','2022-07-18 12:24:34','2022-07-18 17:01:41','',0.75,0,7.25,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('933861014',0,'70','PASQUIL, REX TEMPLATORA','2022-07-19','2022-07-19 08:51:19','2022-07-19 12:00:52','','2022-07-19 12:12:21','2022-07-19 17:02:13','',0.85,0,7.15,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('947422321',0,'70','PASQUIL, REX TEMPLATORA','2022-07-20','2022-07-20 08:36:47','2022-07-20 12:01:40','','2022-07-20 12:22:32','2022-07-20 17:03:23','',0.6,0,7.4,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1060107979',0,'70','PASQUIL, REX TEMPLATORA','2022-07-21','2022-07-21 08:43:40','2022-07-21 12:06:17','','2022-07-21 12:21:00','2022-07-21 17:16:26','',0.7166666666666667,0,7.279999999999999,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('319240918',0,'70','PASQUIL, REX TEMPLATORA','2022-07-22','2022-07-22 08:57:09','2022-07-22 12:04:01','','2022-07-22 12:18:09','2022-07-22 17:11:27','',0.95,0,7.05,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1784231723',0,'70','PASQUIL, REX TEMPLATORA','2022-07-25','2022-07-25 09:16:24','2022-07-25 12:13:59','','2022-07-25 12:29:53','2022-07-25 14:24:47','',1.2666666666666666,2.5833333333333335,4.15,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('956660092',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-01','2022-06-01 07:32:34','2022-06-01 12:31:27','','2022-06-01 12:42:08','2022-06-01 17:03:20','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('401145523',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-02','2022-06-02 07:33:46','2022-06-02 12:33:13','','2022-06-02 12:43:14','2022-06-02 17:00:57','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1048112414',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-03','2022-06-03 07:35:19','2022-06-03 12:37:05','','2022-06-03 12:47:54','2022-06-03 17:00:38','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('675057610',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-06','2022-06-06 07:30:13','2022-06-06 12:46:00','','2022-06-06 12:56:53','2022-06-06 17:00:39','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1997449828',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-07','2022-06-07 07:37:14','2022-06-07 12:14:18','','2022-06-07 12:24:31','2022-06-07 17:03:24','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('254803313',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-08','2022-06-08 07:41:56','2022-06-08 12:29:20','','2022-06-08 12:40:22','2022-06-08 17:00:51','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('163269269',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-09','2022-06-09 07:34:38','2022-06-09 12:32:07','','2022-06-09 12:43:14','2022-06-09 17:00:40','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('736080585',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-10','2022-06-10 07:31:20','2022-06-10 12:46:15','','2022-06-10 12:56:24','2022-06-10 17:01:20','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('223979760',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-13','2022-06-13 07:35:24','2022-06-13 12:40:19','','2022-06-13 12:53:24','2022-06-13 17:00:52','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1110280179',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-14','2022-06-14 07:39:19','2022-06-14 12:37:56','','2022-06-14 12:50:03','2022-06-14 17:00:58','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('587201878',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-15','2022-06-15 07:35:58','2022-06-15 12:37:26','','2022-06-15 12:47:28','2022-06-15 17:01:34','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1893207909',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-16','2022-06-16 07:37:52','2022-06-16 12:34:40','','2022-06-16 12:47:36','2022-06-16 17:00:50','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1216952943',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-20','2022-06-20 07:31:29','2022-06-20 12:36:11','','2022-06-20 12:47:51','2022-06-20 17:01:00','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('145171886',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-21','2022-06-21 07:36:53','2022-06-21 12:02:56','','2022-06-21 12:14:30','2022-06-21 17:01:26','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('2112882059',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-22',NULL,'2022-06-22 12:27:16','','2022-06-22 12:40:42','2022-06-22 17:02:58','',0,0,4,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('141828113',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-23','2022-06-23 07:38:21','2022-06-23 12:31:11','','2022-06-23 12:49:49','2022-06-23 17:00:25','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('703805628',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-24','2022-06-24 07:37:29','2022-06-24 12:40:44','','2022-06-24 12:51:42','2022-06-24 17:02:09','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1236768208',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-27','2022-06-27 07:24:59',NULL,'',NULL,'2022-06-27 17:00:45','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1995991726',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-28','2022-06-28 07:48:35','2022-06-28 12:35:41','','2022-06-28 12:45:59','2022-06-28 17:00:46','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('2089171974',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-29','2022-06-29 07:34:46',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('113781892',0,'71','RAMIREZ, EVELINDA PARADERO','2022-06-30','2022-06-30 07:28:58','2022-06-30 12:39:21','','2022-06-30 12:50:23','2022-06-30 17:02:21','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('2093366913',0,'71','RAMIREZ, EVELINDA PARADERO','2022-07-25','2022-07-25 07:34:59','2022-07-25 12:46:14','','2022-07-25 13:01:36','2022-07-25 17:08:03','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('850514319',0,'71','RAMIREZ, EVELINDA PARADERO','2022-07-26','2022-07-26 07:43:54',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1470866280',0,'72','SALARDA, CONIE PIODO','2022-06-01','2022-06-01 07:30:48','2022-06-01 12:05:49','','2022-06-01 12:17:24','2022-06-01 17:06:43','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('2100191819',0,'72','SALARDA, CONIE PIODO','2022-06-02','2022-06-02 07:49:43','2022-06-02 12:14:23','',NULL,NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1175475946',0,'72','SALARDA, CONIE PIODO','2022-06-03','2022-06-03 09:37:53','2022-06-03 12:08:15','',NULL,NULL,'',1.6166666666666667,0,2.38,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('73272154',0,'72','SALARDA, CONIE PIODO','2022-06-06','2022-06-06 07:46:33','2022-06-06 12:11:43','','2022-06-06 12:23:23','2022-06-06 18:22:37','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1604366618',0,'72','SALARDA, CONIE PIODO','2022-06-07','2022-06-07 07:44:20','2022-06-07 12:06:20','','2022-06-07 12:19:17','2022-06-07 17:46:32','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1735436486',0,'72','SALARDA, CONIE PIODO','2022-06-09','2022-06-09 07:31:11','2022-06-09 12:16:59','','2022-06-09 12:29:39','2022-06-09 17:04:48','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('167248763',0,'72','SALARDA, CONIE PIODO','2022-06-10','2022-06-10 07:46:19','2022-06-10 12:17:13','','2022-06-10 12:28:11','2022-06-10 17:07:04','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('2761314',0,'72','SALARDA, CONIE PIODO','2022-06-13','2022-06-13 07:53:59','2022-06-13 12:39:18','','2022-06-13 12:50:28','2022-06-13 17:07:44','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('412685040',0,'72','SALARDA, CONIE PIODO','2022-06-14','2022-06-14 07:58:26','2022-06-14 12:08:29','','2022-06-14 12:19:59','2022-06-14 17:10:37','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1780503075',0,'72','SALARDA, CONIE PIODO','2022-06-15','2022-06-15 08:03:58','2022-06-15 12:08:09','','2022-06-15 12:29:51','2022-06-15 17:12:18','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('79090195',0,'72','SALARDA, CONIE PIODO','2022-06-16','2022-06-16 07:52:14','2022-06-16 12:04:48','','2022-06-16 12:33:30','2022-06-16 17:15:39','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('502663021',0,'72','SALARDA, CONIE PIODO','2022-06-17','2022-06-17 08:14:14','2022-06-17 12:06:47','','2022-06-17 12:48:29','2022-06-17 17:13:01','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('106443291',0,'72','SALARDA, CONIE PIODO','2022-06-20','2022-06-20 07:58:17','2022-06-20 12:03:47','','2022-06-20 12:40:39','2022-06-20 17:17:53','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('613435422',0,'72','SALARDA, CONIE PIODO','2022-06-21','2022-06-21 07:54:55','2022-06-21 12:07:40','','2022-06-21 12:45:52','2022-06-21 17:13:15','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('3919069',0,'72','SALARDA, CONIE PIODO','2022-06-22','2022-06-22 07:30:23','2022-06-22 12:31:55','','2022-06-22 12:42:55','2022-06-22 17:18:54','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('731492559',0,'72','SALARDA, CONIE PIODO','2022-06-23','2022-06-23 07:56:06','2022-06-23 12:13:25','','2022-06-23 12:24:45','2022-06-23 17:03:39','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('991675476',0,'72','SALARDA, CONIE PIODO','2022-06-28','2022-06-28 08:09:27','2022-06-28 12:33:21','','2022-06-28 12:44:45','2022-06-28 17:25:44','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('2026696729',0,'72','SALARDA, CONIE PIODO','2022-06-29','2022-06-29 06:15:32','2022-06-29 12:32:44','','2022-06-29 12:43:57',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('409378983',0,'72','SALARDA, CONIE PIODO','2022-06-30','2022-06-30 07:53:48','2022-06-30 12:04:54','','2022-06-30 12:20:38','2022-06-30 17:14:01','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('404770938',0,'72','SALARDA, CONIE PIODO','2022-07-18','2022-07-18 07:57:50','2022-07-18 12:00:24','','2022-07-18 12:17:48','2022-07-18 17:07:41','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('96727986',0,'72','SALARDA, CONIE PIODO','2022-07-19','2022-07-19 07:54:07','2022-07-19 12:07:44','','2022-07-19 12:18:22','2022-07-19 17:18:58','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('147617552',0,'72','SALARDA, CONIE PIODO','2022-07-20','2022-07-20 07:26:01','2022-07-20 12:37:53','','2022-07-20 12:48:21','2022-07-20 17:56:48','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('121423068',0,'72','SALARDA, CONIE PIODO','2022-07-21','2022-07-21 07:44:49','2022-07-21 12:24:11','','2022-07-21 12:35:21','2022-07-21 17:14:31','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1558630113',0,'72','SALARDA, CONIE PIODO','2022-07-25','2022-07-25 08:04:12','2022-07-25 12:06:32','','2022-07-25 12:17:34','2022-07-25 17:03:42','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('183811656',0,'72','SALARDA, CONIE PIODO','2022-07-26','2022-07-26 08:02:03',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('2104033382',0,'73','SAPID, ANALYN CAPILITAN','2022-06-01','2022-06-01 08:12:57','2022-06-01 12:02:33','','2022-06-01 12:52:04','2022-06-01 17:44:26','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('2036006417',0,'73','SAPID, ANALYN CAPILITAN','2022-06-02','2022-06-02 08:27:00','2022-06-02 12:20:34','','2022-06-02 13:10:03','2022-06-02 17:42:58','',0.6166666666666667,0,7.38,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1177093915',0,'73','SAPID, ANALYN CAPILITAN','2022-06-03','2022-06-03 08:41:30','2022-06-03 12:03:02','','2022-06-03 13:15:18','2022-06-03 18:10:42','',0.9333333333333333,0,7.07,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('807962305',0,'73','SAPID, ANALYN CAPILITAN','2022-06-06','2022-06-06 08:26:57','2022-06-06 12:48:56','','2022-06-06 13:03:22','2022-06-06 22:31:06','',0.48333333333333334,0,7.52,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1086867258',0,'73','SAPID, ANALYN CAPILITAN','2022-06-07','2022-06-07 08:20:33','2022-06-07 12:53:54','','2022-06-07 13:05:05','2022-06-07 18:36:25','',0.41666666666666663,0,7.59,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('655934571',0,'73','SAPID, ANALYN CAPILITAN','2022-06-08','2022-06-08 08:12:08','2022-06-08 12:20:42','','2022-06-08 12:33:54',NULL,'',0.2,0,3.8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('737981499',0,'73','SAPID, ANALYN CAPILITAN','2022-06-09','2022-06-09 05:18:46',NULL,'','2022-06-09 13:08:32','2022-06-09 18:34:39','',0.13333333333333333,0,3.87,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('647146790',0,'73','SAPID, ANALYN CAPILITAN','2022-06-10','2022-06-10 08:49:52','2022-06-10 12:17:31','',NULL,'2022-06-10 18:25:23','',0.8166666666666667,0,3.18,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('942687701',0,'73','SAPID, ANALYN CAPILITAN','2022-06-13','2022-06-13 08:07:14',NULL,'',NULL,'2022-06-13 17:32:08','',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1311726018',0,'73','SAPID, ANALYN CAPILITAN','2022-06-14','2022-06-14 08:29:20','2022-06-14 12:44:49','','2022-06-14 12:56:25','2022-06-14 17:54:22','',0.48333333333333334,0,7.52,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('423540991',0,'73','SAPID, ANALYN CAPILITAN','2022-06-15','2022-06-15 06:57:18','2022-06-15 12:40:59','','2022-06-15 12:51:42','2022-06-15 19:31:04','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1109088683',0,'73','SAPID, ANALYN CAPILITAN','2022-06-16','2022-06-16 07:45:34','2022-06-16 12:49:57','','2022-06-16 13:01:19',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('2026696080',0,'73','SAPID, ANALYN CAPILITAN','2022-06-17','2022-06-17 08:28:01','2022-06-17 12:45:52','','2022-06-17 13:02:16','2022-06-17 20:00:55','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('719867188',0,'73','SAPID, ANALYN CAPILITAN','2022-06-20','2022-06-20 08:07:10','2022-06-20 12:34:02','','2022-06-20 12:47:07','2022-06-20 18:37:19','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('2065211689',0,'73','SAPID, ANALYN CAPILITAN','2022-06-21','2022-06-21 08:24:23','2022-06-21 12:49:53','','2022-06-21 13:00:00','2022-06-21 17:38:21','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1249226339',0,'73','SAPID, ANALYN CAPILITAN','2022-06-22','2022-06-22 08:33:18','2022-06-22 12:43:29','','2022-06-22 12:53:35','2022-06-22 19:34:32','',0.55,0,7.45,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1365731316',0,'73','SAPID, ANALYN CAPILITAN','2022-06-23','2022-06-23 08:47:23','2022-06-23 12:52:00','','2022-06-23 13:02:13','2022-06-23 20:38:54','',0.8166666666666667,0,7.19,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1488118885',0,'73','SAPID, ANALYN CAPILITAN','2022-06-24','2022-06-24 07:28:59','2022-06-24 12:12:34','','2022-06-24 12:25:38','2022-06-24 23:51:26','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1280321632',0,'73','SAPID, ANALYN CAPILITAN','2022-06-27','2022-06-27 07:56:54','2022-06-27 12:52:27','','2022-06-27 13:02:47','2022-06-27 21:11:24','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1937274109',0,'73','SAPID, ANALYN CAPILITAN','2022-06-28','2022-06-28 08:45:42','2022-06-28 12:21:04','',NULL,'2022-06-28 19:37:12','',0.75,0,3.25,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1456070278',0,'73','SAPID, ANALYN CAPILITAN','2022-06-29','2022-06-29 07:43:51',NULL,'','2022-06-29 12:47:44','2022-06-29 21:01:02','',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('58030292',0,'73','SAPID, ANALYN CAPILITAN','2022-06-30','2022-06-30 08:26:49','2022-06-30 12:48:46','','2022-06-30 13:05:38','2022-06-30 20:15:23','',0.5166666666666667,0,7.49,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('764814282',0,'73','SAPID, ANALYN CAPILITAN','2022-07-18','2022-07-18 09:04:04','2022-07-18 12:21:43','','2022-07-18 13:17:32','2022-07-18 19:21:00','',1.35,0,6.65,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1690375639',0,'73','SAPID, ANALYN CAPILITAN','2022-07-19','2022-07-19 08:33:30','2022-07-19 12:18:49','','2022-07-19 12:30:41','2022-07-19 17:45:16','',0.55,0,7.45,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('275850628',0,'73','SAPID, ANALYN CAPILITAN','2022-07-20','2022-07-20 08:51:49','2022-07-20 12:32:51','','2022-07-20 12:43:43','2022-07-20 18:00:39','',0.85,0,7.15,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('2108355128',0,'73','SAPID, ANALYN CAPILITAN','2022-07-21','2022-07-21 08:41:24','2022-07-21 12:41:01','','2022-07-21 12:51:43','2022-07-21 20:50:29','',0.6833333333333333,0,7.32,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('590609541',0,'73','SAPID, ANALYN CAPILITAN','2022-07-22','2022-07-22 08:36:04','2022-07-22 12:38:37','','2022-07-22 12:52:06','2022-07-22 19:22:33','',0.6,0,7.4,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1537250456',0,'73','SAPID, ANALYN CAPILITAN','2022-07-25','2022-07-25 09:06:01','2022-07-25 12:03:46','','2022-07-25 12:47:04','2022-07-25 20:33:15','',1.1,0,6.9,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('608232124',0,'73','SAPID, ANALYN CAPILITAN','2022-07-26','2022-07-26 08:22:59',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('531844030',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-01','2022-06-01 07:57:39','2022-06-01 12:28:11','','2022-06-01 12:38:41','2022-06-01 17:45:28','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('269264316',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-02','2022-06-02 08:15:09','2022-06-02 12:06:29','','2022-06-02 12:20:47','2022-06-02 17:43:31','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1547947839',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-03','2022-06-03 08:29:24','2022-06-03 12:02:14','','2022-06-03 13:11:03','2022-06-03 18:10:22','',0.6666666666666666,0,7.34,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('844332350',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-06','2022-06-06 08:27:22','2022-06-06 12:48:49','','2022-06-06 12:59:02','2022-06-06 22:30:59','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1874429473',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-07','2022-06-07 08:20:22','2022-06-07 12:54:03','','2022-06-07 13:04:51','2022-06-07 18:28:26','',0.39999999999999997,0,7.6,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('762718619',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-08','2022-06-08 08:12:00','2022-06-08 12:29:55','','2022-06-08 12:39:56',NULL,'',0.2,0,3.8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('297747853',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-09','2022-06-09 05:19:05','2022-06-09 12:23:36','','2022-06-09 13:08:16','2022-06-09 19:34:00','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1368843689',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-10','2022-06-10 08:16:27','2022-06-10 12:44:02','','2022-06-10 13:09:10','2022-06-10 18:25:12','',0.41666666666666663,0,7.58,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('719592711',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-13','2022-06-13 07:55:58','2022-06-13 12:16:14','','2022-06-13 12:41:37','2022-06-13 17:32:14','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1031684316',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-14','2022-06-14 08:18:03','2022-06-14 12:41:50','','2022-06-14 12:54:06','2022-06-14 18:00:08','',0.3,0,7.7,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('229628162',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-15','2022-06-15 06:32:01','2022-06-15 12:40:28','','2022-06-15 12:51:18','2022-06-15 19:31:01','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('945428823',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-16','2022-06-16 07:18:45','2022-06-16 12:48:25','','2022-06-16 12:59:03',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1530740099',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-17','2022-06-17 08:27:51','2022-06-17 12:49:24','','2022-06-17 13:00:24','2022-06-17 20:03:10','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1032432225',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-20','2022-06-20 07:37:42','2022-06-20 12:32:32','','2022-06-20 12:44:15','2022-06-20 18:31:27','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1375717375',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-21','2022-06-21 07:44:05','2022-06-21 12:13:08','','2022-06-21 12:56:05','2022-06-21 17:14:05','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('21321438',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-22','2022-06-22 08:11:18','2022-06-22 12:47:17','','2022-06-22 13:00:52','2022-06-22 19:34:55','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('351160027',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-23','2022-06-23 08:12:48','2022-06-23 12:07:39','','2022-06-23 12:57:55','2022-06-23 20:39:21','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1440023785',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-24','2022-06-24 06:23:25','2022-06-24 12:12:15','','2022-06-24 12:24:44','2022-06-24 23:51:56','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('2077824312',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-25',NULL,NULL,'',NULL,'2022-06-25 19:13:35','',0,0,0,'0','','','','','','','',0,'2022-06-25 08:00:00','2022-06-25 17:00:00','regular','N/A','N/A',0,0),('1677040816',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-27','2022-06-27 07:19:09','2022-06-27 12:22:34','','2022-06-27 13:03:19','2022-06-27 21:11:15','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('679506668',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-28','2022-06-28 08:02:47','2022-06-28 12:19:15','','2022-06-28 12:30:00','2022-06-28 19:37:14','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('272875638',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-29','2022-06-29 07:28:12',NULL,'',NULL,'2022-06-29 21:00:54','',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('215813128',0,'74','SAPID, MERNELITA CAPILITAN','2022-06-30','2022-06-30 08:26:22','2022-06-30 12:27:58','','2022-06-30 13:10:21','2022-06-30 20:15:16','',0.6,0,7.4,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('937928012',0,'74','SAPID, MERNELITA CAPILITAN','2022-07-18','2022-07-18 08:03:15','2022-07-18 12:18:37','','2022-07-18 12:31:57','2022-07-18 18:31:28','',0.05,0,7.95,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('425033124',0,'74','SAPID, MERNELITA CAPILITAN','2022-07-19','2022-07-19 08:31:29','2022-07-19 12:32:14','','2022-07-19 12:51:17','2022-07-19 18:28:40','',0.5166666666666667,0,7.48,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1287186276',0,'74','SAPID, MERNELITA CAPILITAN','2022-07-20','2022-07-20 08:52:41','2022-07-20 12:37:18','','2022-07-20 12:48:25','2022-07-20 18:27:48','',0.8666666666666667,0,7.13,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('47839114',0,'74','SAPID, MERNELITA CAPILITAN','2022-07-21','2022-07-21 08:42:43','2022-07-21 12:40:17','','2022-07-21 12:53:59','2022-07-21 20:50:32','',0.7,0,7.3,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1822797911',0,'74','SAPID, MERNELITA CAPILITAN','2022-07-22','2022-07-22 08:38:34','2022-07-22 12:35:55','','2022-07-22 12:52:57','2022-07-22 20:25:02','',0.6333333333333333,0,7.37,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('388749222',0,'74','SAPID, MERNELITA CAPILITAN','2022-07-25','2022-07-25 08:14:57','2022-07-25 12:46:50','','2022-07-25 13:00:16','2022-07-25 20:32:31','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1113323134',0,'74','SAPID, MERNELITA CAPILITAN','2022-07-26','2022-07-26 08:12:27',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1512762548',0,'75','SAYSON, DELBERT ORTEGA','2022-06-01','2022-06-01 08:07:36','2022-06-01 12:21:12','','2022-06-01 12:42:15','2022-06-01 17:39:54','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('421409229',0,'75','SAYSON, DELBERT ORTEGA','2022-06-02','2022-06-02 08:20:47','2022-06-02 12:30:24','','2022-06-02 13:00:02','2022-06-02 17:13:07','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1000792855',0,'75','SAYSON, DELBERT ORTEGA','2022-06-03','2022-06-03 08:08:18','2022-06-03 12:18:19','','2022-06-03 12:35:23','2022-06-03 18:05:53','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('2123083124',0,'75','SAYSON, DELBERT ORTEGA','2022-06-06','2022-06-06 08:04:05','2022-06-06 12:17:23','','2022-06-06 12:34:35','2022-06-06 17:21:55','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1203935543',0,'75','SAYSON, DELBERT ORTEGA','2022-06-07','2022-06-07 07:58:14','2022-06-07 12:27:51','','2022-06-07 12:53:15','2022-06-07 17:45:50','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('2066985732',0,'75','SAYSON, DELBERT ORTEGA','2022-06-08','2022-06-08 08:02:53','2022-06-08 12:17:07','','2022-06-08 12:56:25','2022-06-08 18:08:08','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('483413136',0,'75','SAYSON, DELBERT ORTEGA','2022-06-09','2022-06-09 08:00:55','2022-06-09 12:06:37','','2022-06-09 12:18:03','2022-06-09 17:33:21','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1959491630',0,'75','SAYSON, DELBERT ORTEGA','2022-06-10','2022-06-10 07:55:33','2022-06-10 12:11:01','','2022-06-10 12:36:17','2022-06-10 17:13:59','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('913112552',0,'75','SAYSON, DELBERT ORTEGA','2022-06-13','2022-06-13 07:50:40','2022-06-13 12:04:43','','2022-06-13 12:33:50','2022-06-13 17:07:33','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1377238542',0,'75','SAYSON, DELBERT ORTEGA','2022-06-14','2022-06-14 08:10:25','2022-06-14 12:16:54','','2022-06-14 12:38:47','2022-06-14 17:02:58','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1462221569',0,'75','SAYSON, DELBERT ORTEGA','2022-06-15','2022-06-15 08:01:15','2022-06-15 12:11:11','','2022-06-15 12:30:40','2022-06-15 17:40:36','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1016639114',0,'75','SAYSON, DELBERT ORTEGA','2022-06-16','2022-06-16 07:58:18','2022-06-16 12:08:11','','2022-06-16 12:31:56','2022-06-16 17:36:06','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1996723843',0,'75','SAYSON, DELBERT ORTEGA','2022-06-17','2022-06-17 07:55:02','2022-06-17 12:13:33','','2022-06-17 12:29:31','2022-06-17 17:46:59','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('417822868',0,'75','SAYSON, DELBERT ORTEGA','2022-06-20','2022-06-20 06:41:40','2022-06-20 12:05:25','','2022-06-20 12:15:52','2022-06-20 17:26:49','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('2127801048',0,'75','SAYSON, DELBERT ORTEGA','2022-06-21','2022-06-21 07:43:06','2022-06-21 12:06:21','','2022-06-21 12:29:59','2022-06-21 17:47:18','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('378281897',0,'75','SAYSON, DELBERT ORTEGA','2022-06-22','2022-06-22 08:03:13','2022-06-22 12:17:50','','2022-06-22 12:43:48','2022-06-22 17:50:28','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1018967148',0,'75','SAYSON, DELBERT ORTEGA','2022-06-23','2022-06-23 07:40:02','2022-06-23 12:02:34','','2022-06-23 12:27:57','2022-06-23 18:09:51','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('747207565',0,'75','SAYSON, DELBERT ORTEGA','2022-06-24','2022-06-24 08:12:36','2022-06-24 12:10:34','','2022-06-24 12:29:07','2022-06-24 17:10:01','',0.2,0,7.8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('240901950',0,'75','SAYSON, DELBERT ORTEGA','2022-06-27','2022-06-27 08:11:46','2022-06-27 12:19:13','','2022-06-27 12:35:30',NULL,'',0.18333333333333332,0,3.82,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('799093330',0,'75','SAYSON, DELBERT ORTEGA','2022-06-28','2022-06-28 07:41:12','2022-06-28 12:12:37','','2022-06-28 12:37:41','2022-06-28 17:34:52','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1426817478',0,'75','SAYSON, DELBERT ORTEGA','2022-06-29','2022-06-29 05:32:13','2022-06-29 12:05:53','','2022-06-29 12:18:52','2022-06-29 20:15:48','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1192129629',0,'75','SAYSON, DELBERT ORTEGA','2022-06-30','2022-06-30 08:07:24','2022-06-30 12:16:54','','2022-06-30 12:30:12','2022-06-30 18:03:27','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('335112942',0,'75','SAYSON, DELBERT ORTEGA','2022-07-18','2022-07-18 07:59:50','2022-07-18 12:08:09','','2022-07-18 12:48:37','2022-07-18 17:39:00','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1910430289',0,'75','SAYSON, DELBERT ORTEGA','2022-07-19','2022-07-19 08:09:10','2022-07-19 12:10:38','','2022-07-19 12:38:03','2022-07-19 18:04:42','',0.15,0,7.85,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1055992182',0,'75','SAYSON, DELBERT ORTEGA','2022-07-20','2022-07-20 08:05:23','2022-07-20 12:14:36','','2022-07-20 12:48:58','2022-07-20 17:30:16','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1174991149',0,'75','SAYSON, DELBERT ORTEGA','2022-07-21','2022-07-21 08:04:57','2022-07-21 12:25:57','','2022-07-21 12:49:35','2022-07-21 17:23:39','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('164657620',0,'75','SAYSON, DELBERT ORTEGA','2022-07-22','2022-07-22 08:02:57','2022-07-22 12:08:20','','2022-07-22 12:22:29','2022-07-22 17:13:49','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('581427521',0,'75','SAYSON, DELBERT ORTEGA','2022-07-25','2022-07-25 08:08:33',NULL,'',NULL,'2022-07-25 17:48:54','',0,0,0,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('23692256',0,'75','SAYSON, DELBERT ORTEGA','2022-07-26','2022-07-26 08:10:55',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1436461140',0,'76','SIAREZ, JOEL LARIOSA','2022-06-01','2022-06-01 07:56:49','2022-06-01 12:00:55','','2022-06-01 12:57:07','2022-06-01 17:38:15','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1338104048',0,'76','SIAREZ, JOEL LARIOSA','2022-06-02','2022-06-02 08:02:48','2022-06-02 12:00:57','','2022-06-02 12:58:02','2022-06-02 17:43:50','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1941143879',0,'76','SIAREZ, JOEL LARIOSA','2022-06-03','2022-06-03 08:07:20','2022-06-03 12:03:32','','2022-06-03 12:14:25','2022-06-03 17:07:40','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('911249659',0,'76','SIAREZ, JOEL LARIOSA','2022-06-06','2022-06-06 07:46:17','2022-06-06 12:01:17','','2022-06-06 12:12:33','2022-06-06 17:15:24','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1619764761',0,'76','SIAREZ, JOEL LARIOSA','2022-06-07','2022-06-07 07:52:54','2022-06-07 12:25:41','','2022-06-07 12:42:36','2022-06-07 18:04:11','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('189170539',0,'76','SIAREZ, JOEL LARIOSA','2022-06-08','2022-06-08 08:00:06','2022-06-08 12:10:10','','2022-06-08 12:22:44','2022-06-08 17:45:56','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('216935415',0,'76','SIAREZ, JOEL LARIOSA','2022-06-09','2022-06-09 07:55:03','2022-06-09 12:03:45','','2022-06-09 12:14:10','2022-06-09 17:37:57','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1917549679',0,'76','SIAREZ, JOEL LARIOSA','2022-06-10','2022-06-10 07:55:12','2022-06-10 12:00:05','','2022-06-10 12:12:15','2022-06-10 17:12:28','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1903992491',0,'76','SIAREZ, JOEL LARIOSA','2022-06-16','2022-06-16 07:57:34','2022-06-16 12:02:42','','2022-06-16 12:14:19','2022-06-16 18:06:01','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('480290048',0,'76','SIAREZ, JOEL LARIOSA','2022-06-17','2022-06-17 08:03:35','2022-06-17 12:02:01','','2022-06-17 12:20:12','2022-06-17 17:12:17','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1878107106',0,'76','SIAREZ, JOEL LARIOSA','2022-06-20','2022-06-20 07:59:03','2022-06-20 12:21:28','','2022-06-20 12:32:24','2022-06-20 17:37:42','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1083052229',0,'76','SIAREZ, JOEL LARIOSA','2022-06-21','2022-06-21 07:49:50','2022-06-21 12:01:59','','2022-06-21 12:13:38','2022-06-21 17:18:08','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('274662445',0,'76','SIAREZ, JOEL LARIOSA','2022-06-22','2022-06-22 08:11:30','2022-06-22 12:01:20','','2022-06-22 12:53:27','2022-06-22 17:18:46','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1003418091',0,'76','SIAREZ, JOEL LARIOSA','2022-06-23','2022-06-23 07:54:29','2022-06-23 12:01:20','','2022-06-23 12:14:38','2022-06-23 17:34:30','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1207305330',0,'76','SIAREZ, JOEL LARIOSA','2022-06-24','2022-06-24 07:50:35',NULL,'','2022-06-24 12:50:18','2022-06-24 17:02:30','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('464295718',0,'76','SIAREZ, JOEL LARIOSA','2022-06-27','2022-06-27 07:39:28','2022-06-27 12:00:20','','2022-06-27 12:11:05',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1131686675',0,'76','SIAREZ, JOEL LARIOSA','2022-06-28','2022-06-28 08:01:59','2022-06-28 12:00:26','','2022-06-28 12:48:22','2022-06-28 17:04:46','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1165961700',0,'76','SIAREZ, JOEL LARIOSA','2022-06-29','2022-06-29 05:46:15',NULL,'','2022-06-29 12:54:17','2022-06-29 20:34:56','',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('121382384',0,'76','SIAREZ, JOEL LARIOSA','2022-06-30','2022-06-30 07:40:43','2022-06-30 12:00:54','','2022-06-30 12:12:10','2022-06-30 17:01:49','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('217585333',0,'76','SIAREZ, JOEL LARIOSA','2022-07-16','2022-07-16 07:57:50',NULL,'',NULL,'2022-07-16 17:58:08','',0,0,0,'0','','','','','','','',0,'2022-07-16 08:00:00','2022-07-16 17:00:00','regular','N/A','N/A',0,0),('1855947931',0,'76','SIAREZ, JOEL LARIOSA','2022-07-17','2022-07-17 07:53:02',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-17 08:00:00','2022-07-17 17:00:00','regular','N/A','N/A',0,0),('1029753187',0,'76','SIAREZ, JOEL LARIOSA','2022-07-18','2022-07-18 08:03:32',NULL,'',NULL,'2022-07-18 20:01:45','',0,0,0,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('211803136',0,'76','SIAREZ, JOEL LARIOSA','2022-07-19','2022-07-19 07:51:13','2022-07-19 12:02:42','','2022-07-19 12:13:58','2022-07-19 17:24:52','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1672345575',0,'76','SIAREZ, JOEL LARIOSA','2022-07-20','2022-07-20 07:57:03','2022-07-20 12:08:49','','2022-07-20 12:19:04','2022-07-20 17:26:27','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('2028772556',0,'76','SIAREZ, JOEL LARIOSA','2022-07-21','2022-07-21 07:47:45','2022-07-21 12:05:25','','2022-07-21 12:16:10','2022-07-21 17:14:06','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('469494629',0,'76','SIAREZ, JOEL LARIOSA','2022-07-22','2022-07-22 07:59:03','2022-07-22 12:20:33','','2022-07-22 12:31:02','2022-07-22 17:06:34','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1261485479',0,'76','SIAREZ, JOEL LARIOSA','2022-07-25','2022-07-25 07:55:25','2022-07-25 12:03:31','','2022-07-25 12:15:48','2022-07-25 17:38:15','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1065037424',0,'76','SIAREZ, JOEL LARIOSA','2022-07-26','2022-07-26 08:04:26',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('682854992',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-01','2022-06-01 07:31:26','2022-06-01 12:40:28','','2022-06-01 12:51:50','2022-06-01 17:10:09','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1906579406',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-02','2022-06-02 07:22:19','2022-06-02 12:34:23','','2022-06-02 12:44:41','2022-06-02 17:01:08','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1671080096',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-03','2022-06-03 06:55:22','2022-06-03 12:42:41','','2022-06-03 12:52:48','2022-06-03 17:00:27','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('114830252',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-06','2022-06-06 06:45:53','2022-06-06 12:43:57','','2022-06-06 12:54:08','2022-06-06 17:02:56','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1873112547',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-07','2022-06-07 07:12:27','2022-06-07 12:22:49','','2022-06-07 12:37:49','2022-06-07 17:04:57','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1356313271',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-08','2022-06-08 07:18:58','2022-06-08 12:03:55','','2022-06-08 12:16:48','2022-06-08 17:01:06','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1225829999',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-09','2022-06-09 06:59:42','2022-06-09 12:42:06','','2022-06-09 12:58:53','2022-06-09 17:01:26','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('2053692985',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-10','2022-06-10 06:48:45','2022-06-10 12:42:47','','2022-06-10 13:04:19','2022-06-10 17:00:41','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('835842666',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-13','2022-06-13 07:10:28','2022-06-13 12:49:25','','2022-06-13 12:59:31',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('2046575792',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-14','2022-06-14 07:22:53','2022-06-14 12:39:09','','2022-06-14 12:50:48','2022-06-14 17:01:32','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1028939917',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-15','2022-06-15 07:24:22','2022-06-15 12:32:18','','2022-06-15 12:44:26','2022-06-15 17:01:28','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('807023800',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-16','2022-06-16 06:56:59','2022-06-16 12:35:08','','2022-06-16 12:48:18','2022-06-16 17:01:10','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1905266089',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-17','2022-06-17 08:01:14','2022-06-17 12:17:21','','2022-06-17 12:28:12','2022-06-17 17:14:30','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('681224643',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-20','2022-06-20 07:26:05','2022-06-20 12:32:03','','2022-06-20 12:48:59','2022-06-20 17:00:11','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('111527561',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-21','2022-06-21 06:54:02',NULL,'','2022-06-21 12:43:08','2022-06-21 17:04:03','',0,0,4,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('738144383',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-22','2022-06-22 07:29:27','2022-06-22 12:27:28','','2022-06-22 12:41:38','2022-06-22 17:04:00','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('2134432280',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-23','2022-06-23 07:11:02','2022-06-23 12:33:29','','2022-06-23 12:43:42','2022-06-23 17:12:40','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1751251098',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-24','2022-06-24 07:23:15','2022-06-24 12:38:23','','2022-06-24 12:50:57','2022-06-24 17:02:51','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1893539907',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-27','2022-06-27 07:01:37',NULL,'',NULL,'2022-06-27 17:01:23','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('2015443414',0,'77','SILVANO, ELENA ABRATIGUIN','2022-06-28','2022-06-28 07:02:39','2022-06-28 12:31:26','','2022-06-28 12:48:43','2022-06-28 17:01:41','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('759049542',0,'77','SILVANO, ELENA ABRATIGUIN','2022-07-18','2022-07-18 07:02:01','2022-07-18 12:33:41','','2022-07-18 12:46:44','2022-07-18 17:04:37','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('689193180',0,'77','SILVANO, ELENA ABRATIGUIN','2022-07-19','2022-07-19 07:58:53','2022-07-19 12:39:39','','2022-07-19 12:49:45','2022-07-19 17:04:25','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1226611512',0,'77','SILVANO, ELENA ABRATIGUIN','2022-07-20','2022-07-20 07:23:40','2022-07-20 12:35:47','','2022-07-20 12:47:00','2022-07-20 17:07:31','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('940983512',0,'77','SILVANO, ELENA ABRATIGUIN','2022-07-21',NULL,'2022-07-21 12:23:44','','2022-07-21 12:38:00','2022-07-21 17:00:19','',0,0,4,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1233937144',0,'77','SILVANO, ELENA ABRATIGUIN','2022-07-22','2022-07-22 07:51:14','2022-07-22 12:27:37','','2022-07-22 12:38:07','2022-07-22 17:01:36','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1580955845',0,'77','SILVANO, ELENA ABRATIGUIN','2022-07-25','2022-07-25 07:10:04','2022-07-25 12:43:04','','2022-07-25 12:55:26','2022-07-25 17:16:39','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('1852873904',0,'77','SILVANO, ELENA ABRATIGUIN','2022-07-26','2022-07-26 07:33:34',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('478745198',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-01','2022-06-01 08:35:04','2022-06-01 12:01:27','','2022-06-01 13:37:21','2022-06-01 17:05:07','',1.2000000000000002,0,6.8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('749969418',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-02','2022-06-02 08:36:59','2022-06-02 12:00:29','','2022-06-02 13:23:33','2022-06-02 17:00:50','',0.9833333333333334,0,7.02,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1236106118',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-03','2022-06-03 08:42:31','2022-06-03 12:02:08','',NULL,NULL,'',0.7,0,3.3,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('672378019',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-06','2022-06-06 08:17:11','2022-06-06 12:00:47','','2022-06-06 13:12:23','2022-06-06 17:02:58','',0.48333333333333334,0,7.52,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1742281421',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-07','2022-06-07 08:30:58','2022-06-07 12:00:08','','2022-06-07 13:24:48','2022-06-07 17:04:37','',0.9,0,7.1,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('800612060',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-08','2022-06-08 08:31:01','2022-06-08 12:00:06','','2022-06-08 13:24:52','2022-06-08 17:00:42','',0.9166666666666667,0,7.08,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('43745510',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-09','2022-06-09 08:32:56','2022-06-09 12:02:34','','2022-06-09 13:15:14','2022-06-09 17:01:28','',0.7833333333333333,0,7.220000000000001,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1288004972',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-10','2022-06-10 08:22:05','2022-06-10 12:00:28','','2022-06-10 13:24:57','2022-06-10 17:00:25','',0.7666666666666666,0,7.23,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1281368209',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-13','2022-06-13 08:16:00','2022-06-13 12:02:44','','2022-06-13 13:07:17','2022-06-13 17:01:58','',0.3833333333333333,0,7.609999999999999,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('891084858',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-14','2022-06-14 08:46:05','2022-06-14 12:02:58','',NULL,'2022-06-14 17:01:02','',0.7666666666666667,0,3.23,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('198879177',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-15','2022-06-15 08:24:31','2022-06-15 12:00:02','','2022-06-15 13:21:30','2022-06-15 17:01:25','',0.75,0,7.25,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('228119758',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-16','2022-06-16 08:46:08','2022-06-16 12:00:47','','2022-06-16 13:21:28','2022-06-16 17:00:05','',1.1166666666666667,0,6.88,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('848757944',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-17','2022-06-17 08:28:47',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('2131591668',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-20','2022-06-20 08:50:05','2022-06-20 12:00:00','','2022-06-20 13:12:54','2022-06-20 17:00:02','',1.0333333333333334,0,6.97,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1019853699',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-21','2022-06-21 08:18:28','2022-06-21 12:00:38','','2022-06-21 13:19:44','2022-06-21 17:02:57','',0.6166666666666667,0,7.380000000000001,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('208911030',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-22','2022-06-22 09:00:28','2022-06-22 12:02:03','','2022-06-22 13:23:37','2022-06-22 17:03:50','',1.3833333333333333,0,6.62,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1902658221',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-23','2022-06-23 08:33:50','2022-06-23 12:01:23','','2022-06-23 13:11:02','2022-06-23 17:00:09','',0.7333333333333334,0,7.27,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1391423946',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-24','2022-06-24 08:41:33','2022-06-24 12:00:45','','2022-06-24 13:11:34','2022-06-24 17:02:38','',0.8666666666666667,0,7.14,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1216365885',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-27','2022-06-27 08:24:19','2022-06-27 12:00:55','','2022-06-27 13:14:12','2022-06-27 18:13:40','',0.6333333333333333,0,7.37,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('475650621',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-28','2022-06-28 08:38:01','2022-06-28 12:02:55','','2022-06-28 13:18:06','2022-06-28 17:01:31','',0.9333333333333333,0,7.07,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1696729138',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-29','2022-06-29 09:06:31','2022-06-29 12:00:10','',NULL,NULL,'',1.1,0,2.9,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('11954068',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-06-30','2022-06-30 08:24:15','2022-06-30 12:13:19','','2022-06-30 13:04:20','2022-06-30 17:00:14','',0.4666666666666667,0,7.53,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('254580148',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-07-18','2022-07-18 08:48:37','2022-07-18 12:01:59','','2022-07-18 13:21:08','2022-07-18 17:04:39','',1.15,0,6.85,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('731246543',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-07-19','2022-07-19 08:37:09','2022-07-19 12:02:58','','2022-07-19 13:22:45','2022-07-19 17:04:33','',0.9833333333333334,0,7.01,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('174685169',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-07-20','2022-07-20 06:09:01','2022-07-20 12:02:46','','2022-07-20 13:17:06','2022-07-20 17:07:35','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1722657996',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-07-21','2022-07-21 08:22:34','2022-07-21 12:00:25','','2022-07-21 13:20:28','2022-07-21 17:00:01','',0.7,0,7.3,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('242015316',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-07-22','2022-07-22 06:51:56','2022-07-22 12:07:22','','2022-07-22 13:32:43','2022-07-22 17:01:31','',0.5333333333333333,0,7.470000000000001,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1838440331',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2022-07-25','2022-07-25 07:24:10','2022-07-25 12:06:13','','2022-07-25 13:27:38','2022-07-25 17:02:34','',0.45,0,7.55,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('973287436',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-01',NULL,'2022-06-01 12:01:37','','2022-06-01 12:18:21','2022-06-01 17:08:14','',0,0,4,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('628752818',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-02','2022-06-02 05:21:58','2022-06-02 12:03:34','','2022-06-02 12:19:40','2022-06-02 17:00:33','',0,0,8,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1844664529',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-03','2022-06-03 05:17:51','2022-06-03 12:01:50','','2022-06-03 12:18:07','2022-06-03 17:00:02','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('892886546',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-04','2022-06-04 08:12:44',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-04 08:00:00','2022-06-04 17:00:00','regular','N/A','N/A',0,0),('2074920742',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-05','2022-06-05 08:19:15','2022-06-05 12:00:50','','2022-06-05 12:13:05','2022-06-05 16:30:05','',0.31666666666666665,0.48333333333333334,7.2,'0','','','','','','','',0,'2022-06-05 08:00:00','2022-06-05 17:00:00','regular','N/A','N/A',0,0),('1874696890',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-06','2022-06-06 05:17:23','2022-06-06 12:00:18','','2022-06-06 12:18:35','2022-06-06 17:01:16','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1269017814',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-07','2022-06-07 05:16:23','2022-06-07 12:10:03','','2022-06-07 12:23:51','2022-06-07 17:00:01','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('200505872',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-08','2022-06-08 05:24:22','2022-06-08 12:06:29','','2022-06-08 12:29:46','2022-06-08 17:00:56','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('320969725',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-09','2022-06-09 05:19:15','2022-06-09 12:00:57','','2022-06-09 12:14:32','2022-06-09 17:00:10','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('17931242',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-10','2022-06-10 05:23:36','2022-06-10 12:01:17','','2022-06-10 12:29:50','2022-06-10 17:01:02','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('36164807',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-11','2022-06-11 09:03:29',NULL,'',NULL,'2022-06-11 16:52:03','',0,0,0,'0','','','','','','','',0,'2022-06-11 08:00:00','2022-06-11 17:00:00','regular','N/A','N/A',0,0),('668890733',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-13','2022-06-13 05:20:48','2022-06-13 12:08:15','','2022-06-13 12:24:38','2022-06-13 17:00:08','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('609593747',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-14','2022-06-14 05:40:15','2022-06-14 12:11:17','','2022-06-14 12:30:05','2022-06-14 17:01:45','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('3310879',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-15','2022-06-15 05:23:29','2022-06-15 12:06:07','','2022-06-15 12:26:05','2022-06-15 17:03:07','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('627732183',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-16','2022-06-16 05:15:13','2022-06-16 12:07:27','','2022-06-16 12:18:36','2022-06-16 17:06:16','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1052063007',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-17','2022-06-17 05:22:43','2022-06-17 12:05:39','','2022-06-17 12:18:00','2022-06-17 17:00:06','',0,0,8,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1278466082',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-20','2022-06-20 05:15:34','2022-06-20 12:07:41','','2022-06-20 12:35:58','2022-06-20 17:04:43','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('272641568',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-21','2022-06-21 05:22:15','2022-06-21 12:09:34','','2022-06-21 12:27:07','2022-06-21 17:01:34','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1243609581',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-22','2022-06-22 05:21:03','2022-06-22 12:01:00','','2022-06-22 12:21:59','2022-06-22 17:10:37','',0,0,8,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('308477789',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-23','2022-06-23 05:19:09','2022-06-23 12:13:57','','2022-06-23 12:45:49','2022-06-23 17:00:48','',0,0,8,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1905740797',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-24','2022-06-24 05:21:37','2022-06-24 12:07:49','','2022-06-24 12:23:23','2022-06-24 17:04:14','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('2029289172',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-27','2022-06-27 05:29:18','2022-06-27 12:11:28','','2022-06-27 12:42:37','2022-06-27 17:36:54','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('162197283',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-28','2022-06-28 05:19:10','2022-06-28 12:10:38','','2022-06-28 12:23:21','2022-06-28 17:02:51','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1139870385',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-29',NULL,'2022-06-29 12:05:09','','2022-06-29 12:30:55','2022-06-29 19:48:07','',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('160693106',0,'79','SINAJON, CONCORDIA GANOHAY','2022-06-30','2022-06-30 05:56:07','2022-06-30 12:09:47','','2022-06-30 12:46:29','2022-06-30 17:00:10','',0,0,8,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('673510',0,'79','SINAJON, CONCORDIA GANOHAY','2022-07-17','2022-07-17 07:32:55','2022-07-17 08:28:55','',NULL,NULL,'',0,3.5166666666666666,0.48,'0','','','','','','','',0,'2022-07-17 08:00:00','2022-07-17 17:00:00','regular','N/A','N/A',0,0),('1969899574',0,'79','SINAJON, CONCORDIA GANOHAY','2022-07-18','2022-07-18 05:19:43','2022-07-18 12:02:52','','2022-07-18 12:35:40','2022-07-18 17:04:22','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('1478095464',0,'79','SINAJON, CONCORDIA GANOHAY','2022-07-19','2022-07-19 05:29:54','2022-07-19 12:04:06','','2022-07-19 12:39:02','2022-07-19 17:02:35','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1206960836',0,'79','SINAJON, CONCORDIA GANOHAY','2022-07-20','2022-07-20 05:17:46',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1460178000',0,'79','SINAJON, CONCORDIA GANOHAY','2022-07-22','2022-07-22 05:21:59','2022-07-22 12:06:42','','2022-07-22 12:36:07','2022-07-22 17:04:08','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('336356113',0,'79','SINAJON, CONCORDIA GANOHAY','2022-07-25','2022-07-25 05:38:06','2022-07-25 12:18:04','','2022-07-25 12:43:46','2022-07-25 17:00:02','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('393543581',0,'79','SINAJON, CONCORDIA GANOHAY','2022-07-26','2022-07-26 05:26:30',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1397193225',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-01','2022-06-01 07:57:33','2022-06-01 12:08:03','','2022-06-01 12:48:58','2022-06-01 17:26:48','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1938960635',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-02','2022-06-02 08:17:07','2022-06-02 12:02:32','','2022-06-02 12:25:41','2022-06-02 17:44:53','',0.2833333333333333,0,7.720000000000001,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1237701848',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-03','2022-06-03 08:06:23','2022-06-03 12:02:00','','2022-06-03 12:17:00','2022-06-03 17:16:56','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1892092408',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-06','2022-06-06 07:58:42','2022-06-06 12:05:04','','2022-06-06 12:48:30','2022-06-06 17:36:34','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1215555377',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-07','2022-06-07 08:09:05','2022-06-07 12:05:48','','2022-06-07 12:27:17','2022-06-07 18:09:04','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1883302051',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-08','2022-06-08 08:15:15','2022-06-08 12:04:36','','2022-06-08 12:22:07','2022-06-08 18:22:35','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('370600752',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-09','2022-06-09 08:04:22',NULL,'',NULL,'2022-06-09 18:57:39','',0,0,0,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1412205547',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-10','2022-06-10 08:15:53',NULL,'','2022-06-10 12:58:40','2022-06-10 17:02:03','',0,0,4,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1057252752',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-13','2022-06-13 07:46:03','2022-06-13 12:48:51','','2022-06-13 12:59:58','2022-06-13 17:17:15','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1468301414',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-14','2022-06-14 08:10:23','2022-06-14 12:03:36','','2022-06-14 12:30:42','2022-06-14 17:04:06','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1727349322',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-15','2022-06-15 07:54:15','2022-06-15 12:00:15','','2022-06-15 12:19:23','2022-06-15 17:49:05','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('2110155947',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-16','2022-06-16 08:47:57','2022-06-16 12:02:15','','2022-06-16 12:52:02','2022-06-16 18:11:02','',0.7833333333333333,0,7.220000000000001,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('1140782239',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-17','2022-06-17 08:21:03','2022-06-17 12:14:50','',NULL,'2022-06-17 17:28:23','',0.35,0,3.65,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('540973359',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-20','2022-06-20 08:07:51','2022-06-20 12:02:32','','2022-06-20 12:53:59','2022-06-20 19:05:10','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('781132564',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-21','2022-06-21 07:56:13','2022-06-21 12:03:17','','2022-06-21 12:22:05','2022-06-21 17:53:38','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('293937957',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-22','2022-06-22 09:04:40','2022-06-22 12:13:57','','2022-06-22 12:40:55','2022-06-22 17:46:53','',1.0666666666666667,0,6.93,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1212528917',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-23','2022-06-23 08:22:46','2022-06-23 12:10:38','','2022-06-23 12:43:54','2022-06-23 18:03:54','',0.36666666666666664,0,7.63,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('270317592',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-24','2022-06-24 07:48:58','2022-06-24 12:05:45','','2022-06-24 12:43:14','2022-06-24 19:00:30','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('734777641',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-26','2022-06-26 08:10:31',NULL,'',NULL,'2022-06-26 17:17:58','',0,0,0,'0','','','','','','','',0,'2022-06-26 08:00:00','2022-06-26 17:00:00','regular','N/A','N/A',0,0),('101135158',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-27','2022-06-27 08:20:55','2022-06-27 12:05:22','','2022-06-27 12:40:28','2022-06-27 21:57:12','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('864990381',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-28','2022-06-28 10:00:54','2022-06-28 12:15:44','','2022-06-28 12:34:21','2022-06-28 21:55:36','',2,0,6,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('138237845',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-06-30','2022-06-30 08:37:24','2022-06-30 12:05:29','','2022-06-30 13:02:16','2022-06-30 17:07:06','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1518188537',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-07-18','2022-07-18 08:14:03','2022-07-18 12:08:21','','2022-07-18 12:24:49','2022-07-18 18:13:51','',0.23333333333333334,0,7.77,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('506555297',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-07-19','2022-07-19 08:00:49','2022-07-19 12:06:55','','2022-07-19 13:01:56',NULL,'',0,0,4,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1678317947',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-07-22','2022-07-22 07:25:07','2022-07-22 12:18:17','','2022-07-22 12:46:59','2022-07-22 18:37:36','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1798239802',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-07-23','2022-07-23 07:53:39',NULL,'',NULL,'2022-07-23 18:24:03','',0,0,0,'0','','','','','','','',0,'2022-07-23 08:00:00','2022-07-23 17:00:00','regular','N/A','N/A',0,0),('1280522896',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-07-24','2022-07-24 07:51:25',NULL,'',NULL,'2022-07-24 16:35:14','',0,0,0,'0','','','','','','','',0,'2022-07-24 08:00:00','2022-07-24 17:00:00','regular','N/A','N/A',0,0),('216917090',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-07-25','2022-07-25 08:00:07','2022-07-25 12:09:45','','2022-07-25 12:43:41','2022-07-25 17:05:57','',0,0,8,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('639993025',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2022-07-26','2022-07-26 07:58:15',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('946120539',0,'80','TUBAT, ELESON MORATO','2022-06-01','2022-06-01 07:41:21','2022-06-01 12:01:24','','2022-06-01 12:48:37',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('825879494',0,'80','TUBAT, ELESON MORATO','2022-06-03','2022-06-03 08:08:46','2022-06-03 12:01:33','','2022-06-03 12:45:17','2022-06-03 17:00:32','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1924506760',0,'80','TUBAT, ELESON MORATO','2022-06-06','2022-06-06 07:45:21','2022-06-06 12:02:04','','2022-06-06 12:12:58','2022-06-06 17:17:16','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1107316375',0,'80','TUBAT, ELESON MORATO','2022-06-07','2022-06-07 07:50:59','2022-06-07 12:00:20','','2022-06-07 12:52:31','2022-06-07 17:00:03','',0,0,8,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('1578622037',0,'80','TUBAT, ELESON MORATO','2022-06-08','2022-06-08 08:06:50','2022-06-08 12:00:33','','2022-06-08 13:02:56','2022-06-08 17:01:16','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1392051449',0,'80','TUBAT, ELESON MORATO','2022-06-09','2022-06-09 07:54:06','2022-06-09 12:01:03','','2022-06-09 13:07:36','2022-06-09 17:00:23','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('2036198698',0,'80','TUBAT, ELESON MORATO','2022-06-10','2022-06-10 07:53:28','2022-06-10 12:00:38','','2022-06-10 13:09:14','2022-06-10 17:00:53','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('2054247765',0,'80','TUBAT, ELESON MORATO','2022-06-13','2022-06-13 07:50:07','2022-06-13 12:00:22','','2022-06-13 12:57:32','2022-06-13 17:00:03','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('1063403122',0,'80','TUBAT, ELESON MORATO','2022-06-14','2022-06-14 07:54:25','2022-06-14 12:02:07','','2022-06-14 12:52:04','2022-06-14 17:01:10','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1764526186',0,'80','TUBAT, ELESON MORATO','2022-06-15','2022-06-15 07:47:34','2022-06-15 12:01:19','','2022-06-15 12:51:34','2022-06-15 17:01:08','',0,0,8,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1656261216',0,'80','TUBAT, ELESON MORATO','2022-06-16','2022-06-16 07:51:15','2022-06-16 12:01:11','','2022-06-16 12:52:19','2022-06-16 17:00:20','',0,0,8,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('437308813',0,'80','TUBAT, ELESON MORATO','2022-06-17','2022-06-17 08:35:39','2022-06-17 12:02:26','','2022-06-17 12:59:02','2022-06-17 17:11:56','',0.5833333333333334,0,7.42,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('570897172',0,'80','TUBAT, ELESON MORATO','2022-06-20','2022-06-20 07:55:15','2022-06-20 12:00:35','','2022-06-20 12:56:11','2022-06-20 17:02:26','',0,0,8,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1156054758',0,'80','TUBAT, ELESON MORATO','2022-06-21','2022-06-21 07:48:55','2022-06-21 12:00:25','','2022-06-21 12:37:12','2022-06-21 17:05:46','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('711456217',0,'80','TUBAT, ELESON MORATO','2022-06-22','2022-06-22 08:10:16','2022-06-22 12:01:16','','2022-06-22 12:54:59','2022-06-22 17:02:11','',0.16666666666666666,0,7.83,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('733477902',0,'80','TUBAT, ELESON MORATO','2022-06-23','2022-06-23 07:58:19','2022-06-23 12:00:08','','2022-06-23 13:02:05','2022-06-23 17:00:06','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('184976218',0,'80','TUBAT, ELESON MORATO','2022-06-24','2022-06-24 07:54:37','2022-06-24 12:19:29','','2022-06-24 12:58:23','2022-06-24 17:01:33','',0,0,8,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1064233095',0,'80','TUBAT, ELESON MORATO','2022-06-27','2022-06-27 07:49:17','2022-06-27 12:03:42','','2022-06-27 12:52:43','2022-06-27 18:14:10','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('255407718',0,'80','TUBAT, ELESON MORATO','2022-06-28','2022-06-28 08:00:18','2022-06-28 12:00:39','','2022-06-28 12:47:07','2022-06-28 17:09:24','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('709954910',0,'80','TUBAT, ELESON MORATO','2022-06-29','2022-06-29 07:59:49','2022-06-29 12:00:20','','2022-06-29 12:10:40',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('750931855',0,'80','TUBAT, ELESON MORATO','2022-06-30','2022-06-30 07:55:18','2022-06-30 12:00:21','','2022-06-30 13:01:08','2022-06-30 17:00:34','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('191801157',0,'80','TUBAT, ELESON MORATO','2022-07-18','2022-07-18 07:55:21','2022-07-18 12:09:42','','2022-07-18 12:59:27','2022-07-18 17:51:42','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('823751038',0,'80','TUBAT, ELESON MORATO','2022-07-19','2022-07-19 07:50:31','2022-07-19 12:03:44','','2022-07-19 12:22:14','2022-07-19 17:45:51','',0,0,8,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1577416874',0,'80','TUBAT, ELESON MORATO','2022-07-20','2022-07-20 07:53:05','2022-07-20 12:10:26','','2022-07-20 12:43:00','2022-07-20 17:51:52','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1628730263',0,'80','TUBAT, ELESON MORATO','2022-07-21','2022-07-21 07:52:53','2022-07-21 12:15:34','','2022-07-21 12:52:19','2022-07-21 17:06:54','',0,0,8,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1472190631',0,'80','TUBAT, ELESON MORATO','2022-07-22','2022-07-22 07:52:56','2022-07-22 12:11:12','','2022-07-22 13:12:31','2022-07-22 17:03:40','',0.2,0,7.8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('777823993',0,'80','TUBAT, ELESON MORATO','2022-07-25','2022-07-25 08:02:54','2022-07-25 12:05:50','','2022-07-25 12:55:51','2022-07-25 17:36:33','',0.03333333333333333,0,7.970000000000001,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('65978463',0,'80','TUBAT, ELESON MORATO','2022-07-26','2022-07-26 07:48:38',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1779464046',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-01','2022-06-01 08:16:41','2022-06-01 12:22:28','','2022-06-01 12:48:53','2022-06-01 18:15:39','',0.26666666666666666,0,7.73,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1834441126',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-02','2022-06-02 07:47:00','2022-06-02 12:26:20','','2022-06-02 13:06:20','2022-06-02 18:21:18','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1553408279',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-03','2022-06-03 07:46:30',NULL,'','2022-06-03 13:42:11','2022-06-03 17:56:08','',0.7,0,3.3,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1166104837',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-06','2022-06-06 07:59:52','2022-06-06 12:10:13','',NULL,'2022-06-06 17:32:37','',0,0,4,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1038916970',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-07','2022-06-07 07:38:36','2022-06-07 12:15:15','',NULL,'2022-06-07 17:08:25','',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('15984868',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-08','2022-06-08 08:35:58','2022-06-08 12:09:59','','2022-06-08 12:37:07','2022-06-08 17:26:21','',0.5833333333333334,0,7.42,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('272805980',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-09','2022-06-09 08:06:12','2022-06-09 12:28:42','','2022-06-09 13:15:07','2022-06-09 16:57:13','',0.35,0.03333333333333333,7.62,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1512815882',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-10','2022-06-10 08:40:34','2022-06-10 12:21:10','','2022-06-10 13:05:09','2022-06-10 16:41:39','',0.75,0.3,6.95,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1571594438',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-13','2022-06-13 08:17:22','2022-06-13 12:09:11','','2022-06-13 13:11:17','2022-06-13 17:56:16','',0.4666666666666667,0,7.54,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('473537219',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-14','2022-06-14 08:04:55','2022-06-14 12:03:31','','2022-06-14 13:00:51','2022-06-14 18:35:21','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('151873627',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-15','2022-06-15 08:16:06','2022-06-15 12:43:48','',NULL,'2022-06-15 18:00:55','',0.26666666666666666,0,3.73,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('43372429',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-16','2022-06-16 08:05:32','2022-06-16 12:25:14','','2022-06-16 12:40:22','2022-06-16 18:20:29','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('245112436',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-17','2022-06-17 08:17:06',NULL,'',NULL,'2022-06-17 18:13:59','',0,0,0,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1461050339',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-20','2022-06-20 08:18:35',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('809661776',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-21',NULL,NULL,'',NULL,'2022-06-21 17:46:35','',0,0,0,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1473208609',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-22','2022-06-22 08:10:43',NULL,'',NULL,'2022-06-22 20:29:39','',0,0,0,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1873026007',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-23','2022-06-23 08:42:26',NULL,'',NULL,'2022-06-23 21:21:40','',0,0,0,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('825231750',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-24','2022-06-24 08:04:55',NULL,'',NULL,'2022-06-24 17:30:16','',0,0,0,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1087055336',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-27','2022-06-27 10:50:34',NULL,'',NULL,'2022-06-27 17:15:33','',0,0,0,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('504776857',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-28','2022-06-28 08:06:52',NULL,'',NULL,'2022-06-28 18:43:05','',0,0,0,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1615398659',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-29','2022-06-29 05:58:18',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('64090898',0,'81','URBUDA, ROBERT MARQUEZ','2022-06-30','2022-06-30 07:52:40',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1804440342',0,'81','URBUDA, ROBERT MARQUEZ','2022-07-18',NULL,'2022-07-18 12:10:08','','2022-07-18 13:09:22','2022-07-18 18:43:12','',0.15,0,3.85,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2126471803',0,'81','URBUDA, ROBERT MARQUEZ','2022-07-19','2022-07-19 08:10:42',NULL,'',NULL,'2022-07-19 18:27:27','',0,0,0,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('163568176',0,'81','URBUDA, ROBERT MARQUEZ','2022-07-20','2022-07-20 07:51:31',NULL,'',NULL,'2022-07-20 18:54:02','',0,0,0,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('314618964',0,'81','URBUDA, ROBERT MARQUEZ','2022-07-21',NULL,NULL,'',NULL,'2022-07-21 18:48:11','',0,0,0,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1285518200',0,'81','URBUDA, ROBERT MARQUEZ','2022-07-22','2022-07-22 08:20:44',NULL,'',NULL,'2022-07-22 18:48:51','',0,0,0,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1975557185',0,'81','URBUDA, ROBERT MARQUEZ','2022-07-25','2022-07-25 08:24:03',NULL,'',NULL,'2022-07-25 19:01:17','',0,0,0,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('787122501',0,'81','URBUDA, ROBERT MARQUEZ','2022-07-26','2022-07-26 08:22:16',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1888024162',0,'82','VICENTE, JOHN MARK SERAD','2022-06-01','2022-06-01 08:26:17','2022-06-01 12:03:28','','2022-06-01 13:00:04','2022-06-01 18:26:28','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1817888202',0,'82','VICENTE, JOHN MARK SERAD','2022-06-02','2022-06-02 08:54:30','2022-06-02 12:17:45','','2022-06-02 12:30:05','2022-06-02 18:45:34','',0.9,0,7.1,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1247104789',0,'82','VICENTE, JOHN MARK SERAD','2022-06-03','2022-06-03 08:37:42','2022-06-03 12:07:13','','2022-06-03 12:58:10','2022-06-03 18:27:21','',0.6166666666666667,0,7.38,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('847958215',0,'82','VICENTE, JOHN MARK SERAD','2022-06-06','2022-06-06 07:48:20','2022-06-06 12:24:45','','2022-06-06 12:34:58','2022-06-06 18:30:16','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1076907700',0,'82','VICENTE, JOHN MARK SERAD','2022-06-07','2022-06-07 08:39:18','2022-06-07 12:04:36','','2022-06-07 12:18:21','2022-06-07 18:55:17','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('747580223',0,'82','VICENTE, JOHN MARK SERAD','2022-06-08','2022-06-08 09:20:47','2022-06-08 12:08:40','','2022-06-08 13:06:17','2022-06-08 21:25:17','',1.4333333333333333,0,6.57,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('1484056719',0,'82','VICENTE, JOHN MARK SERAD','2022-06-09','2022-06-09 09:16:57','2022-06-09 12:09:45','','2022-06-09 12:20:45','2022-06-09 17:54:17','',1.2666666666666666,0,6.73,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1177798346',0,'82','VICENTE, JOHN MARK SERAD','2022-06-10','2022-06-10 08:52:37','2022-06-10 12:09:45','',NULL,NULL,'',0.8666666666666667,0,3.13,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1532134660',0,'82','VICENTE, JOHN MARK SERAD','2022-06-13','2022-06-13 09:16:43',NULL,'',NULL,'2022-06-13 17:55:15','',0,0,0,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('603375741',0,'82','VICENTE, JOHN MARK SERAD','2022-06-14',NULL,'2022-06-14 12:11:29','','2022-06-14 12:23:33','2022-06-14 19:06:17','',0,0,4,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1823109922',0,'82','VICENTE, JOHN MARK SERAD','2022-06-15','2022-06-15 08:30:17','2022-06-15 12:01:36','','2022-06-15 12:12:59','2022-06-15 18:02:03','',0.5,0,7.5,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1977861503',0,'82','VICENTE, JOHN MARK SERAD','2022-06-16','2022-06-16 08:08:10','2022-06-16 12:48:57','','2022-06-16 12:59:08','2022-06-16 21:22:51','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('871119296',0,'82','VICENTE, JOHN MARK SERAD','2022-06-17','2022-06-17 08:50:58','2022-06-17 12:04:54','','2022-06-17 12:19:10','2022-06-17 19:28:51','',0.8333333333333334,0,7.17,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('241212632',0,'82','VICENTE, JOHN MARK SERAD','2022-06-20','2022-06-20 08:55:31','2022-06-20 12:47:19','','2022-06-20 12:57:55','2022-06-20 17:51:41','',0.9166666666666666,0,7.08,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1557172481',0,'82','VICENTE, JOHN MARK SERAD','2022-06-21','2022-06-21 08:48:25','2022-06-21 12:14:50','','2022-06-21 12:35:58','2022-06-21 19:26:21','',0.8,0,7.2,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1506164270',0,'82','VICENTE, JOHN MARK SERAD','2022-06-22','2022-06-22 08:26:18','2022-06-22 12:01:40','','2022-06-22 12:19:53','2022-06-22 18:44:59','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('197898090',0,'82','VICENTE, JOHN MARK SERAD','2022-06-23','2022-06-23 09:29:52','2022-06-23 12:04:24','','2022-06-23 12:24:59','2022-06-23 19:14:14','',1.4833333333333334,0,6.52,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1983674867',0,'82','VICENTE, JOHN MARK SERAD','2022-06-24','2022-06-24 08:34:15','2022-06-24 12:00:19','','2022-06-24 12:33:51','2022-06-24 18:21:36','',0.5666666666666667,0,7.43,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('817698763',0,'82','VICENTE, JOHN MARK SERAD','2022-06-27','2022-06-27 08:46:44','2022-06-27 12:22:20','','2022-06-27 12:35:51','2022-06-27 18:12:03','',0.7666666666666667,0,7.23,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('1500152672',0,'82','VICENTE, JOHN MARK SERAD','2022-06-29','2022-06-29 08:44:49','2022-06-29 12:02:36','','2022-06-29 12:14:13','2022-06-29 20:36:18','',0.7333333333333333,0,7.27,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1072957131',0,'82','VICENTE, JOHN MARK SERAD','2022-06-30','2022-06-30 09:11:16','2022-06-30 12:20:24','','2022-06-30 12:49:29','2022-06-30 19:37:44','',1.1833333333333333,0,6.82,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('251963593',0,'82','VICENTE, JOHN MARK SERAD','2022-07-18','2022-07-18 09:51:48','2022-07-18 12:06:14','','2022-07-18 12:39:26','2022-07-18 17:51:00','',1.85,0,6.15,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('2035613663',0,'82','VICENTE, JOHN MARK SERAD','2022-07-19','2022-07-19 08:58:11','2022-07-19 12:31:47','','2022-07-19 12:42:33','2022-07-19 18:54:13','',0.9666666666666667,0,7.029999999999999,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('2040680071',0,'82','VICENTE, JOHN MARK SERAD','2022-07-20','2022-07-20 09:46:25','2022-07-20 12:05:24','','2022-07-20 12:48:10','2022-07-20 19:46:18','',1.7666666666666666,0,6.23,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('834785212',0,'82','VICENTE, JOHN MARK SERAD','2022-07-21','2022-07-21 09:00:03','2022-07-21 12:03:30','','2022-07-21 12:33:49','2022-07-21 18:57:16','',1,0,7,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('679328893',0,'82','VICENTE, JOHN MARK SERAD','2022-07-22','2022-07-22 08:51:01','2022-07-22 12:12:19','','2022-07-22 12:31:11','2022-07-22 18:37:08','',0.85,0,7.15,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('985622545',0,'82','VICENTE, JOHN MARK SERAD','2022-07-25','2022-07-25 09:54:36','2022-07-25 12:05:20','','2022-07-25 12:57:01','2022-07-25 18:18:52','',1.9,0,6.1,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('537324778',0,'83','JELSON TEMPLA VILLEGAS','2022-06-01','2022-06-01 07:52:01','2022-06-01 12:05:06','','2022-06-01 12:29:07','2022-06-01 16:19:44','',0,0.6666666666666666,7.33,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('1290380648',0,'83','JELSON TEMPLA VILLEGAS','2022-06-02','2022-06-02 07:55:12','2022-06-02 12:04:41','','2022-06-02 13:07:46',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('2000408838',0,'83','JELSON TEMPLA VILLEGAS','2022-06-06','2022-06-06 08:07:56',NULL,'','2022-06-06 12:29:28','2022-06-06 17:01:38','',0,0,4,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1026895020',0,'83','JELSON TEMPLA VILLEGAS','2022-06-07','2022-06-07 08:30:13',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('941273289',0,'83','JELSON TEMPLA VILLEGAS','2022-06-08','2022-06-08 08:56:29','2022-06-08 12:07:18','','2022-06-08 12:37:57','2022-06-08 16:05:01','',0.9333333333333333,0.9,6.17,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('2074002189',0,'83','JELSON TEMPLA VILLEGAS','2022-06-10','2022-06-10 08:11:09','2022-06-10 12:03:21','','2022-06-10 12:27:27','2022-06-10 17:36:16','',0.18333333333333332,0,7.82,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('257378454',0,'83','JELSON TEMPLA VILLEGAS','2022-06-13','2022-06-13 07:10:00','2022-06-13 12:18:45','','2022-06-13 12:52:53','2022-06-13 17:16:39','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('469812091',0,'83','JELSON TEMPLA VILLEGAS','2022-06-14','2022-06-14 08:34:10','2022-06-14 12:01:22','','2022-06-14 12:19:25',NULL,'',0.5666666666666667,0,3.43,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1982850366',0,'83','JELSON TEMPLA VILLEGAS','2022-06-15','2022-06-15 08:27:35','2022-06-15 12:11:34','','2022-06-15 12:51:59','2022-06-15 17:23:42','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('515393414',0,'83','JELSON TEMPLA VILLEGAS','2022-06-16','2022-06-16 08:20:11','2022-06-16 12:02:31','','2022-06-16 12:20:37','2022-06-16 17:27:18','',0.3333333333333333,0,7.67,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('781115670',0,'83','JELSON TEMPLA VILLEGAS','2022-06-17','2022-06-17 08:44:59','2022-06-17 12:18:48','','2022-06-17 12:41:36','2022-06-17 16:15:37','',0.7333333333333333,0.7333333333333333,6.54,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1928966611',0,'83','JELSON TEMPLA VILLEGAS','2022-06-20','2022-06-20 08:47:03','2022-06-20 12:03:55','','2022-06-20 12:45:51','2022-06-20 16:39:08','',0.7833333333333333,0.3333333333333333,6.890000000000001,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('810622515',0,'83','JELSON TEMPLA VILLEGAS','2022-06-21','2022-06-21 07:52:42','2022-06-21 12:25:11','','2022-06-21 12:59:27','2022-06-21 17:18:55','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('55334240',0,'83','JELSON TEMPLA VILLEGAS','2022-06-22','2022-06-22 07:52:36','2022-06-22 12:02:00','','2022-06-22 13:06:09','2022-06-22 17:12:54','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1240482128',0,'83','JELSON TEMPLA VILLEGAS','2022-06-23','2022-06-23 06:48:05','2022-06-23 12:02:17','','2022-06-23 12:16:58',NULL,'',0,0,4,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('983222974',0,'83','JELSON TEMPLA VILLEGAS','2022-06-24','2022-06-24 10:09:59','2022-06-24 12:19:46','','2022-06-24 12:34:10','2022-06-24 19:26:45','',2.15,0,5.85,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('2025069694',0,'83','JELSON TEMPLA VILLEGAS','2022-06-27','2022-06-27 08:16:46','2022-06-27 12:14:53','',NULL,'2022-06-27 17:00:03','',0.26666666666666666,0,3.73,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('406260681',0,'83','JELSON TEMPLA VILLEGAS','2022-06-28','2022-06-28 08:39:09','2022-06-28 12:05:15','','2022-06-28 12:53:23','2022-06-28 17:00:38','',0.65,0,7.35,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('1996807280',0,'83','JELSON TEMPLA VILLEGAS','2022-06-29','2022-06-29 04:31:07',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1787029128',0,'83','JELSON TEMPLA VILLEGAS','2022-06-30','2022-06-30 07:42:50','2022-06-30 12:05:40','','2022-06-30 13:05:44','2022-06-30 20:13:47','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('638137187',0,'83','JELSON TEMPLA VILLEGAS','2022-07-18','2022-07-18 08:41:58','2022-07-18 12:13:16','','2022-07-18 12:39:17','2022-07-18 16:50:30','',0.6833333333333333,0.15,7.17,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('759242627',0,'83','JELSON TEMPLA VILLEGAS','2022-07-19','2022-07-19 08:41:53','2022-07-19 12:08:22','','2022-07-19 13:35:43','2022-07-19 16:37:33','',1.2666666666666666,0.36666666666666664,6.369999999999999,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1435251389',0,'83','JELSON TEMPLA VILLEGAS','2022-07-20','2022-07-20 09:02:14',NULL,'','2022-07-20 12:47:54','2022-07-20 16:17:03','',0,0.7,3.3,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('264187314',0,'83','JELSON TEMPLA VILLEGAS','2022-07-21','2022-07-21 08:32:12','2022-07-21 12:00:38','','2022-07-21 12:39:19','2022-07-21 16:37:48','',0.5333333333333333,0.36666666666666664,7.1,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('866816491',0,'83','JELSON TEMPLA VILLEGAS','2022-07-22','2022-07-22 07:55:34','2022-07-22 12:06:22','','2022-07-22 13:32:32','2022-07-22 16:51:30','',0.5333333333333333,0.13333333333333333,7.33,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('217300964',0,'83','JELSON TEMPLA VILLEGAS','2022-07-25','2022-07-25 09:09:25','2022-07-25 12:07:49','','2022-07-25 12:37:36','2022-07-25 21:26:24','',1.15,0,6.85,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('625545352',0,'83','JELSON TEMPLA VILLEGAS','2022-07-26','2022-07-26 07:54:58',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('1787480315',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-01','2022-06-01 08:04:02','2022-06-01 12:34:37','','2022-06-01 12:59:23','2022-06-01 17:15:47','',0.06666666666666667,0,7.93,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('969167022',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-02','2022-06-02 08:01:07','2022-06-02 12:11:53','','2022-06-02 12:25:02','2022-06-02 17:03:00','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('1654295039',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-03','2022-06-03 07:57:22','2022-06-03 12:13:40','','2022-06-03 12:30:00','2022-06-03 17:06:13','',0,0,8,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1050970493',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-06','2022-06-06 08:05:15','2022-06-06 12:22:35','','2022-06-06 12:45:27','2022-06-06 17:08:07','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('1891489536',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-07','2022-06-07 08:09:21',NULL,'','2022-06-07 12:16:16','2022-06-07 17:04:28','',0,0,4,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('731052157',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-08','2022-06-08 08:09:50','2022-06-08 12:33:32','','2022-06-08 12:44:05','2022-06-08 17:06:16','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('334560096',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-10','2022-06-10 08:06:35','2022-06-10 12:25:57','','2022-06-10 12:40:18','2022-06-10 17:07:19','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1706542518',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-13','2022-06-13 08:14:00','2022-06-13 12:23:21','','2022-06-13 12:58:32',NULL,'',0.23333333333333334,0,3.77,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('895953292',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-14','2022-06-14 08:03:56','2022-06-14 12:29:15','','2022-06-14 17:10:03',NULL,'',0.05,0,3.95,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('2145507956',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-15','2022-06-15 08:07:56','2022-06-15 12:25:22','','2022-06-15 12:39:51','2022-06-15 17:13:46','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('111622254',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-20','2022-06-20 08:03:55','2022-06-20 12:31:03','','2022-06-20 12:49:13','2022-06-20 17:08:51','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('682560821',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-21','2022-06-21 07:55:04','2022-06-21 12:13:25','','2022-06-21 12:23:41','2022-06-21 17:07:53','',0,0,8,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('1809836228',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-22','2022-06-22 08:27:34','2022-06-22 12:16:02','','2022-06-22 12:43:43','2022-06-22 17:22:27','',0.45,0,7.55,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1725162515',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-23','2022-06-23 08:24:27','2022-06-23 12:19:17','','2022-06-23 12:44:45','2022-06-23 17:07:05','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('332860182',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-24','2022-06-24 08:25:43',NULL,'','2022-06-24 12:50:23','2022-06-24 17:20:35','',0,0,4,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('1879599715',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-27','2022-06-27 08:15:13','2022-06-27 12:09:54','','2022-06-27 12:27:16','2022-06-27 21:38:41','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('715368014',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-28','2022-06-28 08:15:20','2022-06-28 12:00:21','','2022-06-28 12:16:30','2022-06-28 17:20:04','',0.25,0,7.75,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('649607873',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-29','2022-06-29 07:00:17','2022-06-29 12:23:07','','2022-06-29 12:33:39','2022-06-29 20:23:34','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1857362335',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-06-30','2022-06-30 08:21:51','2022-06-30 12:03:25','','2022-06-30 12:22:23','2022-06-30 17:24:55','',0.35,0,7.65,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('1536829510',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-07-18','2022-07-18 08:16:24','2022-07-18 12:09:36','',NULL,'2022-07-18 17:44:36','',0.26666666666666666,0,3.73,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('358094683',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-07-19','2022-07-19 08:15:23','2022-07-19 12:13:39','','2022-07-19 12:59:33','2022-07-19 17:11:12','',0.25,0,7.75,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('1045199115',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-07-20','2022-07-20 08:13:50','2022-07-20 12:28:09','','2022-07-20 12:57:17','2022-07-20 17:43:54','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1587048467',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-07-21','2022-07-21 08:18:27','2022-07-21 12:01:21','','2022-07-21 12:11:26',NULL,'',0.3,0,3.7,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1253103094',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-07-22','2022-07-22 08:08:05','2022-07-22 12:09:40','','2022-07-22 12:45:38','2022-07-22 17:06:29','',0.13333333333333333,0,7.87,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('1931324904',0,'84','VIRTUDAZO, JOSHUA SALVE','2022-07-26','2022-07-26 08:10:38',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0),('613866107',0,'9','GUADALUPE INSON BABATID','2022-06-01','2022-06-01 07:58:32','2022-06-01 12:04:18','','2022-06-01 12:26:55','2022-06-01 17:03:49','',0,0,8,'0','','','','','','','',0,'2022-06-01 08:00:00','2022-06-01 17:00:00','regular','N/A','N/A',0,0),('811099804',0,'9','GUADALUPE INSON BABATID','2022-06-02','2022-06-02 08:07:57','2022-06-02 12:05:05','','2022-06-02 12:25:59','2022-06-02 17:01:16','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-02 08:00:00','2022-06-02 17:00:00','regular','N/A','N/A',0,0),('395843073',0,'9','GUADALUPE INSON BABATID','2022-06-03','2022-06-03 08:24:44','2022-06-03 12:13:07','','2022-06-03 12:46:05','2022-06-03 17:00:44','',0.4,0,7.6,'0','','','','','','','',0,'2022-06-03 08:00:00','2022-06-03 17:00:00','regular','N/A','N/A',0,0),('1464775437',0,'9','GUADALUPE INSON BABATID','2022-06-06','2022-06-06 07:27:31','2022-06-06 12:35:24','','2022-06-06 12:54:48','2022-06-06 17:01:26','',0,0,8,'0','','','','','','','',0,'2022-06-06 08:00:00','2022-06-06 17:00:00','regular','N/A','N/A',0,0),('913301147',0,'9','GUADALUPE INSON BABATID','2022-06-07','2022-06-07 08:00:34','2022-06-07 12:08:37','','2022-06-07 12:28:12','2022-06-07 16:58:26','',0,0.016666666666666666,7.98,'0','','','','','','','',0,'2022-06-07 08:00:00','2022-06-07 17:00:00','regular','N/A','N/A',0,0),('2066439443',0,'9','GUADALUPE INSON BABATID','2022-06-08','2022-06-08 07:58:10','2022-06-08 12:27:28','','2022-06-08 12:54:21','2022-06-08 17:01:45','',0,0,8,'0','','','','','','','',0,'2022-06-08 08:00:00','2022-06-08 17:00:00','regular','N/A','N/A',0,0),('233259298',0,'9','GUADALUPE INSON BABATID','2022-06-09','2022-06-09 07:57:04','2022-06-09 12:43:47','','2022-06-09 12:57:50','2022-06-09 17:00:46','',0,0,8,'0','','','','','','','',0,'2022-06-09 08:00:00','2022-06-09 17:00:00','regular','N/A','N/A',0,0),('1083459731',0,'9','GUADALUPE INSON BABATID','2022-06-10','2022-06-10 07:57:04','2022-06-10 12:06:31','','2022-06-10 12:29:39','2022-06-10 17:00:39','',0,0,8,'0','','','','','','','',0,'2022-06-10 08:00:00','2022-06-10 17:00:00','regular','N/A','N/A',0,0),('1916901492',0,'9','GUADALUPE INSON BABATID','2022-06-13','2022-06-13 07:44:29','2022-06-13 12:22:53','','2022-06-13 12:41:49','2022-06-13 17:01:52','',0,0,8,'0','','','','','','','',0,'2022-06-13 08:00:00','2022-06-13 17:00:00','regular','N/A','N/A',0,0),('114553673',0,'9','GUADALUPE INSON BABATID','2022-06-14','2022-06-14 07:54:09','2022-06-14 12:14:43','','2022-06-14 12:38:15','2022-06-14 17:04:26','',0,0,8,'0','','','','','','','',0,'2022-06-14 08:00:00','2022-06-14 17:00:00','regular','N/A','N/A',0,0),('1338480607',0,'9','GUADALUPE INSON BABATID','2022-06-15','2022-06-15 07:55:59','2022-06-15 12:27:15','',NULL,'2022-06-15 17:03:25','',0,0,4,'0','','','','','','','',0,'2022-06-15 08:00:00','2022-06-15 17:00:00','regular','N/A','N/A',0,0),('1177657749',0,'9','GUADALUPE INSON BABATID','2022-06-16','2022-06-16 08:06:46','2022-06-16 12:05:46','','2022-06-16 12:55:04','2022-06-16 17:05:53','',0.1,0,7.9,'0','','','','','','','',0,'2022-06-16 08:00:00','2022-06-16 17:00:00','regular','N/A','N/A',0,0),('559130437',0,'9','GUADALUPE INSON BABATID','2022-06-17','2022-06-17 08:03:11','2022-06-17 12:09:31','','2022-06-17 12:30:56','2022-06-17 16:59:58','',0.05,0,7.95,'0','','','','','','','',0,'2022-06-17 08:00:00','2022-06-17 17:00:00','regular','N/A','N/A',0,0),('1461359117',0,'9','GUADALUPE INSON BABATID','2022-06-20','2022-06-20 08:01:13','2022-06-20 12:06:10','','2022-06-20 12:32:18','2022-06-20 17:00:29','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-20 08:00:00','2022-06-20 17:00:00','regular','N/A','N/A',0,0),('1179529212',0,'9','GUADALUPE INSON BABATID','2022-06-21','2022-06-21 08:07:41','2022-06-21 12:09:27','','2022-06-21 12:20:40','2022-06-21 17:00:45','',0.11666666666666667,0,7.88,'0','','','','','','','',0,'2022-06-21 08:00:00','2022-06-21 17:00:00','regular','N/A','N/A',0,0),('763463309',0,'9','GUADALUPE INSON BABATID','2022-06-22','2022-06-22 08:46:15','2022-06-22 12:30:40','','2022-06-22 12:48:31','2022-06-22 17:00:29','',0.7666666666666667,0,7.23,'0','','','','','','','',0,'2022-06-22 08:00:00','2022-06-22 17:00:00','regular','N/A','N/A',0,0),('1596798352',0,'9','GUADALUPE INSON BABATID','2022-06-23','2022-06-23 08:09:02','2022-06-23 12:17:18','','2022-06-23 12:49:42','2022-06-23 17:00:42','',0.15,0,7.85,'0','','','','','','','',0,'2022-06-23 08:00:00','2022-06-23 17:00:00','regular','N/A','N/A',0,0),('1631849554',0,'9','GUADALUPE INSON BABATID','2022-06-24','2022-06-24 08:01:27','2022-06-24 12:15:39','','2022-06-24 12:42:07','2022-06-24 17:00:44','',0.016666666666666666,0,7.98,'0','','','','','','','',0,'2022-06-24 08:00:00','2022-06-24 17:00:00','regular','N/A','N/A',0,0),('666609731',0,'9','GUADALUPE INSON BABATID','2022-06-27','2022-06-27 07:45:07','2022-06-27 12:45:57','','2022-06-27 12:57:35','2022-06-27 17:00:07','',0,0,8,'0','','','','','','','',0,'2022-06-27 08:00:00','2022-06-27 17:00:00','regular','N/A','N/A',0,0),('578950404',0,'9','GUADALUPE INSON BABATID','2022-06-28','2022-06-28 07:48:11','2022-06-28 12:11:57','','2022-06-28 12:53:16','2022-06-28 17:01:48','',0,0,8,'0','','','','','','','',0,'2022-06-28 08:00:00','2022-06-28 17:00:00','regular','N/A','N/A',0,0),('607072218',0,'9','GUADALUPE INSON BABATID','2022-06-29','2022-06-29 07:08:20','2022-06-29 12:07:36','','2022-06-29 12:20:48','2022-06-29 17:21:40','',0,0,8,'0','','','','','','','',0,'2022-06-29 08:00:00','2022-06-29 17:00:00','regular','N/A','N/A',0,0),('1848789155',0,'9','GUADALUPE INSON BABATID','2022-06-30','2022-06-30 08:01:55',NULL,'','2022-06-30 12:49:10','2022-06-30 16:30:31','',0,0.48333333333333334,3.52,'0','','','','','','','',0,'2022-06-30 08:00:00','2022-06-30 17:00:00','regular','N/A','N/A',0,0),('183012054',0,'9','GUADALUPE INSON BABATID','2022-07-18','2022-07-18 07:59:01','2022-07-18 12:19:08','','2022-07-18 12:38:03','2022-07-18 17:00:44','',0,0,8,'0','','','','','','','',0,'2022-07-18 08:00:00','2022-07-18 17:00:00','regular','N/A','N/A',0,0),('513456021',0,'9','GUADALUPE INSON BABATID','2022-07-19','2022-07-19 08:06:01','2022-07-19 12:11:32','','2022-07-19 12:48:43','2022-07-19 17:03:57','',0.1,0,7.9,'0','','','','','','','',0,'2022-07-19 08:00:00','2022-07-19 17:00:00','regular','N/A','N/A',0,0),('749647042',0,'9','GUADALUPE INSON BABATID','2022-07-20','2022-07-20 07:56:27','2022-07-20 12:05:58','','2022-07-20 12:30:31','2022-07-20 17:00:45','',0,0,8,'0','','','','','','','',0,'2022-07-20 08:00:00','2022-07-20 17:00:00','regular','N/A','N/A',0,0),('1413537517',0,'9','GUADALUPE INSON BABATID','2022-07-21','2022-07-21 08:06:44','2022-07-21 12:00:34','','2022-07-21 12:16:21','2022-07-21 17:01:09','',0.1,0,7.9,'0','','','','','','','',0,'2022-07-21 08:00:00','2022-07-21 17:00:00','regular','N/A','N/A',0,0),('1884979899',0,'9','GUADALUPE INSON BABATID','2022-07-22','2022-07-22 07:54:54','2022-07-22 12:09:18','','2022-07-22 12:22:39','2022-07-22 17:00:39','',0,0,8,'0','','','','','','','',0,'2022-07-22 08:00:00','2022-07-22 17:00:00','regular','N/A','N/A',0,0),('107864872',0,'9','GUADALUPE INSON BABATID','2022-07-25','2022-07-25 08:03:27','2022-07-25 12:15:38','','2022-07-25 12:30:07','2022-07-25 17:00:27','',0.05,0,7.95,'0','','','','','','','',0,'2022-07-25 08:00:00','2022-07-25 17:00:00','regular','N/A','N/A',0,0),('914654365',0,'9','GUADALUPE INSON BABATID','2022-07-26','2022-07-26 07:52:10',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2022-07-26 08:00:00','2022-07-26 17:00:00','regular','N/A','N/A',0,0);

/*Table structure for table `hr_emp_leave_type` */

DROP TABLE IF EXISTS `hr_emp_leave_type`;

CREATE TABLE `hr_emp_leave_type` (
  `leave_number` int(11) NOT NULL AUTO_INCREMENT,
  `leave_code` varchar(255) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `withPay` tinyint(1) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leave_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `hr_emp_leave_type` */

insert  into `hr_emp_leave_type`(`leave_number`,`leave_code`,`leave_type`,`withPay`,`remarks`) values (1,'VL','VACATION LEAVE',1,''),(2,'SL','SICK LEAVE',1,''),(3,'ML','MATERNITY LEAVE',1,''),(5,'BL','BIRTHDAY LEAVE',0,''),(6,'PL','PATERNITY LEAVE',1,''),(7,'SPL','SPECIAL LEAVE',1,''),(8,'FL','FORCED LEAVE',1,''),(9,'VLWOP','VACATION LEAVE W/O PAY',1,''),(10,'SLWOP','SICK LEAVE W/O PAY',1,''),(11,'PARL','PARENTAL LEAVE',1,''),(12,'MCL','MAGNA CARTA LEAVE',1,'');

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
  `leave_status` tinyint(1) DEFAULT '0' COMMENT '''0 - pending approval,1 - rejected,2 - canceled,3 - scheduled, approved,4 - taken',
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

insert  into `hr_emp_monthly_dtr`(`emp_number`,`dtr_month_date`,`dtr_day`,`in_am`,`out_am`,`in_pm`,`out_pm`,`late`,`undertime`,`hours_work`,`dtr_remarks`) values (1,'July, 2022','2022-07-16','','','','','0','0','0',''),(1,'July, 2022','2022-07-26','08:02','','','','0','0','0',''),(1,'July, 2022','2022-07-25','07:40','12:04','12:14','05:41','0','0','8',''),(1,'July, 2022','2022-07-22','08:03','12:08','12:18','05:28','0','0','8',''),(1,'July, 2022','2022-07-29','','','','','0','0','0',''),(1,'July, 2022','2022-07-21','08:01','12:07','12:52','07:21','0','0','8',''),(1,'July, 2022','2022-07-31','','','','','0','0','0',''),(1,'July, 2022','2022-07-30','','','','','0','0','0',''),(1,'July, 2022','2022-07-17','','','','','0','0','0',''),(1,'July, 2022','2022-07-24','','','','','0','0','0',''),(1,'July, 2022','2022-07-20','','12:00','12:34','05:06','0','0','4',''),(1,'July, 2022','2022-07-19','07:42','12:27','12:37','05:00','0','0','8',''),(1,'July, 2022','2022-07-18','07:55','12:03','12:26','05:35','0','0','8',''),(1,'July, 2022','2022-07-23','','','','','0','0','0',''),(1,'July, 2022','2022-07-28','','','','','0','0','0',''),(1,'July, 2022','2022-07-27','','','','','0','0','0',''),(2,'July, 2022','2022-07-16','','','','','0','0','0',''),(2,'July, 2022','2022-07-26','','','','','0','0','0',''),(2,'July, 2022','2022-07-25','08:20','12:05','01:03','08:15','0','0','8',''),(2,'July, 2022','2022-07-22','08:32','12:07','01:08','06:37','1','0','7',''),(2,'July, 2022','2022-07-29','','','','','0','0','0',''),(2,'July, 2022','2022-07-21','08:22','12:04','01:11','08:07','1','0','7',''),(2,'July, 2022','2022-07-31','','','','','0','0','0',''),(2,'July, 2022','2022-07-30','','','','','0','0','0',''),(2,'July, 2022','2022-07-17','','','','','0','0','0',''),(2,'July, 2022','2022-07-24','','','','','0','0','0',''),(2,'July, 2022','2022-07-20','08:30','12:07','12:37','07:32','0','0','8',''),(2,'July, 2022','2022-07-19','08:35','12:06','12:54','05:19','1','0','7',''),(2,'July, 2022','2022-07-18','08:16','','01:03','05:40','0','0','4',''),(2,'July, 2022','2022-07-23','','','','','0','0','0',''),(2,'July, 2022','2022-07-28','','','','','0','0','0',''),(2,'July, 2022','2022-07-27','','','','','0','0','0',''),(3,'July, 2022','2022-07-16','','','','','0','0','0',''),(3,'July, 2022','2022-07-26','07:51','','','','0','0','0',''),(3,'July, 2022','2022-07-25','07:53','12:10','12:33','05:04','0','0','8',''),(3,'July, 2022','2022-07-22','07:55','12:05','12:32','05:03','0','0','8',''),(3,'July, 2022','2022-07-29','','','','','0','0','0',''),(3,'July, 2022','2022-07-21','07:56','12:12','12:59','05:04','0','0','12',''),(3,'July, 2022','2022-07-31','','','','','0','0','0',''),(3,'July, 2022','2022-07-30','','','','','0','0','0',''),(3,'July, 2022','2022-07-17','','','','','0','0','0',''),(3,'July, 2022','2022-07-24','','','','','0','0','0',''),(3,'July, 2022','2022-07-20','07:53','12:05','12:22','05:05','0','0','8',''),(3,'July, 2022','2022-07-19','07:50','12:18','12:38','05:07','0','0','8',''),(3,'July, 2022','2022-07-18','07:53','12:15','12:32','05:06','0','0','8',''),(3,'July, 2022','2022-07-23','','','','','0','0','0',''),(3,'July, 2022','2022-07-28','','','','','0','0','0',''),(3,'July, 2022','2022-07-27','','','','','0','0','0',''),(5,'July, 2022','2022-07-16','','','','','0','0','0',''),(5,'July, 2022','2022-07-26','08:06','','','','0','0','0',''),(5,'July, 2022','2022-07-25','07:42','12:13','12:23','05:01','0','0','8',''),(5,'July, 2022','2022-07-22','08:19','12:01','12:16','05:00','0','0','8',''),(5,'July, 2022','2022-07-29','','','','','0','0','0',''),(5,'July, 2022','2022-07-21','08:08','12:06','12:17','04:53','0','0','8',''),(5,'July, 2022','2022-07-31','','','','','0','0','0',''),(5,'July, 2022','2022-07-30','','','','','0','0','0',''),(5,'July, 2022','2022-07-17','','','','','0','0','0',''),(5,'July, 2022','2022-07-24','','','','','0','0','0',''),(5,'July, 2022','2022-07-20','','','','','0','0','0',''),(5,'July, 2022','2022-07-19','','','','','0','0','0',''),(5,'July, 2022','2022-07-18','','','','','0','0','0',''),(5,'July, 2022','2022-07-23','','','12:47','','0','0','0',''),(5,'July, 2022','2022-07-28','','','','','0','0','0',''),(5,'July, 2022','2022-07-27','','','','','0','0','0',''),(6,'July, 2022','2022-07-16','','','','','0','0','0',''),(6,'July, 2022','2022-07-26','','','','','0','0','0',''),(6,'July, 2022','2022-07-25','09:02','','','09:00','0','0','0',''),(6,'July, 2022','2022-07-22','','','','','0','0','0',''),(6,'July, 2022','2022-07-29','','','','','0','0','0',''),(6,'July, 2022','2022-07-21','09:25','','','05:09','0','0','0',''),(6,'July, 2022','2022-07-31','','','','','0','0','0',''),(6,'July, 2022','2022-07-30','','','','','0','0','0',''),(6,'July, 2022','2022-07-17','','','','','0','0','0',''),(6,'July, 2022','2022-07-24','','','','','0','0','0',''),(6,'July, 2022','2022-07-20','','','12:18','05:58','0','0','4',''),(6,'July, 2022','2022-07-19','08:25','','','05:52','0','0','0',''),(6,'July, 2022','2022-07-18','','','','05:39','0','0','0',''),(6,'July, 2022','2022-07-23','','','','','0','0','0',''),(6,'July, 2022','2022-07-28','','','','','0','0','0',''),(6,'July, 2022','2022-07-27','','','','','0','0','0',''),(8,'July, 2022','2022-07-16','','','','','0','0','0',''),(8,'July, 2022','2022-07-26','07:58','','','','0','0','0',''),(8,'July, 2022','2022-07-25','08:00','12:09','12:43','05:05','0','0','8',''),(8,'July, 2022','2022-07-22','07:25','12:18','12:46','06:37','0','0','8',''),(8,'July, 2022','2022-07-29','','','','','0','0','0',''),(8,'July, 2022','2022-07-21','','','','','0','0','0',''),(8,'July, 2022','2022-07-31','','','','','0','0','0',''),(8,'July, 2022','2022-07-30','','','','','0','0','0',''),(8,'July, 2022','2022-07-17','','','','','0','0','0',''),(8,'July, 2022','2022-07-24','07:51','','','04:35','0','0','0',''),(8,'July, 2022','2022-07-20','','','','','0','0','0',''),(8,'July, 2022','2022-07-19','08:00','12:06','01:01','','0','0','4',''),(8,'July, 2022','2022-07-18','08:14','12:08','12:24','06:13','0','0','8',''),(8,'July, 2022','2022-07-23','07:53','','','06:24','0','0','0',''),(8,'July, 2022','2022-07-28','','','','','0','0','0',''),(8,'July, 2022','2022-07-27','','','','','0','0','0',''),(9,'July, 2022','2022-07-16','','','','','0','0','0',''),(9,'July, 2022','2022-07-26','07:52','','','','0','0','0',''),(9,'July, 2022','2022-07-25','08:03','12:15','12:30','05:00','0','0','8',''),(9,'July, 2022','2022-07-22','07:54','12:09','12:22','05:00','0','0','8',''),(9,'July, 2022','2022-07-29','','','','','0','0','0',''),(9,'July, 2022','2022-07-21','08:06','12:00','12:16','05:01','0','0','8',''),(9,'July, 2022','2022-07-31','','','','','0','0','0',''),(9,'July, 2022','2022-07-30','','','','','0','0','0',''),(9,'July, 2022','2022-07-17','','','','','0','0','0',''),(9,'July, 2022','2022-07-24','','','','','0','0','0',''),(9,'July, 2022','2022-07-20','07:56','12:05','12:30','05:00','0','0','8',''),(9,'July, 2022','2022-07-19','08:06','12:11','12:48','05:03','0','0','8',''),(9,'July, 2022','2022-07-18','07:59','12:19','12:38','05:00','0','0','8',''),(9,'July, 2022','2022-07-23','','','','','0','0','0',''),(9,'July, 2022','2022-07-28','','','','','0','0','0',''),(9,'July, 2022','2022-07-27','','','','','0','0','0',''),(10,'July, 2022','2022-07-16','','','','','0','0','0',''),(10,'July, 2022','2022-07-26','','','','','0','0','0',''),(10,'July, 2022','2022-07-25','','','','','0','0','0',''),(10,'July, 2022','2022-07-22','08:13','12:26','','','0','0','4',''),(10,'July, 2022','2022-07-29','','','','','0','0','0',''),(10,'July, 2022','2022-07-21','08:50','12:03','12:33','05:05','1','0','7',''),(10,'July, 2022','2022-07-31','','','','','0','0','0',''),(10,'July, 2022','2022-07-30','','','','','0','0','0',''),(10,'July, 2022','2022-07-17','','','','','0','0','0',''),(10,'July, 2022','2022-07-24','','','','','0','0','0',''),(10,'July, 2022','2022-07-20','08:38','12:01','12:20','05:28','1','0','7',''),(10,'July, 2022','2022-07-19','08:33','12:22','12:37','05:07','1','0','7',''),(10,'July, 2022','2022-07-18','','','12:49','05:16','0','0','4',''),(10,'July, 2022','2022-07-23','','','','','0','0','0',''),(10,'July, 2022','2022-07-28','','','','','0','0','0',''),(10,'July, 2022','2022-07-27','','','','','0','0','0',''),(11,'July, 2022','2022-07-16','','','','','0','0','0',''),(11,'July, 2022','2022-07-26','08:16','','','','0','0','0',''),(11,'July, 2022','2022-07-25','08:00','12:06','01:20','05:02','0','0','8',''),(11,'July, 2022','2022-07-22','08:20','12:06','12:20','05:01','0','0','8',''),(11,'July, 2022','2022-07-29','','','','','0','0','0',''),(11,'July, 2022','2022-07-21','08:19','12:00','01:14','05:01','1','0','7',''),(11,'July, 2022','2022-07-31','','','','','0','0','0',''),(11,'July, 2022','2022-07-30','','','','','0','0','0',''),(11,'July, 2022','2022-07-17','','','','','0','0','0',''),(11,'July, 2022','2022-07-24','','','','','0','0','0',''),(11,'July, 2022','2022-07-20','08:11','12:02','12:43','05:51','0','0','8',''),(11,'July, 2022','2022-07-19','08:27','12:02','','05:04','0','0','4',''),(11,'July, 2022','2022-07-18','08:14','12:04','01:11','05:04','0','0','8',''),(11,'July, 2022','2022-07-23','','','','','0','0','0',''),(11,'July, 2022','2022-07-28','','','','','0','0','0',''),(11,'July, 2022','2022-07-27','','','','','0','0','0',''),(12,'July, 2022','2022-07-16','','','','','0','0','0',''),(12,'July, 2022','2022-07-26','08:04','','','','0','0','0',''),(12,'July, 2022','2022-07-25','08:04','12:17','12:27','05:24','0','0','8',''),(12,'July, 2022','2022-07-22','','','','','0','0','0',''),(12,'July, 2022','2022-07-29','','','','','0','0','0',''),(12,'July, 2022','2022-07-21','08:04','','','05:10','0','0','0',''),(12,'July, 2022','2022-07-31','','','','','0','0','0',''),(12,'July, 2022','2022-07-30','','','','','0','0','0',''),(12,'July, 2022','2022-07-17','','','','','0','0','0',''),(12,'July, 2022','2022-07-24','','','','','0','0','0',''),(12,'July, 2022','2022-07-20','08:47','12:02','12:18','05:24','1','0','7',''),(12,'July, 2022','2022-07-19','','','','','0','0','0',''),(12,'July, 2022','2022-07-18','','','','','0','0','0',''),(12,'July, 2022','2022-07-23','','','','','0','0','0',''),(12,'July, 2022','2022-07-28','','','','','0','0','0',''),(12,'July, 2022','2022-07-27','','','','','0','0','0',''),(13,'July, 2022','2022-07-16','','','','','0','0','0',''),(13,'July, 2022','2022-07-26','07:22','','','','0','0','0',''),(13,'July, 2022','2022-07-25','07:48','12:36','','05:38','0','0','4',''),(13,'July, 2022','2022-07-22','07:19','12:13','12:24','05:35','0','0','8',''),(13,'July, 2022','2022-07-29','','','','','0','0','0',''),(13,'July, 2022','2022-07-21','07:13','12:04','12:33','05:19','0','0','8',''),(13,'July, 2022','2022-07-31','','','','','0','0','0',''),(13,'July, 2022','2022-07-30','','','','','0','0','0',''),(13,'July, 2022','2022-07-17','','','','','0','0','0',''),(13,'July, 2022','2022-07-24','','','','','0','0','0',''),(13,'July, 2022','2022-07-20','07:15','','','05:49','0','0','0',''),(13,'July, 2022','2022-07-19','07:12','12:27','12:40','05:10','0','0','8',''),(13,'July, 2022','2022-07-18','07:40','12:16','','05:47','0','0','4',''),(13,'July, 2022','2022-07-23','','','','','0','0','0',''),(13,'July, 2022','2022-07-28','','','','','0','0','0',''),(13,'July, 2022','2022-07-27','','','','','0','0','0',''),(14,'July, 2022','2022-07-16','','','','','0','0','0',''),(14,'July, 2022','2022-07-26','08:13','','','','0','0','0',''),(14,'July, 2022','2022-07-25','','','','05:44','0','0','0',''),(14,'July, 2022','2022-07-22','08:35','','','06:03','0','0','0',''),(14,'July, 2022','2022-07-29','','','','','0','0','0',''),(14,'July, 2022','2022-07-21','08:35','','','05:25','0','0','0',''),(14,'July, 2022','2022-07-31','','','','','0','0','0',''),(14,'July, 2022','2022-07-30','','','','','0','0','0',''),(14,'July, 2022','2022-07-17','','','','','0','0','0',''),(14,'July, 2022','2022-07-24','','','','','0','0','0',''),(14,'July, 2022','2022-07-20','','','','','0','0','0',''),(14,'July, 2022','2022-07-19','','','','','0','0','0',''),(14,'July, 2022','2022-07-18','08:21','','','05:56','0','0','0',''),(14,'July, 2022','2022-07-23','','','','','0','0','0',''),(14,'July, 2022','2022-07-28','','','','','0','0','0',''),(14,'July, 2022','2022-07-27','','','','','0','0','0',''),(15,'July, 2022','2022-07-16','','','','','0','0','0',''),(15,'July, 2022','2022-07-26','07:44','','','','0','0','0',''),(15,'July, 2022','2022-07-25','08:05','12:20','12:31','05:27','0','0','8',''),(15,'July, 2022','2022-07-22','07:50','12:03','12:19','','0','0','4',''),(15,'July, 2022','2022-07-29','','','','','0','0','0',''),(15,'July, 2022','2022-07-21','07:48','12:00','12:22','05:02','0','0','8',''),(15,'July, 2022','2022-07-31','','','','','0','0','0',''),(15,'July, 2022','2022-07-30','','','','','0','0','0',''),(15,'July, 2022','2022-07-17','','','','','0','0','0',''),(15,'July, 2022','2022-07-24','','','','','0','0','0',''),(15,'July, 2022','2022-07-20','07:44','12:10','12:20','05:29','0','0','8',''),(15,'July, 2022','2022-07-19','07:43','12:20','12:32','05:04','0','0','8',''),(15,'July, 2022','2022-07-18','07:39','12:19','12:30','05:06','0','0','8',''),(15,'July, 2022','2022-07-23','','','','','0','0','0',''),(15,'July, 2022','2022-07-28','','','','','0','0','0',''),(15,'July, 2022','2022-07-27','','','','','0','0','0',''),(16,'July, 2022','2022-07-16','','','','','0','0','0',''),(16,'July, 2022','2022-07-26','08:09','','','','0','0','0',''),(16,'July, 2022','2022-07-25','','','12:05','07:42','0','0','4',''),(16,'July, 2022','2022-07-22','','','12:13','06:37','0','0','4',''),(16,'July, 2022','2022-07-29','','','','','0','0','0',''),(16,'July, 2022','2022-07-21','','12:07','','08:07','0','0','0',''),(16,'July, 2022','2022-07-31','','','','','0','0','0',''),(16,'July, 2022','2022-07-30','','','','','0','0','0',''),(16,'July, 2022','2022-07-17','','','','','0','0','0',''),(16,'July, 2022','2022-07-24','','','','','0','0','0',''),(16,'July, 2022','2022-07-20','08:49','12:03','12:36','07:32','1','0','7',''),(16,'July, 2022','2022-07-19','08:19','12:30','12:42','05:08','0','0','8',''),(16,'July, 2022','2022-07-18','08:39','12:03','12:26','05:40','1','0','7',''),(16,'July, 2022','2022-07-23','','','','','0','0','0',''),(16,'July, 2022','2022-07-28','','','','','0','0','0',''),(16,'July, 2022','2022-07-27','','','','','0','0','0',''),(19,'July, 2022','2022-07-16','','','','','0','0','0',''),(19,'July, 2022','2022-07-26','08:00','','','','0','0','0',''),(19,'July, 2022','2022-07-25','08:25','12:01','12:59','05:05','0','0','8',''),(19,'July, 2022','2022-07-22','07:54','12:03','12:13','','0','0','4',''),(19,'July, 2022','2022-07-29','','','','','0','0','0',''),(19,'July, 2022','2022-07-21','08:11','12:05','12:18','05:03','0','0','8',''),(19,'July, 2022','2022-07-31','','','','','0','0','0',''),(19,'July, 2022','2022-07-30','','','','','0','0','0',''),(19,'July, 2022','2022-07-17','','','','','0','0','0',''),(19,'July, 2022','2022-07-24','','','','','0','0','0',''),(19,'July, 2022','2022-07-20','07:26','12:50','01:00','05:06','0','0','8',''),(19,'July, 2022','2022-07-19','08:00','12:04','12:52','05:13','0','0','8',''),(19,'July, 2022','2022-07-18','08:08','12:00','12:49','05:09','0','0','8',''),(19,'July, 2022','2022-07-23','','','','','0','0','0',''),(19,'July, 2022','2022-07-28','','','','','0','0','0',''),(19,'July, 2022','2022-07-27','','','','','0','0','0',''),(20,'July, 2022','2022-07-16','','','','','0','0','0',''),(20,'July, 2022','2022-07-26','07:22','','','','0','0','0',''),(20,'July, 2022','2022-07-25','09:00','12:03','12:21','06:18','1','0','7',''),(20,'July, 2022','2022-07-22','07:11','12:06','12:29','06:13','0','0','8',''),(20,'July, 2022','2022-07-29','','','','','0','0','0',''),(20,'July, 2022','2022-07-21','07:09','12:00','12:18','05:08','0','0','8',''),(20,'July, 2022','2022-07-31','','','','','0','0','0',''),(20,'July, 2022','2022-07-30','','','','','0','0','0',''),(20,'July, 2022','2022-07-17','','','','','0','0','0',''),(20,'July, 2022','2022-07-24','','','','','0','0','0',''),(20,'July, 2022','2022-07-20','07:30','12:00','12:18','07:38','0','0','8',''),(20,'July, 2022','2022-07-19','07:37','12:04','12:25','05:16','0','0','8',''),(20,'July, 2022','2022-07-18','11:06','','','05:01','0','0','0',''),(20,'July, 2022','2022-07-23','06:42','','','','0','0','0',''),(20,'July, 2022','2022-07-28','','','','','0','0','0',''),(20,'July, 2022','2022-07-27','','','','','0','0','0',''),(21,'July, 2022','2022-07-16','','','','','0','0','0',''),(21,'July, 2022','2022-07-26','07:44','','','','0','0','0',''),(21,'July, 2022','2022-07-25','07:52','12:07','12:26','05:12','0','0','8',''),(21,'July, 2022','2022-07-22','07:47','12:01','12:12','05:02','0','0','8',''),(21,'July, 2022','2022-07-29','','','','','0','0','0',''),(21,'July, 2022','2022-07-21','07:58','12:01','12:12','05:08','0','0','8',''),(21,'July, 2022','2022-07-31','','','','','0','0','0',''),(21,'July, 2022','2022-07-30','','','','','0','0','0',''),(21,'July, 2022','2022-07-17','','','','','0','0','0',''),(21,'July, 2022','2022-07-24','','','','','0','0','0',''),(21,'July, 2022','2022-07-20','07:54','12:00','12:11','05:22','0','0','8',''),(21,'July, 2022','2022-07-19','07:49','12:00','12:11','','0','0','4',''),(21,'July, 2022','2022-07-18','08:05','12:01','12:12','05:39','0','0','8',''),(21,'July, 2022','2022-07-23','','','','','0','0','0',''),(21,'July, 2022','2022-07-28','','','','','0','0','0',''),(21,'July, 2022','2022-07-27','','','','','0','0','0',''),(22,'July, 2022','2022-07-16','','','','','0','0','0',''),(22,'July, 2022','2022-07-26','08:01','','','','0','0','0',''),(22,'July, 2022','2022-07-25','','12:16','12:27','05:32','0','0','4',''),(22,'July, 2022','2022-07-22','08:01','12:13','12:24','05:35','0','0','8',''),(22,'July, 2022','2022-07-29','','','','','0','0','0',''),(22,'July, 2022','2022-07-21','09:07','','','05:09','0','0','0',''),(22,'July, 2022','2022-07-31','','','','','0','0','0',''),(22,'July, 2022','2022-07-30','','','','','0','0','0',''),(22,'July, 2022','2022-07-17','','','','','0','0','0',''),(22,'July, 2022','2022-07-24','','','','','0','0','0',''),(22,'July, 2022','2022-07-20','07:35','12:02','12:18','05:22','0','0','8',''),(22,'July, 2022','2022-07-19','07:41','12:47','01:00','05:35','0','0','8',''),(22,'July, 2022','2022-07-18','','12:22','12:33','05:06','0','0','4',''),(22,'July, 2022','2022-07-23','','','','','0','0','0',''),(22,'July, 2022','2022-07-28','','','','','0','0','0',''),(22,'July, 2022','2022-07-27','','','','','0','0','0',''),(23,'July, 2022','2022-07-16','','','','','0','0','0',''),(23,'July, 2022','2022-07-26','07:59','','','','0','0','0',''),(23,'July, 2022','2022-07-25','','','','','0','0','0',''),(23,'July, 2022','2022-07-22','07:54','12:26','','','0','0','4',''),(23,'July, 2022','2022-07-29','','','','','0','0','0',''),(23,'July, 2022','2022-07-21','','','12:42','05:05','0','0','4',''),(23,'July, 2022','2022-07-31','','','','','0','0','0',''),(23,'July, 2022','2022-07-30','','','','','0','0','0',''),(23,'July, 2022','2022-07-17','','','','','0','0','0',''),(23,'July, 2022','2022-07-24','','','','','0','0','0',''),(23,'July, 2022','2022-07-20','08:05','12:23','12:45','05:28','0','0','8',''),(23,'July, 2022','2022-07-19','08:23','12:22','12:37','05:07','0','0','8',''),(23,'July, 2022','2022-07-18','08:15','11:16','','','0','1','3',''),(23,'July, 2022','2022-07-23','','','','','0','0','0',''),(23,'July, 2022','2022-07-28','','','','','0','0','0',''),(23,'July, 2022','2022-07-27','','','','','0','0','0',''),(25,'July, 2022','2022-07-16','','','','','0','0','0',''),(25,'July, 2022','2022-07-26','','','','','0','0','0',''),(25,'July, 2022','2022-07-25','07:55','12:25','12:49','10:17','0','0','8',''),(25,'July, 2022','2022-07-22','08:26','12:41','12:51','09:05','0','0','8',''),(25,'July, 2022','2022-07-29','','','','','0','0','0',''),(25,'July, 2022','2022-07-21','08:31','12:04','12:22','06:12','1','0','7',''),(25,'July, 2022','2022-07-31','','','','','0','0','0',''),(25,'July, 2022','2022-07-30','','','','','0','0','0',''),(25,'July, 2022','2022-07-17','','','','','0','0','0',''),(25,'July, 2022','2022-07-24','','','','','0','0','0',''),(25,'July, 2022','2022-07-20','08:01','12:09','01:20','05:23','0','0','8',''),(25,'July, 2022','2022-07-19','08:06','12:05','01:00','05:56','0','0','8',''),(25,'July, 2022','2022-07-18','','','','','0','0','0',''),(25,'July, 2022','2022-07-23','','','','','0','0','0',''),(25,'July, 2022','2022-07-28','','','','','0','0','0',''),(25,'July, 2022','2022-07-27','','','','','0','0','0',''),(26,'July, 2022','2022-07-16','','','','','0','0','0',''),(26,'July, 2022','2022-07-26','','','','','0','0','0',''),(26,'July, 2022','2022-07-25','08:49','12:07','07:25','','1','0','3',''),(26,'July, 2022','2022-07-22','','','','','0','0','0',''),(26,'July, 2022','2022-07-29','','','','','0','0','0',''),(26,'July, 2022','2022-07-21','09:46','12:03','12:15','06:04','2','0','6',''),(26,'July, 2022','2022-07-31','','','','','0','0','0',''),(26,'July, 2022','2022-07-30','','','','','0','0','0',''),(26,'July, 2022','2022-07-17','','','','','0','0','0',''),(26,'July, 2022','2022-07-24','','','','','0','0','0',''),(26,'July, 2022','2022-07-20','08:37','12:03','12:13','05:50','1','0','7',''),(26,'July, 2022','2022-07-19','','','01:22','06:07','0','0','4',''),(26,'July, 2022','2022-07-18','09:25','12:05','12:18','','1','0','3',''),(26,'July, 2022','2022-07-23','','','','','0','0','0',''),(26,'July, 2022','2022-07-28','','','','','0','0','0',''),(26,'July, 2022','2022-07-27','','','','','0','0','0',''),(27,'July, 2022','2022-07-16','','','','','0','0','0',''),(27,'July, 2022','2022-07-26','08:20','','','','0','0','0',''),(27,'July, 2022','2022-07-25','','12:40','12:55','05:26','0','0','4',''),(27,'July, 2022','2022-07-22','08:27','12:18','12:33','05:19','0','0','8',''),(27,'July, 2022','2022-07-29','','','','','0','0','0',''),(27,'July, 2022','2022-07-21','08:25','12:40','12:54','05:09','0','0','8',''),(27,'July, 2022','2022-07-31','','','','','0','0','0',''),(27,'July, 2022','2022-07-30','','','','','0','0','0',''),(27,'July, 2022','2022-07-17','','','','','0','0','0',''),(27,'July, 2022','2022-07-24','','','','','0','0','0',''),(27,'July, 2022','2022-07-20','08:22','12:27','12:38','','0','0','4',''),(27,'July, 2022','2022-07-19','08:01','12:31','12:41','','0','0','4',''),(27,'July, 2022','2022-07-18','','','','','0','0','0',''),(27,'July, 2022','2022-07-23','','','','','0','0','0',''),(27,'July, 2022','2022-07-28','','','','','0','0','0',''),(27,'July, 2022','2022-07-27','','','','','0','0','0',''),(29,'July, 2022','2022-07-16','','','','','0','0','0',''),(29,'July, 2022','2022-07-26','07:55','','','','0','0','0',''),(29,'July, 2022','2022-07-25','07:47','12:04','12:15','05:07','0','0','8',''),(29,'July, 2022','2022-07-22','07:44','12:03','12:18','05:04','0','0','8',''),(29,'July, 2022','2022-07-29','','','','','0','0','0',''),(29,'July, 2022','2022-07-21','07:57','12:30','12:41','05:00','0','0','8',''),(29,'July, 2022','2022-07-31','','','','','0','0','0',''),(29,'July, 2022','2022-07-30','','','','','0','0','0',''),(29,'July, 2022','2022-07-17','','','','','0','0','0',''),(29,'July, 2022','2022-07-24','','','','','0','0','0',''),(29,'July, 2022','2022-07-20','07:52','12:01','12:18','05:00','0','0','8',''),(29,'July, 2022','2022-07-19','07:54','12:02','12:13','05:07','0','0','8',''),(29,'July, 2022','2022-07-18','07:54','12:01','12:47','05:10','0','0','8',''),(29,'July, 2022','2022-07-23','','','','','0','0','0',''),(29,'July, 2022','2022-07-28','','','','','0','0','0',''),(29,'July, 2022','2022-07-27','','','','','0','0','0',''),(30,'July, 2022','2022-07-16','','','','','0','0','0',''),(30,'July, 2022','2022-07-26','07:47','','','','0','0','0',''),(30,'July, 2022','2022-07-25','07:49','12:02','12:43','05:06','0','0','8',''),(30,'July, 2022','2022-07-22','07:44','12:00','12:21','05:03','0','0','8',''),(30,'July, 2022','2022-07-29','','','','','0','0','0',''),(30,'July, 2022','2022-07-21','07:57','12:00','12:55','05:00','0','0','8',''),(30,'July, 2022','2022-07-31','','','','','0','0','0',''),(30,'July, 2022','2022-07-30','','','','','0','0','0',''),(30,'July, 2022','2022-07-17','','','','','0','0','0',''),(30,'July, 2022','2022-07-24','','','','','0','0','0',''),(30,'July, 2022','2022-07-20','07:51','12:00','12:36','05:00','0','0','8',''),(30,'July, 2022','2022-07-19','07:46','12:00','12:33','05:00','0','0','8',''),(30,'July, 2022','2022-07-18','07:54','','12:01','05:01','0','0','4',''),(30,'July, 2022','2022-07-23','','','','','0','0','0',''),(30,'July, 2022','2022-07-28','','','','','0','0','0',''),(30,'July, 2022','2022-07-27','','','','','0','0','0',''),(31,'July, 2022','2022-07-16','','','','','0','0','0',''),(31,'July, 2022','2022-07-26','07:48','','','','0','0','0',''),(31,'July, 2022','2022-07-25','08:02','12:05','12:55','05:36','0','0','8',''),(31,'July, 2022','2022-07-22','07:52','12:10','01:12','05:02','0','0','8',''),(31,'July, 2022','2022-07-29','','','','','0','0','0',''),(31,'July, 2022','2022-07-21','07:52','12:15','12:52','05:06','0','0','8',''),(31,'July, 2022','2022-07-31','','','','','0','0','0',''),(31,'July, 2022','2022-07-30','','','','','0','0','0',''),(31,'July, 2022','2022-07-17','','','','','0','0','0',''),(31,'July, 2022','2022-07-24','','','','','0','0','0',''),(31,'July, 2022','2022-07-20','07:51','12:10','12:42','05:51','0','0','8',''),(31,'July, 2022','2022-07-19','07:50','12:22','','05:45','0','0','8',''),(31,'July, 2022','2022-07-18','07:55','12:09','12:59','05:52','0','0','8',''),(31,'July, 2022','2022-07-23','','','','','0','0','0',''),(31,'July, 2022','2022-07-28','','','','','0','0','0',''),(31,'July, 2022','2022-07-27','','','','','0','0','0',''),(32,'July, 2022','2022-07-16','','','','','0','0','0',''),(32,'July, 2022','2022-07-26','','','','','0','0','0',''),(32,'July, 2022','2022-07-25','','','','','0','0','0',''),(32,'July, 2022','2022-07-22','','','','','0','0','0',''),(32,'July, 2022','2022-07-29','','','','','0','0','0',''),(32,'July, 2022','2022-07-21','','','','','0','0','0',''),(32,'July, 2022','2022-07-31','','','','','0','0','0',''),(32,'July, 2022','2022-07-30','','','','','0','0','0',''),(32,'July, 2022','2022-07-17','','','','','0','0','0',''),(32,'July, 2022','2022-07-24','','','','','0','0','0',''),(32,'July, 2022','2022-07-20','08:19','12:10','12:20','05:24','0','0','8',''),(32,'July, 2022','2022-07-19','07:57','','','','0','0','0',''),(32,'July, 2022','2022-07-18','08:16','','12:46','05:11','0','0','4',''),(32,'July, 2022','2022-07-23','','','','','0','0','0',''),(32,'July, 2022','2022-07-28','','','','','0','0','0',''),(32,'July, 2022','2022-07-27','','','','','0','0','0',''),(33,'July, 2022','2022-07-16','07:04','','','06:08','0','0','0',''),(33,'July, 2022','2022-07-26','08:02','','','','0','0','0',''),(33,'July, 2022','2022-07-25','07:44','12:25','01:01','10:15','0','0','8',''),(33,'July, 2022','2022-07-22','07:09','12:10','12:29','05:47','0','0','8',''),(33,'July, 2022','2022-07-29','','','','','0','0','0',''),(33,'July, 2022','2022-07-21','07:06','12:06','12:43','06:16','0','0','8',''),(33,'July, 2022','2022-07-31','','','','','0','0','0',''),(33,'July, 2022','2022-07-30','','','','','0','0','0',''),(33,'July, 2022','2022-07-17','07:31','','','09:58','0','0','0',''),(33,'July, 2022','2022-07-24','','','','','0','0','0',''),(33,'July, 2022','2022-07-20','07:03','12:01','12:13','06:08','0','0','8',''),(33,'July, 2022','2022-07-19','07:42','12:42','12:57','05:39','0','0','8',''),(33,'July, 2022','2022-07-18','07:27','12:08','12:47','07:55','0','0','8',''),(33,'July, 2022','2022-07-23','','','','','0','0','0',''),(33,'July, 2022','2022-07-28','','','','','0','0','0',''),(33,'July, 2022','2022-07-27','','','','','0','0','0',''),(34,'July, 2022','2022-07-16','','','','','0','0','0',''),(34,'July, 2022','2022-07-26','07:48','','','','0','0','0',''),(34,'July, 2022','2022-07-25','08:20','12:03','12:25','06:19','0','0','8',''),(34,'July, 2022','2022-07-22','07:23','12:05','12:25','05:04','0','0','8',''),(34,'July, 2022','2022-07-29','','','','','0','0','0',''),(34,'July, 2022','2022-07-21','07:51','12:14','12:25','06:04','0','0','8',''),(34,'July, 2022','2022-07-31','','','','','0','0','0',''),(34,'July, 2022','2022-07-30','','','','','0','0','0',''),(34,'July, 2022','2022-07-17','','','','','0','0','0',''),(34,'July, 2022','2022-07-24','','','','','0','0','0',''),(34,'July, 2022','2022-07-20','07:25','12:03','12:15','05:45','0','0','8',''),(34,'July, 2022','2022-07-19','','','12:13','','0','0','0',''),(34,'July, 2022','2022-07-18','07:51','12:03','12:28','05:12','0','0','8',''),(34,'July, 2022','2022-07-23','','','','','0','0','0',''),(34,'July, 2022','2022-07-28','','','','','0','0','0',''),(34,'July, 2022','2022-07-27','','','','','0','0','0',''),(35,'July, 2022','2022-07-16','','','','','0','0','0',''),(35,'July, 2022','2022-07-26','07:56','','','','0','0','0',''),(35,'July, 2022','2022-07-25','08:02','12:03','','05:18','0','0','4',''),(35,'July, 2022','2022-07-22','07:56','12:38','12:51','05:07','0','0','8',''),(35,'July, 2022','2022-07-29','','','','','0','0','0',''),(35,'July, 2022','2022-07-21','07:51','','','','0','0','0',''),(35,'July, 2022','2022-07-31','','','','','0','0','0',''),(35,'July, 2022','2022-07-30','','','','','0','0','0',''),(35,'July, 2022','2022-07-17','','','','','0','0','0',''),(35,'July, 2022','2022-07-24','','','','','0','0','0',''),(35,'July, 2022','2022-07-20','','','01:15','05:00','0','0','4',''),(35,'July, 2022','2022-07-19','','','','','0','0','0',''),(35,'July, 2022','2022-07-18','07:57','12:13','12:27','05:28','0','0','8',''),(35,'July, 2022','2022-07-23','','','','','0','0','0',''),(35,'July, 2022','2022-07-28','','','','','0','0','0',''),(35,'July, 2022','2022-07-27','','','','','0','0','0',''),(39,'July, 2022','2022-07-16','','','','','0','0','0',''),(39,'July, 2022','2022-07-26','','','','','0','0','0',''),(39,'July, 2022','2022-07-25','','','','','0','0','0',''),(39,'July, 2022','2022-07-22','','12:13','12:46','06:05','0','0','4',''),(39,'July, 2022','2022-07-29','','','','','0','0','0',''),(39,'July, 2022','2022-07-21','','12:10','12:31','06:09','0','0','4',''),(39,'July, 2022','2022-07-31','','','','','0','0','0',''),(39,'July, 2022','2022-07-30','','','','','0','0','0',''),(39,'July, 2022','2022-07-17','','','','','0','0','0',''),(39,'July, 2022','2022-07-24','08:06','','','04:35','0','0','0',''),(39,'July, 2022','2022-07-20','','','','','0','0','0',''),(39,'July, 2022','2022-07-19','08:11','','','','0','0','0',''),(39,'July, 2022','2022-07-18','08:41','12:08','12:24','06:15','1','0','7',''),(39,'July, 2022','2022-07-23','','','','06:23','0','0','0',''),(39,'July, 2022','2022-07-28','','','','','0','0','0',''),(39,'July, 2022','2022-07-27','','','','','0','0','0',''),(40,'July, 2022','2022-07-16','09:57','','','04:48','0','0','0',''),(40,'July, 2022','2022-07-26','07:43','','','','0','0','0',''),(40,'July, 2022','2022-07-25','08:03','12:13','12:23','05:46','0','0','8',''),(40,'July, 2022','2022-07-22','07:56','12:21','12:34','05:05','0','0','8',''),(40,'July, 2022','2022-07-29','','','','','0','0','0',''),(40,'July, 2022','2022-07-21','08:13','12:29','12:49','05:09','0','0','8',''),(40,'July, 2022','2022-07-31','','','','','0','0','0',''),(40,'July, 2022','2022-07-30','','','','','0','0','0',''),(40,'July, 2022','2022-07-17','','','','','0','0','0',''),(40,'July, 2022','2022-07-24','','','','','0','0','0',''),(40,'July, 2022','2022-07-20','07:35','12:45','12:58','05:32','0','0','8',''),(40,'July, 2022','2022-07-19','08:02','11:59','12:16','05:58','0','0','8',''),(40,'July, 2022','2022-07-18','','12:42','12:53','05:23','0','0','4',''),(40,'July, 2022','2022-07-23','','','','','0','0','0',''),(40,'July, 2022','2022-07-28','','','','','0','0','0',''),(40,'July, 2022','2022-07-27','','','','','0','0','0',''),(41,'July, 2022','2022-07-16','','','','','0','0','0',''),(41,'July, 2022','2022-07-26','','','','','0','0','0',''),(41,'July, 2022','2022-07-25','08:16','12:20','12:32','05:40','0','0','8',''),(41,'July, 2022','2022-07-22','','','','','0','0','0',''),(41,'July, 2022','2022-07-29','','','','','0','0','0',''),(41,'July, 2022','2022-07-21','08:36','12:00','12:18','05:44','1','0','7',''),(41,'July, 2022','2022-07-31','','','','','0','0','0',''),(41,'July, 2022','2022-07-30','','','','','0','0','0',''),(41,'July, 2022','2022-07-17','','','','','0','0','0',''),(41,'July, 2022','2022-07-24','','','','','0','0','0',''),(41,'July, 2022','2022-07-20','09:11','12:09','12:33','05:59','1','0','7',''),(41,'July, 2022','2022-07-19','08:26','12:31','','05:22','1','0','7',''),(41,'July, 2022','2022-07-18','08:54','12:19','12:31','05:35','1','0','7',''),(41,'July, 2022','2022-07-23','','','','','0','0','0',''),(41,'July, 2022','2022-07-28','','','','','0','0','0',''),(41,'July, 2022','2022-07-27','','','','','0','0','0',''),(43,'July, 2022','2022-07-16','08:11','','','05:58','0','0','0',''),(43,'July, 2022','2022-07-26','','','','','0','0','0',''),(43,'July, 2022','2022-07-25','08:35','12:25','12:53','10:27','1','0','7',''),(43,'July, 2022','2022-07-22','08:11','12:11','01:28','05:56','1','0','7',''),(43,'July, 2022','2022-07-29','','','','','0','0','0',''),(43,'July, 2022','2022-07-21','08:22','12:04','12:18','05:07','0','0','8',''),(43,'July, 2022','2022-07-31','','','','','0','0','0',''),(43,'July, 2022','2022-07-30','','','','','0','0','0',''),(43,'July, 2022','2022-07-17','08:41','','','','0','0','0',''),(43,'July, 2022','2022-07-24','','','','','0','0','0',''),(43,'July, 2022','2022-07-20','08:16','12:41','12:51','06:09','0','0','8',''),(43,'July, 2022','2022-07-19','08:16','12:03','01:28','06:06','1','0','7',''),(43,'July, 2022','2022-07-18','08:21','12:22','','08:10','0','0','4',''),(43,'July, 2022','2022-07-23','','','','','0','0','0',''),(43,'July, 2022','2022-07-28','','','','','0','0','0',''),(43,'July, 2022','2022-07-27','','','','','0','0','0',''),(44,'July, 2022','2022-07-16','','','','','0','0','0',''),(44,'July, 2022','2022-07-26','08:20','','','','0','0','0',''),(44,'July, 2022','2022-07-25','','','','','0','0','0',''),(44,'July, 2022','2022-07-22','','','','','0','0','0',''),(44,'July, 2022','2022-07-29','','','','','0','0','0',''),(44,'July, 2022','2022-07-21','08:34','12:13','01:20','05:11','1','0','7',''),(44,'July, 2022','2022-07-31','','','','','0','0','0',''),(44,'July, 2022','2022-07-30','','','','','0','0','0',''),(44,'July, 2022','2022-07-17','','','','','0','0','0',''),(44,'July, 2022','2022-07-24','','','','','0','0','0',''),(44,'July, 2022','2022-07-20','','','','','0','0','0',''),(44,'July, 2022','2022-07-19','09:04','12:10','01:29','05:09','2','0','6',''),(44,'July, 2022','2022-07-18','08:51','12:12','01:27','05:19','1','0','7',''),(44,'July, 2022','2022-07-23','','','','','0','0','0',''),(44,'July, 2022','2022-07-28','','','','','0','0','0',''),(44,'July, 2022','2022-07-27','','','','','0','0','0',''),(45,'July, 2022','2022-07-16','','','','','0','0','0',''),(45,'July, 2022','2022-07-26','','','','','0','0','0',''),(45,'July, 2022','2022-07-25','08:13','12:28','12:38','05:07','0','0','8',''),(45,'July, 2022','2022-07-22','08:09','12:08','12:19','05:21','0','0','8',''),(45,'July, 2022','2022-07-29','','','','','0','0','0',''),(45,'July, 2022','2022-07-21','','','','','0','0','0',''),(45,'July, 2022','2022-07-31','','','','','0','0','0',''),(45,'July, 2022','2022-07-30','','','','','0','0','0',''),(45,'July, 2022','2022-07-17','','','','','0','0','0',''),(45,'July, 2022','2022-07-24','','','','','0','0','0',''),(45,'July, 2022','2022-07-20','08:43','12:27','12:57','05:15','1','0','7',''),(45,'July, 2022','2022-07-19','','12:13','12:29','05:12','0','0','4',''),(45,'July, 2022','2022-07-18','08:27','12:18','12:31','05:14','0','0','8',''),(45,'July, 2022','2022-07-23','','','','','0','0','0',''),(45,'July, 2022','2022-07-28','','','','','0','0','0',''),(45,'July, 2022','2022-07-27','','','','','0','0','0',''),(46,'July, 2022','2022-07-16','07:41','','','06:25','0','0','0',''),(46,'July, 2022','2022-07-26','07:52','','','','0','0','0',''),(46,'July, 2022','2022-07-25','07:53','12:04','12:15','07:48','0','0','8',''),(46,'July, 2022','2022-07-22','07:04','12:04','12:23','06:28','0','0','8',''),(46,'July, 2022','2022-07-29','','','','','0','0','0',''),(46,'July, 2022','2022-07-21','07:15','12:05','12:16','08:23','0','0','8',''),(46,'July, 2022','2022-07-31','','','','','0','0','0',''),(46,'July, 2022','2022-07-30','','','','','0','0','0',''),(46,'July, 2022','2022-07-17','','','','','0','0','0',''),(46,'July, 2022','2022-07-24','','','','','0','0','0',''),(46,'July, 2022','2022-07-20','07:04','12:09','12:20','06:46','0','0','8',''),(46,'July, 2022','2022-07-19','07:28','12:02','12:13','06:40','0','0','8',''),(46,'July, 2022','2022-07-18','07:35','12:30','12:41','06:20','0','0','8',''),(46,'July, 2022','2022-07-23','09:25','','','06:04','0','0','0',''),(46,'July, 2022','2022-07-28','','','','','0','0','0',''),(46,'July, 2022','2022-07-27','','','','','0','0','0',''),(47,'July, 2022','2022-07-16','','','','','0','0','0',''),(47,'July, 2022','2022-07-26','07:55','','','','0','0','0',''),(47,'July, 2022','2022-07-25','08:18','12:05','12:40','05:24','0','0','8',''),(47,'July, 2022','2022-07-22','','','','','0','0','0',''),(47,'July, 2022','2022-07-29','','','','','0','0','0',''),(47,'July, 2022','2022-07-21','08:15','12:04','12:33','05:12','0','0','8',''),(47,'July, 2022','2022-07-31','','','','','0','0','0',''),(47,'July, 2022','2022-07-30','','','','','0','0','0',''),(47,'July, 2022','2022-07-17','','','','','0','0','0',''),(47,'July, 2022','2022-07-24','','','','','0','0','0',''),(47,'July, 2022','2022-07-20','08:05','12:19','12:36','05:29','0','0','8',''),(47,'July, 2022','2022-07-19','08:04','12:23','12:33','05:09','0','0','8',''),(47,'July, 2022','2022-07-18','08:00','12:17','01:08','05:04','0','0','8',''),(47,'July, 2022','2022-07-23','','','','','0','0','0',''),(47,'July, 2022','2022-07-28','','','','','0','0','0',''),(47,'July, 2022','2022-07-27','','','','','0','0','0',''),(48,'July, 2022','2022-07-16','','','','','0','0','0',''),(48,'July, 2022','2022-07-26','08:00','','','','0','0','0',''),(48,'July, 2022','2022-07-25','07:52','12:02','12:51','05:13','0','0','8',''),(48,'July, 2022','2022-07-22','07:58','12:03','12:59','05:23','0','0','8',''),(48,'July, 2022','2022-07-29','','','','','0','0','0',''),(48,'July, 2022','2022-07-21','07:58','12:05','12:56','05:00','0','0','8',''),(48,'July, 2022','2022-07-31','','','','','0','0','0',''),(48,'July, 2022','2022-07-30','','','','','0','0','0',''),(48,'July, 2022','2022-07-17','','','','','0','0','0',''),(48,'July, 2022','2022-07-24','','','','','0','0','0',''),(48,'July, 2022','2022-07-20','07:58','12:00','12:15','05:19','0','0','8',''),(48,'July, 2022','2022-07-19','07:57','12:28','12:39','05:10','0','0','8',''),(48,'July, 2022','2022-07-18','07:58','12:02','12:14','05:24','0','0','8',''),(48,'July, 2022','2022-07-23','','','','','0','0','0',''),(48,'July, 2022','2022-07-28','','','','','0','0','0',''),(48,'July, 2022','2022-07-27','','','','','0','0','0',''),(49,'July, 2022','2022-07-16','','','','','0','0','0',''),(49,'July, 2022','2022-07-26','07:27','','','','0','0','0',''),(49,'July, 2022','2022-07-25','07:36','','','05:06','0','0','0',''),(49,'July, 2022','2022-07-22','07:35','','','05:04','0','0','0',''),(49,'July, 2022','2022-07-29','','','','','0','0','0',''),(49,'July, 2022','2022-07-21','07:20','12:15','','05:07','0','0','4',''),(49,'July, 2022','2022-07-31','','','','','0','0','0',''),(49,'July, 2022','2022-07-30','','','','','0','0','0',''),(49,'July, 2022','2022-07-17','','','','','0','0','0',''),(49,'July, 2022','2022-07-24','','','','','0','0','0',''),(49,'July, 2022','2022-07-20','07:17','','05:14','','0','0','0',''),(49,'July, 2022','2022-07-19','07:29','','','05:08','0','0','0',''),(49,'July, 2022','2022-07-18','07:34','','','05:14','0','0','0',''),(49,'July, 2022','2022-07-23','','','','','0','0','0',''),(49,'July, 2022','2022-07-28','','','','','0','0','0',''),(49,'July, 2022','2022-07-27','','','','','0','0','0',''),(50,'July, 2022','2022-07-16','','','','','0','0','0',''),(50,'July, 2022','2022-07-26','','','','','0','0','0',''),(50,'July, 2022','2022-07-25','08:32','12:05','12:19','07:39','1','0','7',''),(50,'July, 2022','2022-07-22','','','','','0','0','0',''),(50,'July, 2022','2022-07-29','','','','','0','0','0',''),(50,'July, 2022','2022-07-21','','','','','0','0','0',''),(50,'July, 2022','2022-07-31','','','','','0','0','0',''),(50,'July, 2022','2022-07-30','','','','','0','0','0',''),(50,'July, 2022','2022-07-17','','','','','0','0','0',''),(50,'July, 2022','2022-07-24','','','','','0','0','0',''),(50,'July, 2022','2022-07-20','08:29','12:00','12:35','05:30','0','0','8',''),(50,'July, 2022','2022-07-19','08:18','','','05:10','0','0','0',''),(50,'July, 2022','2022-07-18','','','','','0','0','0',''),(50,'July, 2022','2022-07-23','','','','','0','0','0',''),(50,'July, 2022','2022-07-28','','','','','0','0','0',''),(50,'July, 2022','2022-07-27','','','','','0','0','0',''),(51,'July, 2022','2022-07-16','','','','','0','0','0',''),(51,'July, 2022','2022-07-26','08:16','','','','0','0','0',''),(51,'July, 2022','2022-07-25','08:06','12:29','','05:07','0','0','4',''),(51,'July, 2022','2022-07-22','08:06','12:08','12:19','05:21','0','0','8',''),(51,'July, 2022','2022-07-29','','','','','0','0','0',''),(51,'July, 2022','2022-07-21','08:27','12:13','12:24','05:03','0','0','8',''),(51,'July, 2022','2022-07-31','','','','','0','0','0',''),(51,'July, 2022','2022-07-30','','','','','0','0','0',''),(51,'July, 2022','2022-07-17','','','','','0','0','0',''),(51,'July, 2022','2022-07-24','','','','','0','0','0',''),(51,'July, 2022','2022-07-20','08:26','12:27','05:14','','0','0','4',''),(51,'July, 2022','2022-07-19','08:12','12:13','12:29','05:12','0','0','8',''),(51,'July, 2022','2022-07-18','','','','','0','0','0',''),(51,'July, 2022','2022-07-23','','','','','0','0','0',''),(51,'July, 2022','2022-07-28','','','','','0','0','0',''),(51,'July, 2022','2022-07-27','','','','','0','0','0',''),(52,'July, 2022','2022-07-16','','','','','0','0','0',''),(52,'July, 2022','2022-07-26','07:23','','','','0','0','0',''),(52,'July, 2022','2022-07-25','08:28','12:07','12:22','05:23','0','0','8',''),(52,'July, 2022','2022-07-22','07:29','12:19','','05:52','0','0','4',''),(52,'July, 2022','2022-07-29','','','','','0','0','0',''),(52,'July, 2022','2022-07-21','','12:04','12:53','05:30','0','0','4',''),(52,'July, 2022','2022-07-31','','','','','0','0','0',''),(52,'July, 2022','2022-07-30','','','','','0','0','0',''),(52,'July, 2022','2022-07-17','','','','','0','0','0',''),(52,'July, 2022','2022-07-24','','','','','0','0','0',''),(52,'July, 2022','2022-07-20','07:11','12:02','12:38','05:28','0','0','8',''),(52,'July, 2022','2022-07-19','07:13','12:29','12:44','05:16','0','0','8',''),(52,'July, 2022','2022-07-18','07:34','12:20','12:30','05:03','0','0','8',''),(52,'July, 2022','2022-07-23','','','','','0','0','0',''),(52,'July, 2022','2022-07-28','','','','','0','0','0',''),(52,'July, 2022','2022-07-27','','','','','0','0','0',''),(53,'July, 2022','2022-07-16','','','','','0','0','0',''),(53,'July, 2022','2022-07-26','05:26','','','','0','0','0',''),(53,'July, 2022','2022-07-25','05:37','12:12','12:22','05:00','0','0','8',''),(53,'July, 2022','2022-07-22','','','','','0','0','0',''),(53,'July, 2022','2022-07-29','','','','','0','0','0',''),(53,'July, 2022','2022-07-21','05:37','12:06','12:19','05:01','0','0','8',''),(53,'July, 2022','2022-07-31','','','','','0','0','0',''),(53,'July, 2022','2022-07-30','','','','','0','0','0',''),(53,'July, 2022','2022-07-17','','','','','0','0','0',''),(53,'July, 2022','2022-07-24','','','','','0','0','0',''),(53,'July, 2022','2022-07-20','05:17','12:01','12:13','05:00','0','0','8',''),(53,'July, 2022','2022-07-19','05:29','12:02','12:19','05:00','0','0','8',''),(53,'July, 2022','2022-07-18','05:20','12:09','12:27','05:00','0','0','8',''),(53,'July, 2022','2022-07-23','','','','','0','0','0',''),(53,'July, 2022','2022-07-28','','','','','0','0','0',''),(53,'July, 2022','2022-07-27','','','','','0','0','0',''),(54,'July, 2022','2022-07-16','','','','','0','0','0',''),(54,'July, 2022','2022-07-26','08:16','','','','0','0','0',''),(54,'July, 2022','2022-07-25','08:06','11:50','01:04','05:00','0','0','8',''),(54,'July, 2022','2022-07-22','','','','','0','0','0',''),(54,'July, 2022','2022-07-29','','','','','0','0','0',''),(54,'July, 2022','2022-07-21','08:12','12:00','01:01','05:00','0','0','8',''),(54,'July, 2022','2022-07-31','','','','','0','0','0',''),(54,'July, 2022','2022-07-30','','','','','0','0','0',''),(54,'July, 2022','2022-07-17','','','','','0','0','0',''),(54,'July, 2022','2022-07-24','','','','','0','0','0',''),(54,'July, 2022','2022-07-20','08:18','12:00','01:03','05:00','0','0','8',''),(54,'July, 2022','2022-07-19','08:19','11:43','01:00','05:00','0','0','7',''),(54,'July, 2022','2022-07-18','08:13','12:00','01:06','05:00','0','0','8',''),(54,'July, 2022','2022-07-23','','','','','0','0','0',''),(54,'July, 2022','2022-07-28','','','','','0','0','0',''),(54,'July, 2022','2022-07-27','','','','','0','0','0',''),(55,'July, 2022','2022-07-16','','','','','0','0','0',''),(55,'July, 2022','2022-07-26','08:03','','','','0','0','0',''),(55,'July, 2022','2022-07-25','08:16','12:04','01:15','05:03','1','0','7',''),(55,'July, 2022','2022-07-22','08:10','12:02','01:21','05:05','1','0','7',''),(55,'July, 2022','2022-07-29','','','','','0','0','0',''),(55,'July, 2022','2022-07-21','','','','','0','0','0',''),(55,'July, 2022','2022-07-31','','','','','0','0','0',''),(55,'July, 2022','2022-07-30','','','','','0','0','0',''),(55,'July, 2022','2022-07-17','','','','','0','0','0',''),(55,'July, 2022','2022-07-24','','','','','0','0','0',''),(55,'July, 2022','2022-07-20','08:23','12:00','01:07','05:02','0','0','8',''),(55,'July, 2022','2022-07-19','08:12','12:01','01:09','05:03','0','0','8',''),(55,'July, 2022','2022-07-18','08:23','12:00','12:58','05:14','0','0','8',''),(55,'July, 2022','2022-07-23','','','','','0','0','0',''),(55,'July, 2022','2022-07-28','','','','','0','0','0',''),(55,'July, 2022','2022-07-27','','','','','0','0','0',''),(56,'July, 2022','2022-07-16','','','','','0','0','0',''),(56,'July, 2022','2022-07-26','08:03','','','','0','0','0',''),(56,'July, 2022','2022-07-25','08:16','12:02','01:15','05:26','1','0','7',''),(56,'July, 2022','2022-07-22','08:10','12:00','01:21','05:00','1','0','7',''),(56,'July, 2022','2022-07-29','','','','','0','0','0',''),(56,'July, 2022','2022-07-21','07:57','12:00','01:02','05:00','0','0','8',''),(56,'July, 2022','2022-07-31','','','','','0','0','0',''),(56,'July, 2022','2022-07-30','','','','','0','0','0',''),(56,'July, 2022','2022-07-17','','','','','0','0','0',''),(56,'July, 2022','2022-07-24','','','','','0','0','0',''),(56,'July, 2022','2022-07-20','08:23','12:00','01:07','','0','0','4',''),(56,'July, 2022','2022-07-19','08:12','12:00','01:09','05:05','0','0','8',''),(56,'July, 2022','2022-07-18','08:22','12:01','12:58','05:17','0','0','8',''),(56,'July, 2022','2022-07-23','','','','','0','0','0',''),(56,'July, 2022','2022-07-28','','','','','0','0','0',''),(56,'July, 2022','2022-07-27','','','','','0','0','0',''),(57,'July, 2022','2022-07-16','','','','','0','0','0',''),(57,'July, 2022','2022-07-26','','','','','0','0','0',''),(57,'July, 2022','2022-07-25','08:26','12:20','12:31','05:27','0','0','8',''),(57,'July, 2022','2022-07-22','','','','','0','0','0',''),(57,'July, 2022','2022-07-29','','','','','0','0','0',''),(57,'July, 2022','2022-07-21','09:16','12:00','12:22','05:00','1','0','7',''),(57,'July, 2022','2022-07-31','','','','','0','0','0',''),(57,'July, 2022','2022-07-30','','','','','0','0','0',''),(57,'July, 2022','2022-07-17','','','','','0','0','0',''),(57,'July, 2022','2022-07-24','','','','','0','0','0',''),(57,'July, 2022','2022-07-20','08:35','12:10','12:20','05:31','1','0','7',''),(57,'July, 2022','2022-07-19','08:01','12:20','12:31','05:22','0','0','8',''),(57,'July, 2022','2022-07-18','09:16','12:19','12:31','05:40','1','0','7',''),(57,'July, 2022','2022-07-23','','','','','0','0','0',''),(57,'July, 2022','2022-07-28','','','','','0','0','0',''),(57,'July, 2022','2022-07-27','','','','','0','0','0',''),(58,'July, 2022','2022-07-16','','','','06:04','0','0','0',''),(58,'July, 2022','2022-07-26','','','','','0','0','0',''),(58,'July, 2022','2022-07-25','08:48','12:16','12:27','','1','0','3',''),(58,'July, 2022','2022-07-22','08:19','','12:13','05:35','0','0','4',''),(58,'July, 2022','2022-07-29','','','','','0','0','0',''),(58,'July, 2022','2022-07-21','08:45','','','05:10','0','0','0',''),(58,'July, 2022','2022-07-31','','','','','0','0','0',''),(58,'July, 2022','2022-07-30','','','','','0','0','0',''),(58,'July, 2022','2022-07-17','','','','','0','0','0',''),(58,'July, 2022','2022-07-24','','','','','0','0','0',''),(58,'July, 2022','2022-07-20','08:47','12:02','12:18','05:58','1','0','7',''),(58,'July, 2022','2022-07-19','08:58','12:47','01:00','05:52','1','0','7',''),(58,'July, 2022','2022-07-18','09:03','12:23','12:33','','1','0','3',''),(58,'July, 2022','2022-07-23','','','','','0','0','0',''),(58,'July, 2022','2022-07-28','','','','','0','0','0',''),(58,'July, 2022','2022-07-27','','','','','0','0','0',''),(59,'July, 2022','2022-07-16','','','','','0','0','0',''),(59,'July, 2022','2022-07-26','','','','','0','0','0',''),(59,'July, 2022','2022-07-25','08:26','12:07','12:18','05:11','0','0','8',''),(59,'July, 2022','2022-07-22','08:10','12:01','12:12','','0','0','4',''),(59,'July, 2022','2022-07-29','','','','','0','0','0',''),(59,'July, 2022','2022-07-21','08:13','','01:11','05:25','0','0','4',''),(59,'July, 2022','2022-07-31','','','','','0','0','0',''),(59,'July, 2022','2022-07-30','','','','','0','0','0',''),(59,'July, 2022','2022-07-17','','','','','0','0','0',''),(59,'July, 2022','2022-07-24','','','','','0','0','0',''),(59,'July, 2022','2022-07-20','08:28','12:00','12:11','05:22','0','0','8',''),(59,'July, 2022','2022-07-19','08:43','12:00','12:11','05:05','1','0','7',''),(59,'July, 2022','2022-07-18','08:23','12:00','12:11','05:10','0','0','8',''),(59,'July, 2022','2022-07-23','','','','','0','0','0',''),(59,'July, 2022','2022-07-28','','','','','0','0','0',''),(59,'July, 2022','2022-07-27','','','','','0','0','0',''),(60,'July, 2022','2022-07-16','','','','','0','0','0',''),(60,'July, 2022','2022-07-26','05:30','','','','0','0','0',''),(60,'July, 2022','2022-07-25','06:01','12:00','12:11','05:00','0','0','8',''),(60,'July, 2022','2022-07-22','05:56','12:00','12:12','05:00','0','0','8',''),(60,'July, 2022','2022-07-29','','','','','0','0','0',''),(60,'July, 2022','2022-07-21','06:02','12:03','12:27','05:00','0','0','8',''),(60,'July, 2022','2022-07-31','','','','','0','0','0',''),(60,'July, 2022','2022-07-30','','','','','0','0','0',''),(60,'July, 2022','2022-07-17','','','','','0','0','0',''),(60,'July, 2022','2022-07-24','','','','','0','0','0',''),(60,'July, 2022','2022-07-20','05:53','12:00','12:11','05:00','0','0','8',''),(60,'July, 2022','2022-07-19','06:01','12:00','12:14','05:00','0','0','8',''),(60,'July, 2022','2022-07-18','05:53','12:01','12:11','05:00','0','0','8',''),(60,'July, 2022','2022-07-23','','','','','0','0','0',''),(60,'July, 2022','2022-07-28','','','','','0','0','0',''),(60,'July, 2022','2022-07-27','','','','','0','0','0',''),(61,'July, 2022','2022-07-16','','','','','0','0','0',''),(61,'July, 2022','2022-07-26','07:43','','','','0','0','0',''),(61,'July, 2022','2022-07-25','07:11','12:06','12:17','05:04','0','0','8',''),(61,'July, 2022','2022-07-22','07:22','12:14','','05:00','0','0','8',''),(61,'July, 2022','2022-07-29','','','','','0','0','0',''),(61,'July, 2022','2022-07-21','07:17','12:23','12:35','05:14','0','0','8',''),(61,'July, 2022','2022-07-31','','','','','0','0','0',''),(61,'July, 2022','2022-07-30','','','','','0','0','0',''),(61,'July, 2022','2022-07-17','','','','','0','0','0',''),(61,'July, 2022','2022-07-24','','','','','0','0','0',''),(61,'July, 2022','2022-07-20','','12:37','12:48','06:07','0','0','4',''),(61,'July, 2022','2022-07-19','07:05','12:07','12:18','05:15','0','0','8',''),(61,'July, 2022','2022-07-18','06:52','12:00','12:17','05:15','0','0','8',''),(61,'July, 2022','2022-07-23','','','','','0','0','0',''),(61,'July, 2022','2022-07-28','','','','','0','0','0',''),(61,'July, 2022','2022-07-27','','','','','0','0','0',''),(62,'July, 2022','2022-07-16','','','','','0','0','0',''),(62,'July, 2022','2022-07-26','','','','','0','0','0',''),(62,'July, 2022','2022-07-25','','','','','0','0','0',''),(62,'July, 2022','2022-07-22','','','','','0','0','0',''),(62,'July, 2022','2022-07-29','','','','','0','0','0',''),(62,'July, 2022','2022-07-21','09:15','','01:15','','0','0','0',''),(62,'July, 2022','2022-07-31','','','','','0','0','0',''),(62,'July, 2022','2022-07-30','','','','','0','0','0',''),(62,'July, 2022','2022-07-17','','','','','0','0','0',''),(62,'July, 2022','2022-07-24','','','','','0','0','0',''),(62,'July, 2022','2022-07-20','','','','','0','0','0',''),(62,'July, 2022','2022-07-19','09:20','','','05:11','0','0','0',''),(62,'July, 2022','2022-07-18','09:41','','','05:38','0','0','0',''),(62,'July, 2022','2022-07-23','','','','','0','0','0',''),(62,'July, 2022','2022-07-28','','','','','0','0','0',''),(62,'July, 2022','2022-07-27','','','','','0','0','0',''),(63,'July, 2022','2022-07-16','09:57','','','04:54','0','0','0',''),(63,'July, 2022','2022-07-26','08:10','','','','0','0','0',''),(63,'July, 2022','2022-07-25','08:08','12:21','01:01','05:36','0','0','8',''),(63,'July, 2022','2022-07-22','08:02','12:16','12:41','05:18','0','0','8',''),(63,'July, 2022','2022-07-29','','','','','0','0','0',''),(63,'July, 2022','2022-07-21','08:04','12:51','01:03','06:00','0','0','8',''),(63,'July, 2022','2022-07-31','','','','','0','0','0',''),(63,'July, 2022','2022-07-30','','','','','0','0','0',''),(63,'July, 2022','2022-07-17','','','','','0','0','0',''),(63,'July, 2022','2022-07-24','','','','','0','0','0',''),(63,'July, 2022','2022-07-20','08:05','12:22','12:45','05:37','0','0','8',''),(63,'July, 2022','2022-07-19','08:09','12:10','12:42','05:41','0','0','8',''),(63,'July, 2022','2022-07-18','07:59','12:09','12:40','05:25','0','0','8',''),(63,'July, 2022','2022-07-23','','','','','0','0','0',''),(63,'July, 2022','2022-07-28','','','','','0','0','0',''),(63,'July, 2022','2022-07-27','','','','','0','0','0',''),(64,'July, 2022','2022-07-16','','','','','0','0','0',''),(64,'July, 2022','2022-07-26','07:46','','','','0','0','0',''),(64,'July, 2022','2022-07-25','07:50','12:10','','05:46','0','0','4',''),(64,'July, 2022','2022-07-22','07:33','12:14','01:13','09:05','0','0','8',''),(64,'July, 2022','2022-07-29','','','','','0','0','0',''),(64,'July, 2022','2022-07-21','07:46','12:05','12:18','05:13','0','0','8',''),(64,'July, 2022','2022-07-31','','','','','0','0','0',''),(64,'July, 2022','2022-07-30','','','','','0','0','0',''),(64,'July, 2022','2022-07-17','','','','','0','0','0',''),(64,'July, 2022','2022-07-24','','','','','0','0','0',''),(64,'July, 2022','2022-07-20','07:52','12:14','12:54','05:54','0','0','8',''),(64,'July, 2022','2022-07-19','07:45','12:04','12:38','05:58','0','0','8',''),(64,'July, 2022','2022-07-18','07:45','12:08','12:38','05:53','0','0','8',''),(64,'July, 2022','2022-07-23','','','','','0','0','0',''),(64,'July, 2022','2022-07-28','','','','','0','0','0',''),(64,'July, 2022','2022-07-27','','','','','0','0','0',''),(66,'July, 2022','2022-07-16','','','','','0','0','0',''),(66,'July, 2022','2022-07-26','08:07','','','','0','0','0',''),(66,'July, 2022','2022-07-25','08:12','12:03','01:22','05:01','1','0','7',''),(66,'July, 2022','2022-07-22','07:49','12:02','01:06','05:09','0','0','8',''),(66,'July, 2022','2022-07-29','','','','','0','0','0',''),(66,'July, 2022','2022-07-21','07:54','12:03','01:06','05:06','0','0','8',''),(66,'July, 2022','2022-07-31','','','','','0','0','0',''),(66,'July, 2022','2022-07-30','','','','','0','0','0',''),(66,'July, 2022','2022-07-17','','','','','0','0','0',''),(66,'July, 2022','2022-07-24','','','','','0','0','0',''),(66,'July, 2022','2022-07-20','08:04','12:01','','06:19','0','0','4',''),(66,'July, 2022','2022-07-19','07:55','12:02','12:57','05:06','0','0','8',''),(66,'July, 2022','2022-07-18','07:59','12:00','12:53','05:49','0','0','8',''),(66,'July, 2022','2022-07-23','','','','','0','0','0',''),(66,'July, 2022','2022-07-28','','','','','0','0','0',''),(66,'July, 2022','2022-07-27','','','','','0','0','0',''),(67,'July, 2022','2022-07-16','','','','','0','0','0',''),(67,'July, 2022','2022-07-26','07:08','','','','0','0','0',''),(67,'July, 2022','2022-07-25','07:24','12:02','12:45','05:40','0','0','8',''),(67,'July, 2022','2022-07-22','07:08','11:59','12:52','05:24','0','0','8',''),(67,'July, 2022','2022-07-29','','','','','0','0','0',''),(67,'July, 2022','2022-07-21','','','','05:24','0','0','0',''),(67,'July, 2022','2022-07-31','','','','','0','0','0',''),(67,'July, 2022','2022-07-30','','','','','0','0','0',''),(67,'July, 2022','2022-07-17','','','','','0','0','0',''),(67,'July, 2022','2022-07-24','','','','','0','0','0',''),(67,'July, 2022','2022-07-20','07:25','12:52','','05:24','0','0','8',''),(67,'July, 2022','2022-07-19','07:46','11:59','12:53','05:06','0','0','8',''),(67,'July, 2022','2022-07-18','07:23','12:05','12:53','05:26','0','0','8',''),(67,'July, 2022','2022-07-23','','','','','0','0','0',''),(67,'July, 2022','2022-07-28','','','','','0','0','0',''),(67,'July, 2022','2022-07-27','','','','','0','0','0',''),(68,'July, 2022','2022-07-16','','','','','0','0','0',''),(68,'July, 2022','2022-07-26','','','','','0','0','0',''),(68,'July, 2022','2022-07-25','08:09','12:05','12:19','05:48','0','0','8',''),(68,'July, 2022','2022-07-22','07:58','12:55','01:07','05:27','0','0','8',''),(68,'July, 2022','2022-07-29','','','','','0','0','0',''),(68,'July, 2022','2022-07-21','08:31','12:04','12:22','06:23','1','0','7',''),(68,'July, 2022','2022-07-31','','','','','0','0','0',''),(68,'July, 2022','2022-07-30','','','','','0','0','0',''),(68,'July, 2022','2022-07-17','','','','','0','0','0',''),(68,'July, 2022','2022-07-24','','','','','0','0','0',''),(68,'July, 2022','2022-07-20','08:18','12:03','01:04','05:42','0','0','8',''),(68,'July, 2022','2022-07-19','08:00','12:03','01:01','05:08','0','0','8',''),(68,'July, 2022','2022-07-18','','','12:01','05:40','0','0','4',''),(68,'July, 2022','2022-07-23','','','','','0','0','0',''),(68,'July, 2022','2022-07-28','','','','','0','0','0',''),(68,'July, 2022','2022-07-27','','','','','0','0','0',''),(69,'July, 2022','2022-07-16','','','','','0','0','0',''),(69,'July, 2022','2022-07-26','','','','','0','0','0',''),(69,'July, 2022','2022-07-25','','12:41','12:54','05:26','0','0','4',''),(69,'July, 2022','2022-07-22','07:42','12:19','12:29','05:19','0','0','8',''),(69,'July, 2022','2022-07-29','','','','','0','0','0',''),(69,'July, 2022','2022-07-21','08:15','12:40','12:53','05:09','0','0','8',''),(69,'July, 2022','2022-07-31','','','','','0','0','0',''),(69,'July, 2022','2022-07-30','','','','','0','0','0',''),(69,'July, 2022','2022-07-17','','','','','0','0','0',''),(69,'July, 2022','2022-07-24','','','','','0','0','0',''),(69,'July, 2022','2022-07-20','07:31','12:51','01:08','','0','0','4',''),(69,'July, 2022','2022-07-19','07:17','','','','0','0','0',''),(69,'July, 2022','2022-07-18','06:32','12:18','12:30','05:42','0','0','8',''),(69,'July, 2022','2022-07-23','','','','','0','0','0',''),(69,'July, 2022','2022-07-28','','','','','0','0','0',''),(69,'July, 2022','2022-07-27','','','','','0','0','0',''),(70,'July, 2022','2022-07-16','','','','','0','0','0',''),(70,'July, 2022','2022-07-26','','','','','0','0','0',''),(70,'July, 2022','2022-07-25','09:16','12:13','12:29','02:24','1','3','4',''),(70,'July, 2022','2022-07-22','08:57','12:04','12:18','05:11','1','0','7',''),(70,'July, 2022','2022-07-29','','','','','0','0','0',''),(70,'July, 2022','2022-07-21','08:43','12:06','12:21','05:16','1','0','7',''),(70,'July, 2022','2022-07-31','','','','','0','0','0',''),(70,'July, 2022','2022-07-30','','','','','0','0','0',''),(70,'July, 2022','2022-07-17','','','','','0','0','0',''),(70,'July, 2022','2022-07-24','','','','','0','0','0',''),(70,'July, 2022','2022-07-20','08:36','12:01','12:22','05:03','1','0','7',''),(70,'July, 2022','2022-07-19','08:51','12:00','12:12','05:02','1','0','7',''),(70,'July, 2022','2022-07-18','08:45','12:12','12:24','05:01','1','0','7',''),(70,'July, 2022','2022-07-23','','','','','0','0','0',''),(70,'July, 2022','2022-07-28','','','','','0','0','0',''),(70,'July, 2022','2022-07-27','','','','','0','0','0',''),(71,'July, 2022','2022-07-16','','','','','0','0','0',''),(71,'July, 2022','2022-07-26','07:43','','','','0','0','0',''),(71,'July, 2022','2022-07-25','07:34','12:46','01:01','05:08','0','0','8',''),(71,'July, 2022','2022-07-22','','','','','0','0','0',''),(71,'July, 2022','2022-07-29','','','','','0','0','0',''),(71,'July, 2022','2022-07-21','','','','','0','0','0',''),(71,'July, 2022','2022-07-31','','','','','0','0','0',''),(71,'July, 2022','2022-07-30','','','','','0','0','0',''),(71,'July, 2022','2022-07-17','','','','','0','0','0',''),(71,'July, 2022','2022-07-24','','','','','0','0','0',''),(71,'July, 2022','2022-07-20','','','','','0','0','0',''),(71,'July, 2022','2022-07-19','','','','','0','0','0',''),(71,'July, 2022','2022-07-18','','','','','0','0','0',''),(71,'July, 2022','2022-07-23','','','','','0','0','0',''),(71,'July, 2022','2022-07-28','','','','','0','0','0',''),(71,'July, 2022','2022-07-27','','','','','0','0','0',''),(72,'July, 2022','2022-07-16','','','','','0','0','0',''),(72,'July, 2022','2022-07-26','08:02','','','','0','0','0',''),(72,'July, 2022','2022-07-25','08:04','12:06','12:17','05:03','0','0','8',''),(72,'July, 2022','2022-07-22','','','','','0','0','0',''),(72,'July, 2022','2022-07-29','','','','','0','0','0',''),(72,'July, 2022','2022-07-21','07:44','12:24','12:35','05:14','0','0','8',''),(72,'July, 2022','2022-07-31','','','','','0','0','0',''),(72,'July, 2022','2022-07-30','','','','','0','0','0',''),(72,'July, 2022','2022-07-17','','','','','0','0','0',''),(72,'July, 2022','2022-07-24','','','','','0','0','0',''),(72,'July, 2022','2022-07-20','07:26','12:37','12:48','05:56','0','0','8',''),(72,'July, 2022','2022-07-19','07:54','12:07','12:18','05:18','0','0','8',''),(72,'July, 2022','2022-07-18','07:57','12:00','12:17','05:07','0','0','8',''),(72,'July, 2022','2022-07-23','','','','','0','0','0',''),(72,'July, 2022','2022-07-28','','','','','0','0','0',''),(72,'July, 2022','2022-07-27','','','','','0','0','0',''),(73,'July, 2022','2022-07-16','','','','','0','0','0',''),(73,'July, 2022','2022-07-26','08:22','','','','0','0','0',''),(73,'July, 2022','2022-07-25','09:06','12:03','12:47','08:33','1','0','7',''),(73,'July, 2022','2022-07-22','08:36','12:38','12:52','07:22','1','0','7',''),(73,'July, 2022','2022-07-29','','','','','0','0','0',''),(73,'July, 2022','2022-07-21','08:41','12:41','12:51','08:50','1','0','7',''),(73,'July, 2022','2022-07-31','','','','','0','0','0',''),(73,'July, 2022','2022-07-30','','','','','0','0','0',''),(73,'July, 2022','2022-07-17','','','','','0','0','0',''),(73,'July, 2022','2022-07-24','','','','','0','0','0',''),(73,'July, 2022','2022-07-20','08:51','12:32','12:43','06:00','1','0','7',''),(73,'July, 2022','2022-07-19','08:33','12:18','12:30','05:45','1','0','7',''),(73,'July, 2022','2022-07-18','09:04','12:21','01:17','07:21','1','0','7',''),(73,'July, 2022','2022-07-23','','','','','0','0','0',''),(73,'July, 2022','2022-07-28','','','','','0','0','0',''),(73,'July, 2022','2022-07-27','','','','','0','0','0',''),(74,'July, 2022','2022-07-16','','','','','0','0','0',''),(74,'July, 2022','2022-07-26','08:12','','','','0','0','0',''),(74,'July, 2022','2022-07-25','08:14','12:46','01:00','08:32','0','0','8',''),(74,'July, 2022','2022-07-22','08:38','12:35','12:52','08:25','1','0','7',''),(74,'July, 2022','2022-07-29','','','','','0','0','0',''),(74,'July, 2022','2022-07-21','08:42','12:40','12:53','08:50','1','0','7',''),(74,'July, 2022','2022-07-31','','','','','0','0','0',''),(74,'July, 2022','2022-07-30','','','','','0','0','0',''),(74,'July, 2022','2022-07-17','','','','','0','0','0',''),(74,'July, 2022','2022-07-24','','','','','0','0','0',''),(74,'July, 2022','2022-07-20','08:52','12:37','12:48','06:27','1','0','7',''),(74,'July, 2022','2022-07-19','08:31','12:32','12:51','06:28','1','0','7',''),(74,'July, 2022','2022-07-18','08:03','12:18','12:31','06:31','0','0','8',''),(74,'July, 2022','2022-07-23','','','','','0','0','0',''),(74,'July, 2022','2022-07-28','','','','','0','0','0',''),(74,'July, 2022','2022-07-27','','','','','0','0','0',''),(75,'July, 2022','2022-07-16','','','','','0','0','0',''),(75,'July, 2022','2022-07-26','08:10','','','','0','0','0',''),(75,'July, 2022','2022-07-25','08:08','','','05:48','0','0','0',''),(75,'July, 2022','2022-07-22','08:02','12:08','12:22','05:13','0','0','8',''),(75,'July, 2022','2022-07-29','','','','','0','0','0',''),(75,'July, 2022','2022-07-21','08:04','12:25','12:49','05:23','0','0','8',''),(75,'July, 2022','2022-07-31','','','','','0','0','0',''),(75,'July, 2022','2022-07-30','','','','','0','0','0',''),(75,'July, 2022','2022-07-17','','','','','0','0','0',''),(75,'July, 2022','2022-07-24','','','','','0','0','0',''),(75,'July, 2022','2022-07-20','08:05','12:14','12:48','05:30','0','0','8',''),(75,'July, 2022','2022-07-19','08:09','12:10','12:38','06:04','0','0','8',''),(75,'July, 2022','2022-07-18','07:59','12:08','12:48','05:39','0','0','8',''),(75,'July, 2022','2022-07-23','','','','','0','0','0',''),(75,'July, 2022','2022-07-28','','','','','0','0','0',''),(75,'July, 2022','2022-07-27','','','','','0','0','0',''),(76,'July, 2022','2022-07-16','07:57','','','05:58','0','0','0',''),(76,'July, 2022','2022-07-26','08:04','','','','0','0','0',''),(76,'July, 2022','2022-07-25','07:55','12:03','12:15','05:38','0','0','8',''),(76,'July, 2022','2022-07-22','07:59','12:20','12:31','05:06','0','0','8',''),(76,'July, 2022','2022-07-29','','','','','0','0','0',''),(76,'July, 2022','2022-07-21','07:47','12:05','12:16','05:14','0','0','8',''),(76,'July, 2022','2022-07-31','','','','','0','0','0',''),(76,'July, 2022','2022-07-30','','','','','0','0','0',''),(76,'July, 2022','2022-07-17','07:53','','','','0','0','0',''),(76,'July, 2022','2022-07-24','','','','','0','0','0',''),(76,'July, 2022','2022-07-20','07:57','12:08','12:19','05:26','0','0','8',''),(76,'July, 2022','2022-07-19','07:51','12:02','12:13','05:24','0','0','8',''),(76,'July, 2022','2022-07-18','08:03','','','08:01','0','0','0',''),(76,'July, 2022','2022-07-23','','','','','0','0','0',''),(76,'July, 2022','2022-07-28','','','','','0','0','0',''),(76,'July, 2022','2022-07-27','','','','','0','0','0',''),(77,'July, 2022','2022-07-16','','','','','0','0','0',''),(77,'July, 2022','2022-07-26','07:33','','','','0','0','0',''),(77,'July, 2022','2022-07-25','07:10','12:43','12:55','05:16','0','0','8',''),(77,'July, 2022','2022-07-22','07:51','12:27','12:38','05:01','0','0','8',''),(77,'July, 2022','2022-07-29','','','','','0','0','0',''),(77,'July, 2022','2022-07-21','','12:23','12:38','05:00','0','0','4',''),(77,'July, 2022','2022-07-31','','','','','0','0','0',''),(77,'July, 2022','2022-07-30','','','','','0','0','0',''),(77,'July, 2022','2022-07-17','','','','','0','0','0',''),(77,'July, 2022','2022-07-24','','','','','0','0','0',''),(77,'July, 2022','2022-07-20','07:23','12:35','12:47','05:07','0','0','8',''),(77,'July, 2022','2022-07-19','07:58','12:39','12:49','05:04','0','0','8',''),(77,'July, 2022','2022-07-18','07:02','12:33','12:46','05:04','0','0','8',''),(77,'July, 2022','2022-07-23','','','','','0','0','0',''),(77,'July, 2022','2022-07-28','','','','','0','0','0',''),(77,'July, 2022','2022-07-27','','','','','0','0','0',''),(78,'July, 2022','2022-07-16','','','','','0','0','0',''),(78,'July, 2022','2022-07-26','','','','','0','0','0',''),(78,'July, 2022','2022-07-25','07:24','12:06','01:27','05:02','0','0','8',''),(78,'July, 2022','2022-07-22','06:51','12:07','01:32','05:01','1','0','7',''),(78,'July, 2022','2022-07-29','','','','','0','0','0',''),(78,'July, 2022','2022-07-21','08:22','12:00','01:20','05:00','1','0','7',''),(78,'July, 2022','2022-07-31','','','','','0','0','0',''),(78,'July, 2022','2022-07-30','','','','','0','0','0',''),(78,'July, 2022','2022-07-17','','','','','0','0','0',''),(78,'July, 2022','2022-07-24','','','','','0','0','0',''),(78,'July, 2022','2022-07-20','06:09','12:02','01:17','05:07','0','0','8',''),(78,'July, 2022','2022-07-19','08:37','12:02','01:22','05:04','1','0','7',''),(78,'July, 2022','2022-07-18','08:48','12:01','01:21','05:04','1','0','7',''),(78,'July, 2022','2022-07-23','','','','','0','0','0',''),(78,'July, 2022','2022-07-28','','','','','0','0','0',''),(78,'July, 2022','2022-07-27','','','','','0','0','0',''),(79,'July, 2022','2022-07-16','','','','','0','0','0',''),(79,'July, 2022','2022-07-26','05:26','','','','0','0','0',''),(79,'July, 2022','2022-07-25','05:38','12:18','12:43','05:00','0','0','8',''),(79,'July, 2022','2022-07-22','05:21','12:06','12:36','05:04','0','0','8',''),(79,'July, 2022','2022-07-29','','','','','0','0','0',''),(79,'July, 2022','2022-07-21','','','','','0','0','0',''),(79,'July, 2022','2022-07-31','','','','','0','0','0',''),(79,'July, 2022','2022-07-30','','','','','0','0','0',''),(79,'July, 2022','2022-07-17','07:32','08:28','','','0','4','0',''),(79,'July, 2022','2022-07-24','','','','','0','0','0',''),(79,'July, 2022','2022-07-20','05:17','','','','0','0','0',''),(79,'July, 2022','2022-07-19','05:29','12:04','12:39','05:02','0','0','8',''),(79,'July, 2022','2022-07-18','05:19','12:02','12:35','05:04','0','0','8',''),(79,'July, 2022','2022-07-23','','','','','0','0','0',''),(79,'July, 2022','2022-07-28','','','','','0','0','0',''),(79,'July, 2022','2022-07-27','','','','','0','0','0',''),(80,'July, 2022','2022-07-16','','','','','0','0','0',''),(80,'July, 2022','2022-07-26','07:48','','','','0','0','0',''),(80,'July, 2022','2022-07-25','08:02','12:05','12:55','05:36','0','0','8',''),(80,'July, 2022','2022-07-22','07:52','12:11','01:12','05:03','0','0','8',''),(80,'July, 2022','2022-07-29','','','','','0','0','0',''),(80,'July, 2022','2022-07-21','07:52','12:15','12:52','05:06','0','0','8',''),(80,'July, 2022','2022-07-31','','','','','0','0','0',''),(80,'July, 2022','2022-07-30','','','','','0','0','0',''),(80,'July, 2022','2022-07-17','','','','','0','0','0',''),(80,'July, 2022','2022-07-24','','','','','0','0','0',''),(80,'July, 2022','2022-07-20','07:53','12:10','12:43','05:51','0','0','8',''),(80,'July, 2022','2022-07-19','07:50','12:03','12:22','05:45','0','0','8',''),(80,'July, 2022','2022-07-18','07:55','12:09','12:59','05:51','0','0','8',''),(80,'July, 2022','2022-07-23','','','','','0','0','0',''),(80,'July, 2022','2022-07-28','','','','','0','0','0',''),(80,'July, 2022','2022-07-27','','','','','0','0','0',''),(81,'July, 2022','2022-07-16','','','','','0','0','0',''),(81,'July, 2022','2022-07-26','08:22','','','','0','0','0',''),(81,'July, 2022','2022-07-25','08:24','','','07:01','0','0','0',''),(81,'July, 2022','2022-07-22','08:20','','','06:48','0','0','0',''),(81,'July, 2022','2022-07-29','','','','','0','0','0',''),(81,'July, 2022','2022-07-21','','','','06:48','0','0','0',''),(81,'July, 2022','2022-07-31','','','','','0','0','0',''),(81,'July, 2022','2022-07-30','','','','','0','0','0',''),(81,'July, 2022','2022-07-17','','','','','0','0','0',''),(81,'July, 2022','2022-07-24','','','','','0','0','0',''),(81,'July, 2022','2022-07-20','07:51','','','06:54','0','0','0',''),(81,'July, 2022','2022-07-19','08:10','','','06:27','0','0','0',''),(81,'July, 2022','2022-07-18','','12:10','01:09','06:43','0','0','4',''),(81,'July, 2022','2022-07-23','','','','','0','0','0',''),(81,'July, 2022','2022-07-28','','','','','0','0','0',''),(81,'July, 2022','2022-07-27','','','','','0','0','0',''),(82,'July, 2022','2022-07-16','','','','','0','0','0',''),(82,'July, 2022','2022-07-26','','','','','0','0','0',''),(82,'July, 2022','2022-07-25','09:54','12:05','12:57','06:18','2','0','6',''),(82,'July, 2022','2022-07-22','08:51','12:12','12:31','06:37','1','0','7',''),(82,'July, 2022','2022-07-29','','','','','0','0','0',''),(82,'July, 2022','2022-07-21','09:00','12:03','12:33','06:57','1','0','7',''),(82,'July, 2022','2022-07-31','','','','','0','0','0',''),(82,'July, 2022','2022-07-30','','','','','0','0','0',''),(82,'July, 2022','2022-07-17','','','','','0','0','0',''),(82,'July, 2022','2022-07-24','','','','','0','0','0',''),(82,'July, 2022','2022-07-20','09:46','12:05','12:48','07:46','2','0','6',''),(82,'July, 2022','2022-07-19','08:58','12:31','12:42','06:54','1','0','7',''),(82,'July, 2022','2022-07-18','09:51','12:06','12:39','05:51','2','0','6',''),(82,'July, 2022','2022-07-23','','','','','0','0','0',''),(82,'July, 2022','2022-07-28','','','','','0','0','0',''),(82,'July, 2022','2022-07-27','','','','','0','0','0',''),(83,'July, 2022','2022-07-16','','','','','0','0','0',''),(83,'July, 2022','2022-07-26','07:54','','','','0','0','0',''),(83,'July, 2022','2022-07-25','09:09','12:07','12:37','09:26','1','0','7',''),(83,'July, 2022','2022-07-22','07:55','12:06','01:32','04:51','1','0','7',''),(83,'July, 2022','2022-07-29','','','','','0','0','0',''),(83,'July, 2022','2022-07-21','08:32','12:00','12:39','04:37','1','0','7',''),(83,'July, 2022','2022-07-31','','','','','0','0','0',''),(83,'July, 2022','2022-07-30','','','','','0','0','0',''),(83,'July, 2022','2022-07-17','','','','','0','0','0',''),(83,'July, 2022','2022-07-24','','','','','0','0','0',''),(83,'July, 2022','2022-07-20','09:02','','12:47','04:17','0','1','3',''),(83,'July, 2022','2022-07-19','08:41','12:08','01:35','04:37','1','0','6',''),(83,'July, 2022','2022-07-18','08:41','12:13','12:39','04:50','1','0','7',''),(83,'July, 2022','2022-07-23','','','','','0','0','0',''),(83,'July, 2022','2022-07-28','','','','','0','0','0',''),(83,'July, 2022','2022-07-27','','','','','0','0','0',''),(84,'July, 2022','2022-07-16','','','','','0','0','0',''),(84,'July, 2022','2022-07-26','08:10','','','','0','0','0',''),(84,'July, 2022','2022-07-25','','','','','0','0','0',''),(84,'July, 2022','2022-07-22','08:08','12:09','12:45','05:06','0','0','8',''),(84,'July, 2022','2022-07-29','','','','','0','0','0',''),(84,'July, 2022','2022-07-21','08:18','12:01','12:11','','0','0','4',''),(84,'July, 2022','2022-07-31','','','','','0','0','0',''),(84,'July, 2022','2022-07-30','','','','','0','0','0',''),(84,'July, 2022','2022-07-17','','','','','0','0','0',''),(84,'July, 2022','2022-07-24','','','','','0','0','0',''),(84,'July, 2022','2022-07-20','08:13','12:28','12:57','05:43','0','0','8',''),(84,'July, 2022','2022-07-19','08:15','12:13','12:59','05:11','0','0','8',''),(84,'July, 2022','2022-07-18','08:16','12:09','','05:44','0','0','4',''),(84,'July, 2022','2022-07-23','','','','','0','0','0',''),(84,'July, 2022','2022-07-28','','','','','0','0','0',''),(84,'July, 2022','2022-07-27','','','','','0','0','0','');

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
  `timeIn` double DEFAULT '8',
  `timeOut` double DEFAULT '5.01',
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
  `description` text,
  `holiday_date` date NOT NULL,
  `recurring` tinyint(1) DEFAULT '0',
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
  `emp_explanation` text,
  `mngr_actions` text,
  `prepared_by` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `date_prepared` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `Qty_On_Hand` int(11) DEFAULT '0',
  `Last_Unit_Cost` double DEFAULT '0',
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
  `with_pay` int(11) DEFAULT '0',
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
  `with_pay` int(11) DEFAULT '0',
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

insert  into `leave_monitoring`(`pk`,`yr`,`emp_pk`,`emp_code`,`emp_name`,`vication_leave`,`sick_leave`,`paternity_leave`,`maternity_leave`,`first_jan`,`second_jan`,`first_feb`,`second_feb`,`first_mar`,`second_mar`,`first_apr`,`second_apr`,`first_may`,`second_may`,`first_jun`,`second_jun`,`first_jul`,`second_jul`,`first_aug`,`second_aug`,`first_sep`,`second_sep`,`first_oct`,`second_oct`,`first_nov`,`second_nov`,`first_dec`,`second_dec`,`used_vication_leave`,`used_sick_leave`,`used_paternity_leave`,`used_maternity_leave`,`bal_vication_leave`,`bal_sick_leave`,`bal_paternity_leave`,`bal_maternity_leave`,`total_leave_used`) values (1,'2022',1,'1','ABING, HACELJEN INCIPIDO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,'2022',2,'2','AGOCOY, MONALIZA PESTANO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,'2022',3,'3','AMPATIN, RITA ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,'2022',4,'4','ANDRIN, ARNEL ROMERO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,'2022',5,'5','ARCALA, RITA TABAMO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,'2022',6,'6','ARNOCO, ELMA MORENO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,'2022',7,'7','ARRAJI, FATIMA ESPINIDO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,'2022',8,'8','ARTIZUELA, RUTCHILLE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,'2022',9,'9','BABATID, GUADALUPE INSON',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,'2022',10,'10','BANUELOS, KHAREN GRACE MALALIS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,'2022',11,'11','BELINARIO, KEVIN ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,'2022',12,'12','BERINO, DIANE BACOLOD',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(13,'2022',13,'13','BERNADOS, JUNREY IGONG-IGONG',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,'2022',14,'14','BERTE, HAZEL RAMOS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(15,'2022',15,'15','BLANCO, JASMEN OCAY',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,'2022',16,'16','BOHOL, CHANRAH MAE OCA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,'2022',17,'17','BORJA, EDILBERTO IV BURAY',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,'2022',18,'18','BRIONES, MERALYN ALEGADO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,'2022',19,'19','BUSANO, MARYLAND ESNARDO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,'2022',20,'20','CABITANA, BERLYN TABAMO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,'2022',21,'21','CALLORA., MARRYFOL RETUBES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,'2022',22,'22','CANOY, CHERYL UDTUJAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,'2022',24,'24','COMBESTRA, EMIE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,'2022',25,'25','COSCOS, DENNIS AVERGONZADO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,'2022',23,'23','CREENCIA, ANAMAE TIAMZOM',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,'2022',26,'26','DE LUIS, DARWIN ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,'2022',27,'27','DIVINAGRACIA, BEATRIZ CARREON',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,'2022',28,'28','DUMAJEL, ERLYN ADOREMOS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,'2022',29,'29','EDRADAN, ARNAN ANTALLAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,'2022',30,'30','EMPINADO, ETHEL ALEGO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(31,'2022',32,'32','ENSOY, HERMENIA BARNISO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(32,'2022',31,'31','ENTRINA, ANGEL ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(33,'2022',33,'33','ESNARDO , MARICHU MANTE',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(34,'2022',34,'34','ESNARDO, RAYMART MANTE',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,'2022',35,'35','FERNAN, ALEX RELACION',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(36,'2022',36,'36','FLORES, ESTELLA GEMAO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,'2022',37,'37','GARCIA, JAIRO ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(38,'2022',38,'38','GAVIOLA, SHARIZOL LAPINEG',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(39,'2022',39,'39','GISMAN, CAREN BUAL',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(40,'2022',40,'40','GRAVANZA, ADELAIDA RAFAEL',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,'2022',41,'41','INSON, MERIAM ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(42,'2022',42,'42','JANGALAY, JUDELYN MEDINA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(43,'2022',43,'43','LAID, JHESORLEY MAGANA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(44,'2022',45,'45','LAPINID, MARIBEL SOLANO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(45,'2022',44,'44','LASTIMOSO, DINO ROSALES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(46,'2022',46,'46','LECCIONES, DONALD GONZAGA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,'2022',47,'47','LETIGIO, REJOY POGADO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(48,'2022',48,'48','LICO, ROZYL ROMA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(49,'2022',49,'49','LOPEZ, NORA LUMIARES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(50,'2022',50,'50','LULAB, AEYMH ZHAYL LAUSA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(51,'2022',51,'51','LUMPAY, MARGIE LYN ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(52,'2022',52,'52','MABANAG, RUTHCELYNE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(53,'2022',53,'53','MALLERNA, EVELYN BAJAR',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(54,'2022',54,'54','MAMALIAS , JOAN MABOLIS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,'2022',55,'55','MANEJA, JERSON OCON',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(56,'2022',56,'56','MANEJA, NELIA MANGUBAT',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(57,'2022',57,'57','MANGUBAT, JONALY DESPI',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(58,'2022',58,'58','MANTE, CHRISTIAN IAN MARILLA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(59,'2022',59,'59','MANTE, JESSERIE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(60,'2022',60,'60','MARTINES, SUSAN MORTAL',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(61,'2022',61,'61','MARZAN, JANETH ALGABRE',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(62,'2022',62,'62','MARZAN, MARK BENN VILOAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(63,'2022',63,'63','MONATO., RAVELYEN CALIPAYAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(64,'2022',64,'64','MONTES, GENERICK GROTES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(65,'2022',65,'65','NOVA, JENIFFER LANDICHO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(66,'2022',66,'66','NOVO, JUDYVIE EYANA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(67,'2022',67,'67','PACULBA, EMMALEN SALDIVAR',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(68,'2022',68,'68','PALTIQUERA , ROSLYN ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(69,'2022',69,'69','PAREJA. , THELMA POLANCOS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(70,'2022',70,'70','PASQUIL, REX TEMPLATORA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(71,'2022',71,'71','RAMIREZ , EVELINDA PARADERO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(72,'2022',72,'72','SALARDA, CONIE PIODO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(73,'2022',73,'73','SAPID, ANALYN CAPILITAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(74,'2022',74,'74','SAPID, MERNELITA CAPILITAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(75,'2022',75,'75','SAYSON, DELBERT ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(76,'2022',76,'76','SIAREZ, JOEL  LARIOSA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(77,'2022',77,'77','SILVANO, ELENA ABRATIGUIN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(78,'2022',78,'78','SILVANO, KIRK JASON ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(79,'2022',79,'79','SINAJON , CONCORDIA GANOHAY',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(80,'2022',80,'80','TUBAT, ELESON ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(81,'2022',81,'81','URBUDA, ROBERT MARQUEZ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(82,'2022',82,'82','VICENTE, JOHN MARK SERAD',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(83,'2022',83,'83','VILLEGAS, JELSON TEMPLA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(84,'2022',84,'84','VIRTUDAZO, JOSHUA SALVE',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

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
  `is_half_day` int(11) DEFAULT '0',
  `emp_id` int(11) DEFAULT NULL,
  `employee_number` varchar(100) DEFAULT '',
  `leave_type_id` int(11) DEFAULT NULL,
  `is_approved` int(11) DEFAULT '0',
  `remarks` varchar(11) DEFAULT '',
  `is_deleted` int(11) DEFAULT '0',
  `approved_by` int(11) DEFAULT '0',
  `submitted_by` int(11) DEFAULT '0',
  PRIMARY KEY (`leave_app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `leaves` */

insert  into `leaves`(`leave_app_id`,`leave_date_from`,`leave_date_to`,`no_of_days`,`time_from`,`time_to`,`total_hours`,`is_half_day`,`emp_id`,`employee_number`,`leave_type_id`,`is_approved`,`remarks`,`is_deleted`,`approved_by`,`submitted_by`) values (1,'2022-04-25','2022-04-26',1,'00:00:00','00:00:00',NULL,0,63,'63',2,0,'Sick Leave',0,0,1);

/*Table structure for table `memo` */

DROP TABLE IF EXISTS `memo`;

CREATE TABLE `memo` (
  `memo_id` int(11) NOT NULL AUTO_INCREMENT,
  `memo_date` date DEFAULT NULL,
  `memo_title` varchar(255) DEFAULT NULL,
  `description` text,
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
  `emp_id` int(11) DEFAULT '0',
  `part_1_score_percentage` double DEFAULT '0',
  `part_2_score_percentage` double DEFAULT '0',
  `net_performance_rating` double DEFAULT '0',
  `p3_no_1_score` double DEFAULT '0',
  `p3_no_2_score` double DEFAULT '0',
  `percentage_score` double DEFAULT '0',
  `compensation_adjustments` double DEFAULT '0',
  `p3_deduct_1` double DEFAULT '0',
  `p3_deduct_2` double DEFAULT '0',
  `basic_salary` double DEFAULT '0',
  `superior_assessment` longtext,
  `rated_emp_comments` longtext,
  `hr_remarks` longtext,
  `recommendation` longtext,
  `remarks_approval` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_1_2_3_eval_data` */

/*Table structure for table `part_1_eval_data` */

DROP TABLE IF EXISTS `part_1_eval_data`;

CREATE TABLE `part_1_eval_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_batch_id` int(11) DEFAULT '0',
  `part_1_eval_id` int(11) DEFAULT '0',
  `emp_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `score` double DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_1_eval_data` */

/*Table structure for table `part_1_evaluations` */

DROP TABLE IF EXISTS `part_1_evaluations`;

CREATE TABLE `part_1_evaluations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_1_scoring_id` int(11) DEFAULT '1',
  `title` varchar(100) DEFAULT NULL,
  `description` longtext,
  `is_active` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_1_scoring` */

/*Table structure for table `part_2_eval_data` */

DROP TABLE IF EXISTS `part_2_eval_data`;

CREATE TABLE `part_2_eval_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_batch_id` int(11) DEFAULT '0',
  `part_2_eval_id` int(11) DEFAULT '0',
  `emp_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `score` double DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_2_eval_data_bk` */

/*Table structure for table `part_2_evaluations` */

DROP TABLE IF EXISTS `part_2_evaluations`;

CREATE TABLE `part_2_evaluations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_2_scoring_id` int(11) DEFAULT '1',
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `is_active` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `amount` double DEFAULT '0',
  `bonus` double DEFAULT '0',
  `total` double DEFAULT '0',
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
  `coop` double DEFAULT '0',
  `sss_loan` double DEFAULT '0',
  `pagibig_loan` double DEFAULT '0',
  `cash_advance` double DEFAULT '0',
  `canteen` double DEFAULT '0',
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
  `daily_rate` double DEFAULT '0',
  `monthly_rate` double DEFAULT '0',
  `semi_monthly_rate` double DEFAULT '0',
  `hourly_rate` double DEFAULT '0',
  `min_rate` double DEFAULT '0',
  `reg_ot_rate` double DEFAULT '0',
  `holiday_rate` double DEFAULT '0',
  `sunday_special_rate` double DEFAULT '0',
  `night_premium_rate` double DEFAULT '0',
  `standart_hour` double DEFAULT '0',
  `absent_hour` double DEFAULT '0',
  `ut` double DEFAULT '0',
  `leave` double DEFAULT '0',
  `actual_hour` double DEFAULT '0',
  `late_min` double DEFAULT '0',
  `reg_ot_hours` double DEFAULT '0',
  `sunday_special_hour` double DEFAULT '0',
  `sunday_special_ot_hour` double DEFAULT '0',
  `holiday_hour` double DEFAULT '0',
  `holiday_ot_hour` double DEFAULT '0',
  `night_premium_hour` double DEFAULT '0',
  `night_premium_holiday_hour` double DEFAULT '0',
  `night_premium_sunday_special_hour` double DEFAULT '0',
  `paternity_leave_hour` double DEFAULT '0',
  `service_incentive_hour` double DEFAULT '0',
  `total_hour` double DEFAULT '0',
  `rice_allowance` double DEFAULT '0',
  `clothing_allowance` double DEFAULT '0',
  `monetized_unused_leave_credit` double DEFAULT '0',
  `medical_allowance_dependents` double DEFAULT '0',
  `medical_allowance` double DEFAULT '0',
  `laundry_allowance` double DEFAULT '0',
  `deminis_benefits` double DEFAULT '0',
  `cola` double DEFAULT '0',
  `communication_allowance` double DEFAULT '0',
  `basic_pay` double DEFAULT '0',
  `ot_pay` double DEFAULT '0',
  `sunday_special_pay` double DEFAULT '0',
  `sunday_special_ot_pay` double DEFAULT '0',
  `holiday_pay` double DEFAULT '0',
  `holiday_ot_pay` double DEFAULT '0',
  `night_premium_pay` double DEFAULT '0',
  `night_premium_holiday_pay` double DEFAULT '0',
  `night_premium_sunday_pay` double DEFAULT '0',
  `paternity_leave_pay` double DEFAULT '0',
  `service_incentive_pay` double DEFAULT '0',
  `adjustments` double DEFAULT '0',
  `late_deduction` double DEFAULT '0',
  `gross_pay` double DEFAULT '0',
  `taxable_compensation` double DEFAULT '0',
  `sss` double DEFAULT '0',
  `philhealth` double DEFAULT '0',
  `pag_ibig` double DEFAULT '0',
  `wtax` double DEFAULT '0',
  `under_witheld` double DEFAULT '0',
  `other_deductions` double DEFAULT '0',
  `total_tax` double DEFAULT '0',
  `sss_loan` double DEFAULT '0',
  `pagibig_loan` double DEFAULT '0',
  `loan_adjustment` double DEFAULT '0',
  `cash_advance` double DEFAULT '0',
  `total_deduction` double DEFAULT '0',
  `net_pay_atm` double DEFAULT '0',
  `net_pay_should_be` double DEFAULT '0',
  `extra` double DEFAULT '0',
  `sss_er` double DEFAULT '0',
  `philhealth_er` double DEFAULT '0',
  `pagibig_er` double DEFAULT '0',
  `wtax_er` double DEFAULT '0',
  `total_er` double DEFAULT '0',
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
  `is_approved` int(11) DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `compressed_day` int(11) DEFAULT '0',
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
  `emp_id` int(11) NOT NULL DEFAULT '0',
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `plate_number` text,
  `make` text,
  `body_type` text,
  `year_model` int(4) DEFAULT NULL,
  `series` text,
  `color` text,
  `current_driver` text,
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
  `travel_details` tinytext,
  `passenger_names` tinytext,
  `destination` tinytext,
  `et_departure` tinytext,
  `departure_odometer` int(11) DEFAULT NULL,
  `et_arrival` tinytext,
  `arrival_odometer` int(11) DEFAULT NULL,
  `remarks` tinytext,
  PRIMARY KEY (`trip_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vehicles_deploy` */

insert  into `vehicles_deploy`(`trip_number`,`travel_details`,`passenger_names`,`destination`,`et_departure`,`departure_odometer`,`et_arrival`,`arrival_odometer`,`remarks`) values (1,'Delivery of Stocks','Junmar II Sales','Camotes','10pm',NULL,'11PM',NULL,NULL),(2,'retrival','Jason tobes','Clarin','7AM',121,'4am',2123,NULL);

/*Table structure for table `weekly_hour_setup` */

DROP TABLE IF EXISTS `weekly_hour_setup`;

CREATE TABLE `weekly_hour_setup` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_hour` double DEFAULT '0',
  `six_days` double DEFAULT '0',
  `five_days` double DEFAULT '0',
  `four_days` double DEFAULT '0',
  `three_days` double DEFAULT '0',
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
  `amount_rate` double DEFAULT '0',
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
