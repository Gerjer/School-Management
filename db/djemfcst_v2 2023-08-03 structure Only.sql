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

/*Table structure for table `_checking` */

DROP TABLE IF EXISTS `_checking`;

CREATE TABLE `_checking` (
  `id` int(11) NOT NULL,
  `activate` varchar(255) DEFAULT NULL,
  `assessment_reprint` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `_saving_dir` */

DROP TABLE IF EXISTS `_saving_dir`;

CREATE TABLE `_saving_dir` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `additional_exam_groups` */

DROP TABLE IF EXISTS `additional_exam_groups`;

CREATE TABLE `additional_exam_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `exam_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 0,
  `result_published` tinyint(1) DEFAULT 0,
  `students_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `additional_exam_scores` */

DROP TABLE IF EXISTS `additional_exam_scores`;

CREATE TABLE `additional_exam_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `additional_exam_id` int(11) DEFAULT NULL,
  `marks` decimal(7,2) DEFAULT NULL,
  `grading_level_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `additional_exams` */

DROP TABLE IF EXISTS `additional_exams`;

CREATE TABLE `additional_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `additional_exam_group_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `maximum_marks` int(11) DEFAULT NULL,
  `minimum_marks` int(11) DEFAULT NULL,
  `grading_level_id` int(11) DEFAULT NULL,
  `weightage` int(11) DEFAULT 0,
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `additional_fields` */

DROP TABLE IF EXISTS `additional_fields`;

CREATE TABLE `additional_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `address_type` */

DROP TABLE IF EXISTS `address_type`;

CREATE TABLE `address_type` (
  `address_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `application_setup` */

DROP TABLE IF EXISTS `application_setup`;

CREATE TABLE `application_setup` (
  `application_setup_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`application_setup_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `apply_leaves` */

DROP TABLE IF EXISTS `apply_leaves`;

CREATE TABLE `apply_leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_leave_types_id` int(11) DEFAULT NULL,
  `is_half_day` tinyint(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `viewed_by_manager` tinyint(1) DEFAULT 0,
  `manager_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `archived_employee_additional_details` */

DROP TABLE IF EXISTS `archived_employee_additional_details`;

CREATE TABLE `archived_employee_additional_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `additional_field_id` int(11) DEFAULT NULL,
  `additional_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `archived_employee_bank_details` */

DROP TABLE IF EXISTS `archived_employee_bank_details`;

CREATE TABLE `archived_employee_bank_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bank_field_id` int(11) DEFAULT NULL,
  `bank_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `archived_employee_salary_structures` */

DROP TABLE IF EXISTS `archived_employee_salary_structures`;

CREATE TABLE `archived_employee_salary_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `payroll_category_id` int(11) DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `archived_employees` */

DROP TABLE IF EXISTS `archived_employees`;

CREATE TABLE `archived_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_category_id` int(11) DEFAULT NULL,
  `employee_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_position_id` int(11) DEFAULT NULL,
  `employee_department_id` int(11) DEFAULT NULL,
  `reporting_manager_id` int(11) DEFAULT NULL,
  `employee_grade_id` int(11) DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience_detail` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience_year` int(11) DEFAULT NULL,
  `experience_month` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `status_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `children_count` int(11) DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `husband_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blood_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `home_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_country_id` int(11) DEFAULT NULL,
  `home_pin_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_country_id` int(11) DEFAULT NULL,
  `office_pin_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_data` mediumblob DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `former_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `archived_exam_scores` */

DROP TABLE IF EXISTS `archived_exam_scores`;

CREATE TABLE `archived_exam_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `marks` decimal(7,2) DEFAULT NULL,
  `grading_level_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_archived_exam_scores_on_student_id_and_exam_id` (`student_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `archived_guardians` */

DROP TABLE IF EXISTS `archived_guardians`;

CREATE TABLE `archived_guardians` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ward_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `income` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `archived_students` */

DROP TABLE IF EXISTS `archived_students`;

CREATE TABLE `archived_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_roll_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blood_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_category_id` int(11) DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_data` mediumblob DEFAULT NULL,
  `status_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `immediate_contact_id` int(11) DEFAULT NULL,
  `is_sms_enabled` tinyint(1) DEFAULT 1,
  `former_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `assessment_scores` */

DROP TABLE IF EXISTS `assessment_scores`;

CREATE TABLE `assessment_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `grade_points` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `descriptive_indicator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `score_index` (`student_id`,`batch_id`,`descriptive_indicator_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `assets` */

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `attach_document_type` */

DROP TABLE IF EXISTS `attach_document_type`;

CREATE TABLE `attach_document_type` (
  `attach_document_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attach_document_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `attendances` */

DROP TABLE IF EXISTS `attendances`;

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `period_table_entry_id` int(11) DEFAULT NULL,
  `forenoon` tinyint(1) DEFAULT 0,
  `afternoon` tinyint(1) DEFAULT 0,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month_date` date DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_attendances_on_month_date_and_batch_id` (`month_date`,`batch_id`) USING BTREE,
  KEY `index_attendances_on_student_id_and_batch_id` (`student_id`,`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `backtrack_entry` */

DROP TABLE IF EXISTS `backtrack_entry`;

CREATE TABLE `backtrack_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `school_address` varchar(255) DEFAULT NULL,
  `program_name` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `subject_code` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `finalgrade` varchar(255) DEFAULT NULL,
  `re_exam` varchar(255) DEFAULT NULL,
  `credit_hours` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `year_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bank_fields` */

DROP TABLE IF EXISTS `bank_fields`;

CREATE TABLE `bank_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `batch_events` */

DROP TABLE IF EXISTS `batch_events`;

CREATE TABLE `batch_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_batch_events_on_batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `batch_groups` */

DROP TABLE IF EXISTS `batch_groups`;

CREATE TABLE `batch_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `batch_students` */

DROP TABLE IF EXISTS `batch_students`;

CREATE TABLE `batch_students` (
  `student_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  KEY `index_batch_students_on_batch_id_and_student_id` (`batch_id`,`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `batches` */

DROP TABLE IF EXISTS `batches`;

CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_level` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_year` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `semester` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SysPk` decimal(10,0) DEFAULT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade_dist_from` date DEFAULT NULL,
  `grade_dist_to` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_batches_on_is_deleted_and_is_active_and_course_id_and_name` (`is_deleted`,`is_active`,`course_id`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `billing_form1_details` */

DROP TABLE IF EXISTS `billing_form1_details`;

CREATE TABLE `billing_form1_details` (
  `billing_statements_id` int(11) DEFAULT NULL,
  `billing_formtype_id` int(11) NOT NULL,
  `term` varchar(255) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `account_code` varchar(255) DEFAULT NULL,
  `amount` decimal(10,3) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `name2` int(11) DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `billing_form2_details` */

DROP TABLE IF EXISTS `billing_form2_details`;

CREATE TABLE `billing_form2_details` (
  `billing_statements_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`billing_statements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `billing_form3_details` */

DROP TABLE IF EXISTS `billing_form3_details`;

CREATE TABLE `billing_form3_details` (
  `billing_statements_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`billing_statements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `billing_statements` */

DROP TABLE IF EXISTS `billing_statements`;

CREATE TABLE `billing_statements` (
  `billing_statements_id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_formtype_id` int(255) DEFAULT NULL,
  `billing_reference_no` varchar(255) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `billing_type` varchar(255) DEFAULT NULL,
  `amount` decimal(10,3) DEFAULT NULL,
  `status_type_id` int(255) DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `semister` varchar(255) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`billing_statements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bloodtype` */

DROP TABLE IF EXISTS `bloodtype`;

CREATE TABLE `bloodtype` (
  `PersonBloodTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PersonBloodTypeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

/*Table structure for table `cce_exam_categories` */

DROP TABLE IF EXISTS `cce_exam_categories`;

CREATE TABLE `cce_exam_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `cce_grade_sets` */

DROP TABLE IF EXISTS `cce_grade_sets`;

CREATE TABLE `cce_grade_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `cce_grades` */

DROP TABLE IF EXISTS `cce_grades`;

CREATE TABLE `cce_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade_point` float DEFAULT NULL,
  `cce_grade_set_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_cce_grades_on_cce_grade_set_id` (`cce_grade_set_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `cce_reports` */

DROP TABLE IF EXISTS `cce_reports`;

CREATE TABLE `cce_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observable_id` int(11) DEFAULT NULL,
  `observable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `grade_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cce_report_join_index` (`observable_id`,`student_id`,`batch_id`,`exam_id`,`observable_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `cce_weightages` */

DROP TABLE IF EXISTS `cce_weightages`;

CREATE TABLE `cce_weightages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weightage` int(11) DEFAULT NULL,
  `criteria_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cce_exam_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `cce_weightages_courses` */

DROP TABLE IF EXISTS `cce_weightages_courses`;

CREATE TABLE `cce_weightages_courses` (
  `cce_weightage_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  KEY `index_cce_weightages_courses_on_cce_weightage_id` (`cce_weightage_id`) USING BTREE,
  KEY `index_cce_weightages_courses_on_course_id` (`course_id`) USING BTREE,
  KEY `index_for_join_table_cce_weightage_courses` (`course_id`,`cce_weightage_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `check_voucher` */

DROP TABLE IF EXISTS `check_voucher`;

CREATE TABLE `check_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_no` int(11) NOT NULL,
  `check_no` varchar(50) NOT NULL,
  `cv_date` date DEFAULT NULL,
  `pay_to` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `particulars` text DEFAULT NULL,
  `requester` varchar(155) DEFAULT NULL,
  `bank_acct_no` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'UNPOSTED',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`cv_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1876 DEFAULT CHARSET=latin1;

/*Table structure for table `check_voucher_details` */

DROP TABLE IF EXISTS `check_voucher_details`;

CREATE TABLE `check_voucher_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_id` int(11) DEFAULT NULL,
  `entry_type` varchar(10) DEFAULT NULL,
  `coa_code` int(11) DEFAULT NULL,
  `coa_description` varchar(150) DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4959 DEFAULT CHARSET=latin1;

/*Table structure for table `citizenship` */

DROP TABLE IF EXISTS `citizenship`;

CREATE TABLE `citizenship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `class_designations` */

DROP TABLE IF EXISTS `class_designations`;

CREATE TABLE `class_designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cgpa` decimal(15,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `marks` decimal(15,2) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `class_timings` */

DROP TABLE IF EXISTS `class_timings`;

CREATE TABLE `class_timings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_break` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `Item_Code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_class_timings_on_batch_id_and_start_time_and_end_time` (`batch_id`,`start_time`,`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `coa_debit_account` */

DROP TABLE IF EXISTS `coa_debit_account`;

CREATE TABLE `coa_debit_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT 'account id',
  `account_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `configurations` */

DROP TABLE IF EXISTS `configurations`;

CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_configurations_on_config_key` (`config_key`(10)) USING BTREE,
  KEY `index_configurations_on_config_value` (`config_value`(10)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `contact_person` */

DROP TABLE IF EXISTS `contact_person`;

CREATE TABLE `contact_person` (
  `contact_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `person_type_id` int(11) DEFAULT NULL,
  `pk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contact_person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `copies_of_cor` */

DROP TABLE IF EXISTS `copies_of_cor`;

CREATE TABLE `copies_of_cor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `course_branches` */

DROP TABLE IF EXISTS `course_branches`;

CREATE TABLE `course_branches` (
  `course_branches_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_main_id` int(11) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `statu_type_id` int(11) DEFAULT 1,
  `stat_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`course_branches_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `course_main` */

DROP TABLE IF EXISTS `course_main`;

CREATE TABLE `course_main` (
  `course_main_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_main_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `coursegroup` */

DROP TABLE IF EXISTS `coursegroup`;

CREATE TABLE `coursegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `grading_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SysPK` decimal(10,0) DEFAULT NULL,
  `dean_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_courses_on_grading_type` (`grading_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `courses_observation_groups` */

DROP TABLE IF EXISTS `courses_observation_groups`;

CREATE TABLE `courses_observation_groups` (
  `course_id` int(11) DEFAULT NULL,
  `observation_group_id` int(11) DEFAULT NULL,
  KEY `index_courses_observation_groups_on_observation_group_id` (`observation_group_id`) USING BTREE,
  KEY `index_courses_observation_groups_on_course_id` (`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `credit_distribution` */

DROP TABLE IF EXISTS `credit_distribution`;

CREATE TABLE `credit_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SysPk` decimal(10,0) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `unitreq` double DEFAULT NULL,
  `unitearned` double DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `day_schedule` */

DROP TABLE IF EXISTS `day_schedule`;

CREATE TABLE `day_schedule` (
  `day_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`day_schedule_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `delayed_jobs` */

DROP TABLE IF EXISTS `delayed_jobs`;

CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT 0,
  `attempts` int(11) DEFAULT 0,
  `handler` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_error` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_delayed_jobs_on_locked_by` (`locked_by`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `descriptive_indicators` */

DROP TABLE IF EXISTS `descriptive_indicators`;

CREATE TABLE `descriptive_indicators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `describable_id` int(11) DEFAULT NULL,
  `describable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `describable_index` (`describable_id`,`describable_type`,`sort_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `educational_attainment` */

DROP TABLE IF EXISTS `educational_attainment`;

CREATE TABLE `educational_attainment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `educational_attainment_d` */

DROP TABLE IF EXISTS `educational_attainment_d`;

CREATE TABLE `educational_attainment_d` (
  `educational_attainment_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_attainent_id` int(11) DEFAULT NULL,
  `application_setup_id` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`educational_attainment_details_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `elective_groups` */

DROP TABLE IF EXISTS `elective_groups`;

CREATE TABLE `elective_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `electives` */

DROP TABLE IF EXISTS `electives`;

CREATE TABLE `electives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elective_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_additional_details` */

DROP TABLE IF EXISTS `employee_additional_details`;

CREATE TABLE `employee_additional_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `additional_field_id` int(11) DEFAULT NULL,
  `additional_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_attendances` */

DROP TABLE IF EXISTS `employee_attendances`;

CREATE TABLE `employee_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_leave_type_id` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_half_day` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_bank_details` */

DROP TABLE IF EXISTS `employee_bank_details`;

CREATE TABLE `employee_bank_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bank_field_id` int(11) DEFAULT NULL,
  `bank_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_employee_bank_details` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_categories` */

DROP TABLE IF EXISTS `employee_categories`;

CREATE TABLE `employee_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_department_events` */

DROP TABLE IF EXISTS `employee_department_events`;

CREATE TABLE `employee_department_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `employee_department_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_departments` */

DROP TABLE IF EXISTS `employee_departments`;

CREATE TABLE `employee_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_educational_attainment` */

DROP TABLE IF EXISTS `employee_educational_attainment`;

CREATE TABLE `employee_educational_attainment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `education_attainment` varchar(255) DEFAULT NULL,
  `school_address` varchar(255) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `honors_received` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `employee_employment_history` */

DROP TABLE IF EXISTS `employee_employment_history`;

CREATE TABLE `employee_employment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `employee_grades` */

DROP TABLE IF EXISTS `employee_grades`;

CREATE TABLE `employee_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `max_hours_day` double DEFAULT NULL,
  `max_hours_week` double DEFAULT NULL,
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `Item_Code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_leave_types` */

DROP TABLE IF EXISTS `employee_leave_types`;

CREATE TABLE `employee_leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `max_leave_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carry_forward` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_leaves` */

DROP TABLE IF EXISTS `employee_leaves`;

CREATE TABLE `employee_leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_leave_type_id` int(11) DEFAULT NULL,
  `leave_count` decimal(5,1) DEFAULT 0.0,
  `leave_taken` decimal(5,1) DEFAULT 0.0,
  `reset_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_positions` */

DROP TABLE IF EXISTS `employee_positions`;

CREATE TABLE `employee_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `Item_Code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_salary_structures` */

DROP TABLE IF EXISTS `employee_salary_structures`;

CREATE TABLE `employee_salary_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `payroll_category_id` int(11) DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employee_service_history` */

DROP TABLE IF EXISTS `employee_service_history`;

CREATE TABLE `employee_service_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `service_level` varchar(255) DEFAULT NULL,
  `service_career` varchar(255) DEFAULT NULL,
  `date_examination` date DEFAULT NULL,
  `place_examination` varchar(255) DEFAULT NULL,
  `ratings` varchar(255) DEFAULT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `date_release` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_category_id` int(11) DEFAULT NULL,
  `employee_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_position_id` int(11) DEFAULT NULL,
  `employee_department_id` int(11) DEFAULT NULL,
  `reporting_manager_id` int(11) DEFAULT NULL,
  `employee_grade_id` int(11) DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience_detail` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience_year` int(11) DEFAULT NULL,
  `experience_month` int(11) DEFAULT NULL,
  `status_type_id` tinyint(1) DEFAULT 1,
  `status_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `firstday_date` date DEFAULT NULL,
  `biometric_id` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `empl_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_encoded` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_employees_on_employee_number` (`employee_number`(10)) USING BTREE,
  KEY `FK_employees` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `employees_subjects` */

DROP TABLE IF EXISTS `employees_subjects`;

CREATE TABLE `employees_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_employees_subjects_on_subject_id` (`subject_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `events` */

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_common` tinyint(1) DEFAULT 0,
  `is_holiday` tinyint(1) DEFAULT 0,
  `is_exam` tinyint(1) DEFAULT 0,
  `is_due` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_events_on_is_common_and_is_holiday_and_is_exam` (`is_common`,`is_holiday`,`is_exam`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `exam_groups` */

DROP TABLE IF EXISTS `exam_groups`;

CREATE TABLE `exam_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `exam_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 0,
  `result_published` tinyint(1) DEFAULT 0,
  `exam_date` date DEFAULT NULL,
  `is_final_exam` tinyint(1) NOT NULL DEFAULT 0,
  `cce_exam_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `exam_scores` */

DROP TABLE IF EXISTS `exam_scores`;

CREATE TABLE `exam_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `marks` decimal(7,2) DEFAULT NULL,
  `grading_level_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_exam_scores_on_student_id_and_exam_id` (`student_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `exams` */

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `maximum_marks` decimal(10,2) DEFAULT NULL,
  `minimum_marks` decimal(10,2) DEFAULT NULL,
  `grading_level_id` int(11) DEFAULT NULL,
  `weightage` int(11) DEFAULT 0,
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_exams_on_exam_group_id_and_subject_id` (`exam_group_id`,`subject_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fa_criterias` */

DROP TABLE IF EXISTS `fa_criterias`;

CREATE TABLE `fa_criterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fa_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_fa_criterias_on_fa_group_id` (`fa_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fa_groups` */

DROP TABLE IF EXISTS `fa_groups`;

CREATE TABLE `fa_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cce_exam_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cce_grade_set_id` int(11) DEFAULT NULL,
  `max_marks` float DEFAULT 100,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fa_groups_subjects` */

DROP TABLE IF EXISTS `fa_groups_subjects`;

CREATE TABLE `fa_groups_subjects` (
  `subject_id` int(11) DEFAULT NULL,
  `fa_group_id` int(11) DEFAULT NULL,
  KEY `index_fa_groups_subjects_on_subject_id` (`subject_id`) USING BTREE,
  KEY `index_fa_groups_subjects_on_fa_group_id` (`fa_group_id`) USING BTREE,
  KEY `score_index` (`fa_group_id`,`subject_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fee_collection_discounts` */

DROP TABLE IF EXISTS `fee_collection_discounts`;

CREATE TABLE `fee_collection_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `finance_fee_collection_id` int(11) DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `is_amount` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fee_collection_particulars` */

DROP TABLE IF EXISTS `fee_collection_particulars`;

CREATE TABLE `fee_collection_particulars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `finance_fee_collection_id` int(11) DEFAULT NULL,
  `student_category_id` int(11) DEFAULT NULL,
  `admission_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fee_discounts` */

DROP TABLE IF EXISTS `fee_discounts`;

CREATE TABLE `fee_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `finance_fee_category_id` int(11) DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `is_amount` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fee_schedule` */

DROP TABLE IF EXISTS `fee_schedule`;

CREATE TABLE `fee_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_category_id` int(11) DEFAULT NULL,
  `description` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `fees_protocol` */

DROP TABLE IF EXISTS `fees_protocol`;

CREATE TABLE `fees_protocol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enroll_status` varchar(255) DEFAULT NULL,
  `mode_payment` int(11) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `trigger` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `file_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` mediumint(8) unsigned DEFAULT NULL,
  `file` mediumblob DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `description_name` varchar(255) DEFAULT NULL,
  `address` varchar(155) DEFAULT NULL,
  `contactnum` varchar(50) DEFAULT NULL,
  `mobilenum` varchar(100) DEFAULT NULL,
  `faxnum` varchar(100) DEFAULT NULL,
  `emailaddress` varchar(255) DEFAULT NULL,
  `hdr_file_name` varchar(255) DEFAULT NULL,
  `hdr_file_size` mediumint(9) DEFAULT NULL,
  `hdr_file` mediumblob DEFAULT NULL,
  `application_setup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `finance_donations` */

DROP TABLE IF EXISTS `finance_donations`;

CREATE TABLE `finance_donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_fee_categories` */

DROP TABLE IF EXISTS `finance_fee_categories`;

CREATE TABLE `finance_fee_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_master` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pay_upon_enroll` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1274 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_fee_collections` */

DROP TABLE IF EXISTS `finance_fee_collections`;

CREATE TABLE `finance_fee_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_finance_fee_collections_on_fee_category_id` (`fee_category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_fee_particulars` */

DROP TABLE IF EXISTS `finance_fee_particulars`;

CREATE TABLE `finance_fee_particulars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `finance_fee_category_id` int(11) DEFAULT NULL,
  `student_category_id` int(11) DEFAULT NULL,
  `admission_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `mode_payments` int(11) DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `account_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5703 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_fee_structure_elements` */

DROP TABLE IF EXISTS `finance_fee_structure_elements`;

CREATE TABLE `finance_fee_structure_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(15,2) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `student_category_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `fee_collection_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_fees` */

DROP TABLE IF EXISTS `finance_fees`;

CREATE TABLE `finance_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_collection_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_finance_fees_on_fee_collection_id_and_student_id` (`fee_collection_id`,`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_transaction_categories` */

DROP TABLE IF EXISTS `finance_transaction_categories`;

CREATE TABLE `finance_transaction_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_income` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `trans_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_transaction_triggers` */

DROP TABLE IF EXISTS `finance_transaction_triggers`;

CREATE TABLE `finance_transaction_triggers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_category_id` int(11) DEFAULT NULL,
  `percentage` decimal(8,2) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_transactions` */

DROP TABLE IF EXISTS `finance_transactions`;

CREATE TABLE `finance_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `fine_included` tinyint(1) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `finance_fees_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `fine_amount` double(10,2) DEFAULT 0.00,
  `master_transaction_id` int(11) DEFAULT 0,
  `finance_id` int(11) DEFAULT NULL,
  `finance_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payee_id` int(11) DEFAULT NULL,
  `payee_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voucher_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `tor_printed` tinyint(4) DEFAULT 0,
  `bank` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acctno` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'UNPOSTED',
  `payment_type` int(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11672 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `finance_transactions_onetime_payments` */

DROP TABLE IF EXISTS `finance_transactions_onetime_payments`;

CREATE TABLE `finance_transactions_onetime_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_roll_no` int(11) DEFAULT NULL,
  `finance_fee_paticulars_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `date_paid` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `finance_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30098 DEFAULT CHARSET=latin1;

/*Table structure for table `form9_collegiate_record` */

DROP TABLE IF EXISTS `form9_collegiate_record`;

CREATE TABLE `form9_collegiate_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `student_id` decimal(10,0) NOT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `school_address` varchar(255) DEFAULT NULL,
  `program_name` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `subject_code` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `finalgrade` varchar(255) DEFAULT NULL,
  `re_exam` varchar(255) DEFAULT NULL,
  `credit_hours` varchar(255) DEFAULT NULL,
  `year_level` varchar(255) DEFAULT NULL,
  `credit_distribution_id` int(11) DEFAULT NULL,
  `inorder` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `form_report` */

DROP TABLE IF EXISTS `form_report`;

CREATE TABLE `form_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `applicaation_setup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `grading_levels` */

DROP TABLE IF EXISTS `grading_levels`;

CREATE TABLE `grading_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `min_score` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `credit_points` decimal(15,2) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_grading_levels_on_batch_id_and_is_deleted` (`batch_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `grading_system` */

DROP TABLE IF EXISTS `grading_system`;

CREATE TABLE `grading_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ratings` varchar(255) DEFAULT NULL,
  `equivalent` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `grading_system_copy1` */

DROP TABLE IF EXISTS `grading_system_copy1`;

CREATE TABLE `grading_system_copy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ratings` varchar(255) DEFAULT NULL,
  `equivalent` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `graduate_student` */

DROP TABLE IF EXISTS `graduate_student`;

CREATE TABLE `graduate_student` (
  `graduate_student_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `class_roll_number` int(11) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_IDNumber` varchar(255) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `place_birth` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  `father` varchar(255) DEFAULT NULL,
  `mother` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_admitted` date DEFAULT NULL,
  `entrance_data` varchar(255) DEFAULT NULL,
  `elementary_graduated` varchar(255) DEFAULT NULL,
  `elementary_schoolyear` varchar(255) DEFAULT NULL,
  `highschool_graduated` varchar(255) DEFAULT NULL,
  `highschool_schoolyear` varchar(255) DEFAULT NULL,
  `tertiary_graduated` varchar(255) DEFAULT NULL,
  `tertiary_schoolyear` varchar(255) DEFAULT NULL,
  `degree_program` varchar(255) DEFAULT NULL,
  `date_graduated` date DEFAULT NULL,
  `program_major` varchar(255) DEFAULT NULL,
  `authority_number` varchar(255) DEFAULT NULL,
  `authority_year_granted` varchar(255) DEFAULT NULL,
  `status_graduate` tinyint(1) DEFAULT 0,
  `status_type_id` int(11) DEFAULT 1,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`graduate_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `graduate_student_prc` */

DROP TABLE IF EXISTS `graduate_student_prc`;

CREATE TABLE `graduate_student_prc` (
  `id` int(11) NOT NULL,
  `graduate_student_id` int(11) DEFAULT NULL,
  `authority_number` varbinary(255) DEFAULT NULL,
  `authority_year_granted` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `group_courses` */

DROP TABLE IF EXISTS `group_courses`;

CREATE TABLE `group_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursegroup_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `grouped_batches` */

DROP TABLE IF EXISTS `grouped_batches`;

CREATE TABLE `grouped_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_group_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_grouped_batches_on_batch_group_id` (`batch_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `grouped_exam_reports` */

DROP TABLE IF EXISTS `grouped_exam_reports`;

CREATE TABLE `grouped_exam_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `marks` decimal(15,2) DEFAULT NULL,
  `score_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `by_batch_student_and_score_type` (`batch_id`,`student_id`,`score_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `grouped_exams` */

DROP TABLE IF EXISTS `grouped_exams`;

CREATE TABLE `grouped_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `weightage` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_grouped_exams_on_batch_id` (`batch_id`) USING BTREE,
  KEY `index_grouped_exams_on_batch_id_and_exam_group_id` (`batch_id`,`exam_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `guardians` */

DROP TABLE IF EXISTS `guardians`;

CREATE TABLE `guardians` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ward_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `income` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `hostid` int(11) DEFAULT NULL,
  `itemname` varchar(5) DEFAULT NULL,
  `itemvalue` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `image_type` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_format` varchar(255) DEFAULT NULL,
  `file_size` mediumint(9) DEFAULT NULL,
  `file` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `individual_payslip_categories` */

DROP TABLE IF EXISTS `individual_payslip_categories`;

CREATE TABLE `individual_payslip_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `salary_date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deduction` tinyint(1) DEFAULT NULL,
  `include_every_month` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `job_title` */

DROP TABLE IF EXISTS `job_title`;

CREATE TABLE `job_title` (
  `job_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `Item_Code` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_title_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `liabilities` */

DROP TABLE IF EXISTS `liabilities`;

CREATE TABLE `liabilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `is_solved` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `monthly_payslips` */

DROP TABLE IF EXISTS `monthly_payslips`;

CREATE TABLE `monthly_payslips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `payroll_category_id` int(11) DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `approver_id` int(11) DEFAULT NULL,
  `is_rejected` tinyint(1) NOT NULL DEFAULT 0,
  `rejector_id` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `news_comments` */

DROP TABLE IF EXISTS `news_comments`;

CREATE TABLE `news_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `observation_groups` */

DROP TABLE IF EXISTS `observation_groups`;

CREATE TABLE `observation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cce_grade_set_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `observation_kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_marks` float DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `observations` */

DROP TABLE IF EXISTS `observations`;

CREATE TABLE `observations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `observation_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_observations_on_observation_group_id` (`observation_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `official_receipt_inventory` */

DROP TABLE IF EXISTS `official_receipt_inventory`;

CREATE TABLE `official_receipt_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_description` varchar(255) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `OR_number` varchar(255) DEFAULT NULL,
  `date_issued` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT 'VALID',
  `status_type_id` int(11) DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `payroll_categories` */

DROP TABLE IF EXISTS `payroll_categories`;

CREATE TABLE `payroll_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `payroll_category_id` int(11) DEFAULT NULL,
  `is_deduction` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `period_entries` */

DROP TABLE IF EXISTS `period_entries`;

CREATE TABLE `period_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_date` date DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `class_timing_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_period_entries_on_month_date_and_batch_id` (`month_date`,`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_type_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `telephone1` varchar(255) DEFAULT NULL,
  `telephone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `application_setup_id` int(11) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `disability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`) USING BTREE,
  KEY `pname` (`first_name`,`middle_name`,`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6747 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_address` */

DROP TABLE IF EXISTS `person_address`;

CREATE TABLE `person_address` (
  `person_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `address_type_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `citymunicipality` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_address_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5474 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_contact_person` */

DROP TABLE IF EXISTS `person_contact_person`;

CREATE TABLE `person_contact_person` (
  `contact_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `contact_relationship` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  UNIQUE KEY `contact_person_id` (`contact_person_id`) USING BTREE,
  KEY `FK_person_contact_person` (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5280 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_dependent` */

DROP TABLE IF EXISTS `person_dependent`;

CREATE TABLE `person_dependent` (
  `dependent_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependent_name` varchar(255) DEFAULT NULL,
  `dependent_birthdate` date DEFAULT NULL,
  `dependent_relationship` varchar(255) DEFAULT NULL,
  `dependent_count` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `person_id` int(11) DEFAULT NULL,
  `grade_year` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dependent_id`) USING BTREE,
  KEY `FK_person_dependent` (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_educational_attainment` */

DROP TABLE IF EXISTS `person_educational_attainment`;

CREATE TABLE `person_educational_attainment` (
  `peroson_educational_attainment_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `education_attainment` varchar(255) DEFAULT NULL,
  `school_address` varchar(255) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `honors_received` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`peroson_educational_attainment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10411 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_employment_history` */

DROP TABLE IF EXISTS `person_employment_history`;

CREATE TABLE `person_employment_history` (
  `person_employment_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_employment_history_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_familybackground` */

DROP TABLE IF EXISTS `person_familybackground`;

CREATE TABLE `person_familybackground` (
  `family_background_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `family_background_type` varchar(255) DEFAULT NULL,
  `family_background_name` varchar(255) DEFAULT NULL,
  `family_background_occupation` varchar(255) DEFAULT NULL,
  `family_background_company_name` varchar(255) DEFAULT NULL,
  `family_background_company_number` varchar(255) DEFAULT NULL,
  `family_background_company_address` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`family_background_id`) USING BTREE,
  KEY `FK_person_familybackground` (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_photo` */

DROP TABLE IF EXISTS `person_photo`;

CREATE TABLE `person_photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_data` mediumblob DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `original_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_reference` */

DROP TABLE IF EXISTS `person_reference`;

CREATE TABLE `person_reference` (
  `person_reference_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_reference_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_service_history` */

DROP TABLE IF EXISTS `person_service_history`;

CREATE TABLE `person_service_history` (
  `person_service_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `service_level` varchar(255) DEFAULT NULL,
  `service_career` varchar(255) DEFAULT NULL,
  `date_examination` date DEFAULT NULL,
  `place_examination` varchar(255) DEFAULT NULL,
  `ratings` varchar(255) DEFAULT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `date_release` date DEFAULT NULL,
  PRIMARY KEY (`person_service_history_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `person_statutory` */

DROP TABLE IF EXISTS `person_statutory`;

CREATE TABLE `person_statutory` (
  `person_id` int(11) DEFAULT NULL,
  `tin` varchar(255) DEFAULT NULL,
  `sss` varchar(255) DEFAULT NULL,
  `pagibig` varchar(255) DEFAULT NULL,
  `philhealth` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `person_type` */

DROP TABLE IF EXISTS `person_type`;

CREATE TABLE `person_type` (
  `person_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `previous_exam_scores` */

DROP TABLE IF EXISTS `previous_exam_scores`;

CREATE TABLE `previous_exam_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `marks` decimal(7,2) DEFAULT NULL,
  `grading_level_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_previous_exam_scores_on_student_id_and_exam_id` (`student_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `privileges` */

DROP TABLE IF EXISTS `privileges`;

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status_type_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `privileges_users` */

DROP TABLE IF EXISTS `privileges_users`;

CREATE TABLE `privileges_users` (
  `user_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  `type_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index_privileges_users_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `program_of_study` */

DROP TABLE IF EXISTS `program_of_study`;

CREATE TABLE `program_of_study` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `course_ID` int(11) DEFAULT NULL,
  `course_grade` varchar(255) DEFAULT NULL,
  `program_name` varchar(255) DEFAULT NULL,
  `year_level` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `descriptive_title` varchar(255) DEFAULT NULL,
  `course_number` varchar(255) DEFAULT NULL,
  `lec_units` double(11,1) DEFAULT NULL,
  `lab_units` double(11,1) DEFAULT NULL,
  `units` double(11,2) DEFAULT NULL,
  `pre_requisite` varchar(255) DEFAULT NULL,
  `co_requisite` varchar(255) DEFAULT NULL,
  `track` varchar(255) DEFAULT NULL,
  `strand` varchar(255) DEFAULT NULL,
  `class_type` varchar(255) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=latin1;

/*Table structure for table `ranking_levels` */

DROP TABLE IF EXISTS `ranking_levels`;

CREATE TABLE `ranking_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gpa` decimal(15,2) DEFAULT NULL,
  `marks` decimal(15,2) DEFAULT NULL,
  `subject_count` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `full_course` tinyint(1) DEFAULT 0,
  `course_id` int(11) DEFAULT NULL,
  `subject_limit_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marks_limit_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `refbrgy` */

DROP TABLE IF EXISTS `refbrgy`;

CREATE TABLE `refbrgy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brgyCode` varchar(255) DEFAULT NULL,
  `brgyDesc` text DEFAULT NULL,
  `regCode` varchar(255) DEFAULT NULL,
  `provCode` varchar(255) DEFAULT NULL,
  `citymunCode` varchar(255) DEFAULT NULL,
  `StartTime` timestamp NULL DEFAULT current_timestamp(),
  `EndTime` timestamp NULL DEFAULT NULL,
  `Status_TypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=42031 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `refcitymun` */

DROP TABLE IF EXISTS `refcitymun`;

CREATE TABLE `refcitymun` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `psgcCode` varchar(255) DEFAULT NULL,
  `citymunDesc` text DEFAULT NULL,
  `regDesc` varchar(255) DEFAULT NULL,
  `provCode` varchar(255) DEFAULT NULL,
  `citymunCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1648 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `refprovince` */

DROP TABLE IF EXISTS `refprovince`;

CREATE TABLE `refprovince` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psgcCode` varchar(255) DEFAULT NULL,
  `provDesc` text DEFAULT NULL,
  `regCode` varchar(255) DEFAULT NULL,
  `provCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `reminders` */

DROP TABLE IF EXISTS `reminders`;

CREATE TABLE `reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `is_deleted_by_sender` tinyint(1) DEFAULT 0,
  `is_deleted_by_recipient` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_reminders_on_recipient` (`recipient`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `request_form` */

DROP TABLE IF EXISTS `request_form`;

CREATE TABLE `request_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_transaction_id` int(11) DEFAULT NULL,
  `date_filed` date DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `claim_window` varchar(255) DEFAULT NULL,
  `no_of_copies` int(11) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Table structure for table `requisition` */

DROP TABLE IF EXISTS `requisition`;

CREATE TABLE `requisition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_roll_number` int(11) DEFAULT NULL,
  `date_filed` date DEFAULT NULL,
  `first_copy` tinyint(4) DEFAULT 1,
  `year_graduated` varchar(255) DEFAULT NULL,
  `year_first_attendance` varchar(255) DEFAULT NULL,
  `year_last_attendance` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `request_window` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `requisition_purpose_request` */

DROP TABLE IF EXISTS `requisition_purpose_request`;

CREATE TABLE `requisition_purpose_request` (
  `requisition_id` int(11) NOT NULL,
  `purpose_request` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `requisition_type_form` */

DROP TABLE IF EXISTS `requisition_type_form`;

CREATE TABLE `requisition_type_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `finance_transaction_categories_id` int(11) DEFAULT NULL,
  `status_type_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `requisition_type_request` */

DROP TABLE IF EXISTS `requisition_type_request`;

CREATE TABLE `requisition_type_request` (
  `requisition_id` int(11) NOT NULL,
  `type_of_request` varchar(255) DEFAULT NULL,
  `no_of_copies` tinyint(4) DEFAULT NULL,
  `finance_transaction_categories_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `Item_Code` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `sample` */

DROP TABLE IF EXISTS `sample`;

CREATE TABLE `sample` (
  `idno` int(11) NOT NULL AUTO_INCREMENT,
  `userimg` longblob DEFAULT NULL,
  PRIMARY KEY (`idno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `schema_migrations` */

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `scholarship` */

DROP TABLE IF EXISTS `scholarship`;

CREATE TABLE `scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `scholarship_any` varchar(255) DEFAULT NULL,
  `student_extension_name` varchar(255) DEFAULT NULL,
  `UII` varchar(255) DEFAULT NULL,
  `learner_ref_no` varchar(255) DEFAULT NULL,
  `disability` varchar(255) DEFAULT NULL,
  `dswd_household_no` varchar(255) DEFAULT NULL,
  `income` double DEFAULT NULL,
  `total_assessment` double DEFAULT NULL,
  `father_last_name` varchar(255) DEFAULT NULL,
  `father_first_name` varchar(255) DEFAULT NULL,
  `father_middle_name` varchar(255) DEFAULT NULL,
  `mother_last_name` varchar(255) DEFAULT NULL,
  `mother_first_name` varchar(255) DEFAULT NULL,
  `mother_middle_name` varchar(255) DEFAULT NULL,
  `from_year` varchar(255) DEFAULT NULL,
  `year_level` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) NOT NULL DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `scholarship_grant_id` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `scholarship_grant` */

DROP TABLE IF EXISTS `scholarship_grant`;

CREATE TABLE `scholarship_grant` (
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fullDeduct` varchar(5) DEFAULT 'NO',
  `grant_amount` decimal(10,2) DEFAULT NULL,
  `Refundable` varchar(255) DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `scholarship_uii` */

DROP TABLE IF EXISTS `scholarship_uii`;

CREATE TABLE `scholarship_uii` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uii_number` varchar(255) DEFAULT NULL,
  `year_from` varchar(255) DEFAULT NULL,
  `year_to` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `scholarship_uii_details` */

DROP TABLE IF EXISTS `scholarship_uii_details`;

CREATE TABLE `scholarship_uii_details` (
  `id` int(11) NOT NULL,
  `uii_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `school_details` */

DROP TABLE IF EXISTS `school_details`;

CREATE TABLE `school_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `server_path` */

DROP TABLE IF EXISTS `server_path`;

CREATE TABLE `server_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_path` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `application_setup_id` int(11) DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `workgroup_pcname` varchar(255) DEFAULT NULL,
  `usernname` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `sms_logs` */

DROP TABLE IF EXISTS `sms_logs`;

CREATE TABLE `sms_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway_response` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sms_message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `sms_messages` */

DROP TABLE IF EXISTS `sms_messages`;

CREATE TABLE `sms_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `sms_settings` */

DROP TABLE IF EXISTS `sms_settings`;

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settings_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `student_additional_details` */

DROP TABLE IF EXISTS `student_additional_details`;

CREATE TABLE `student_additional_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `additional_field_id` int(11) DEFAULT NULL,
  `additional_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `student_additional_details_copy1` */

DROP TABLE IF EXISTS `student_additional_details_copy1`;

CREATE TABLE `student_additional_details_copy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `additional_field_id` int(11) DEFAULT NULL,
  `additional_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `student_additional_fields` */

DROP TABLE IF EXISTS `student_additional_fields`;

CREATE TABLE `student_additional_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `student_categories` */

DROP TABLE IF EXISTS `student_categories`;

CREATE TABLE `student_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `no_of_payment` int(1) DEFAULT NULL,
  `SysPK` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `student_classification` */

DROP TABLE IF EXISTS `student_classification`;

CREATE TABLE `student_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_type_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `student_data` */

DROP TABLE IF EXISTS `student_data`;

CREATE TABLE `student_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `student_grade` */

DROP TABLE IF EXISTS `student_grade`;

CREATE TABLE `student_grade` (
  `students_grading_id` int(11) NOT NULL,
  `students_subject_id` int(11) NOT NULL,
  `grades` varchar(20) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `datemodified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `average` double DEFAULT NULL,
  `equivalent` double DEFAULT NULL,
  PRIMARY KEY (`students_grading_id`,`students_subject_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `student_grading_period` */

DROP TABLE IF EXISTS `student_grading_period`;

CREATE TABLE `student_grading_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `student_category_id` int(11) DEFAULT NULL,
  `weight_percentage` int(11) DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `student_previous_datas` */

DROP TABLE IF EXISTS `student_previous_datas`;

CREATE TABLE `student_previous_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `institution` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_mark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `student_previous_subject_marks` */

DROP TABLE IF EXISTS `student_previous_subject_marks`;

CREATE TABLE `student_previous_subject_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `student_rate` */

DROP TABLE IF EXISTS `student_rate`;

CREATE TABLE `student_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6856 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_roll_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scholarshipgrant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `student_category_id` int(11) DEFAULT NULL,
  `immediate_contact_id` int(11) DEFAULT NULL,
  `is_sms_enabled` tinyint(1) DEFAULT 1,
  `status_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `has_paid_fees` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `runningbalance` double DEFAULT 0,
  `is_enrolled` tinyint(1) DEFAULT 0,
  `bal_edit` tinyint(1) DEFAULT 0,
  `is_regular` tinyint(1) DEFAULT 0,
  `person_id` int(11) DEFAULT NULL,
  `year_level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrollmentAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `stature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `std_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `academice_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `withdrawal_date` date DEFAULT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_students_on_admission_no` (`admission_no`(10)) USING BTREE,
  KEY `index_students_on_batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7315 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `students_assessment` */

DROP TABLE IF EXISTS `students_assessment`;

CREATE TABLE `students_assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `masterfee` varchar(50) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `stat` varchar(5) DEFAULT NULL,
  `columnName` varchar(1) DEFAULT NULL,
  `finance_fee_particular_id` int(11) DEFAULT NULL,
  `running_balance` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=465667 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_attachment` */

DROP TABLE IF EXISTS `students_attachment`;

CREATE TABLE `students_attachment` (
  `students_attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `attach_document_type_id` int(11) DEFAULT NULL,
  `file_name` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  PRIMARY KEY (`students_attachment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_attended_university` */

DROP TABLE IF EXISTS `students_attended_university`;

CREATE TABLE `students_attended_university` (
  `students_attended_university_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`students_attended_university_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_deleted` */

DROP TABLE IF EXISTS `students_deleted`;

CREATE TABLE `students_deleted` (
  `id` int(11) NOT NULL,
  `admission_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_roll_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scholarshipgrant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `student_category_id` int(11) DEFAULT NULL,
  `immediate_contact_id` int(11) DEFAULT NULL,
  `is_sms_enabled` tinyint(1) DEFAULT 1,
  `status_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `has_paid_fees` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `runningbalance` double DEFAULT 0,
  `is_enrolled` tinyint(1) DEFAULT 0,
  `bal_edit` tinyint(1) DEFAULT 0,
  `is_regular` tinyint(1) DEFAULT 0,
  `person_id` int(11) DEFAULT NULL,
  `year_level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrollmentAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1,
  `stature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `std_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `academice_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `withdrawal_date` date DEFAULT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_students_on_admission_no` (`admission_no`(10)) USING BTREE,
  KEY `index_students_on_batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `students_details` */

DROP TABLE IF EXISTS `students_details`;

CREATE TABLE `students_details` (
  `students_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `LRN_number` varchar(255) DEFAULT NULL,
  `date_encoded` date DEFAULT NULL,
  `year_level` varchar(255) DEFAULT NULL,
  `high_school_name` varchar(255) DEFAULT NULL,
  `high_school_address` varchar(255) DEFAULT NULL,
  `date_graduation` date DEFAULT NULL,
  `attended_university_id` int(11) DEFAULT NULL,
  `master_program` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `previous_degree` varchar(255) DEFAULT NULL,
  `previous_university` varchar(255) DEFAULT NULL,
  `year_from` date DEFAULT NULL,
  `year_to` date DEFAULT NULL,
  `list_Achivements_id` int(11) DEFAULT NULL,
  `extra_curricular_activities` varchar(255) DEFAULT NULL,
  `other_extra_curricular_participation` varchar(255) DEFAULT NULL,
  `other_resources_avialable` varchar(255) DEFAULT NULL,
  `skills_talents_id` int(11) DEFAULT NULL,
  `other_skills_tallents` varchar(255) DEFAULT NULL,
  `sports_id` int(11) DEFAULT NULL,
  `other_sports` varchar(255) DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `estimate_family_monthly_income` varchar(255) DEFAULT NULL,
  `scholarship_any` varchar(255) DEFAULT NULL,
  `scholarship_sponsor_name` varchar(255) DEFAULT NULL,
  `plan_toShift_another_course` varchar(255) DEFAULT NULL,
  `what_course` varchar(255) DEFAULT NULL,
  `first_choice_course` varchar(255) DEFAULT NULL,
  `plan_after_college` varchar(255) DEFAULT NULL,
  `student_data` varchar(255) DEFAULT NULL,
  `join_position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`students_details_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2199 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_extra_curr_participation` */

DROP TABLE IF EXISTS `students_extra_curr_participation`;

CREATE TABLE `students_extra_curr_participation` (
  `students_extra_curr_participation_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_details_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`students_extra_curr_participation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_list_achievements` */

DROP TABLE IF EXISTS `students_list_achievements`;

CREATE TABLE `students_list_achievements` (
  `students_list_achievements_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `file_name` text DEFAULT NULL,
  PRIMARY KEY (`students_list_achievements_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_non_academic` */

DROP TABLE IF EXISTS `students_non_academic`;

CREATE TABLE `students_non_academic` (
  `students_non_academic_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `non_academic_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`students_non_academic_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_resources_available` */

DROP TABLE IF EXISTS `students_resources_available`;

CREATE TABLE `students_resources_available` (
  `students_resources_available_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_details_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`students_resources_available_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_skills_talent` */

DROP TABLE IF EXISTS `students_skills_talent`;

CREATE TABLE `students_skills_talent` (
  `students_skills_talent_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_details_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`students_skills_talent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_sports` */

DROP TABLE IF EXISTS `students_sports`;

CREATE TABLE `students_sports` (
  `students_sports_id` int(11) NOT NULL AUTO_INCREMENT,
  `students_details_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`students_sports_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `students_subjects` */

DROP TABLE IF EXISTS `students_subjects`;

CREATE TABLE `students_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `subject_class_schedule_id` decimal(10,0) DEFAULT NULL,
  `finalgrade` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `re_exam` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subj_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT '''A''' COMMENT '''A'' - ACTIVE, ''W'' - WITHDRAW , ''D'' - DROP',
  `lec_amt` double DEFAULT 0,
  `lab_amt` double DEFAULT 0,
  `finalremarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equivalent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_students_subjects_on_student_id_and_subject_id` (`student_id`,`subject_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56367 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `subject_class_code` */

DROP TABLE IF EXISTS `subject_class_code`;

CREATE TABLE `subject_class_code` (
  `subject_class_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_class_code` varchar(255) DEFAULT NULL,
  `subject_class_name` varchar(255) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subject_class_code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=957 DEFAULT CHARSET=latin1;

/*Table structure for table `subject_class_details` */

DROP TABLE IF EXISTS `subject_class_details`;

CREATE TABLE `subject_class_details` (
  `subject_class_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subject_schedule_code` varchar(255) DEFAULT NULL,
  `subject_class_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subject_class_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1904 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `subject_class_schedule` */

DROP TABLE IF EXISTS `subject_class_schedule`;

CREATE TABLE `subject_class_schedule` (
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `class_timing_id` int(11) NOT NULL,
  `class_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `room` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day_schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_id`,`class_timing_id`,`day_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `subject_laboratory` */

DROP TABLE IF EXISTS `subject_laboratory`;

CREATE TABLE `subject_laboratory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `subject_leaves` */

DROP TABLE IF EXISTS `subject_leaves`;

CREATE TABLE `subject_leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `month_date` date DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `class_timing_id` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_subject_leaves_on_month_date_and_subject_id_and_batch_id` (`month_date`,`subject_id`,`batch_id`) USING BTREE,
  KEY `index_subject_leaves_on_student_id_and_batch_id` (`student_id`,`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `no_exams` tinyint(1) DEFAULT 0,
  `max_weekly_classes` int(11) DEFAULT NULL,
  `elective_group_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `credit_hours` decimal(15,1) DEFAULT NULL,
  `prefer_consecutive` tinyint(1) DEFAULT 0,
  `amount` decimal(15,2) DEFAULT NULL,
  `ccid` int(11) DEFAULT NULL,
  `creditdistribution` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_distribution_id` int(11) DEFAULT NULL,
  `limit_subject` int(11) DEFAULT 0,
  `pos_id` int(11) DEFAULT NULL,
  `sub_lab_id` int(11) DEFAULT NULL,
  `amount_lab` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_subjects_on_batch_id_and_elective_group_id_and_is_deleted` (`batch_id`,`elective_group_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1741 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `super_user` */

DROP TABLE IF EXISTS `super_user`;

CREATE TABLE `super_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `time_zones` */

DROP TABLE IF EXISTS `time_zones`;

CREATE TABLE `time_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `difference_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_difference` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `timetable_entries` */

DROP TABLE IF EXISTS `timetable_entries`;

CREATE TABLE `timetable_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) DEFAULT NULL,
  `weekday_id` int(11) DEFAULT NULL,
  `class_timing_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `timetable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_timetable_entries_on_timetable_id` (`timetable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `timetables` */

DROP TABLE IF EXISTS `timetables`;

CREATE TABLE `timetables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `by_start_and_end` (`start_date`,`end_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `transcript_detail_file` */

DROP TABLE IF EXISTS `transcript_detail_file`;

CREATE TABLE `transcript_detail_file` (
  `transcript_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `remarks_purpose` varchar(255) DEFAULT NULL,
  `remarks_graduate` varchar(255) DEFAULT NULL,
  `remarks_nstp` varchar(255) DEFAULT NULL,
  `subject_code` varchar(255) DEFAULT NULL,
  `graduated` tinyint(5) DEFAULT 0,
  `date_graduation` date DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transcript_master_id`,`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `transcript_master_file` */

DROP TABLE IF EXISTS `transcript_master_file`;

CREATE TABLE `transcript_master_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_roll_no` varchar(255) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pob_bar` varchar(100) DEFAULT NULL,
  `pob_town` varchar(100) DEFAULT NULL,
  `pob_Provcity` varchar(100) DEFAULT NULL,
  `elem` varchar(100) DEFAULT NULL,
  `elem_date` varchar(20) DEFAULT NULL,
  `highschool` varchar(100) DEFAULT NULL,
  `high_date` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `guardian` varchar(100) DEFAULT NULL,
  `guardian_address` varchar(155) DEFAULT NULL,
  `guardian_occupation` varchar(100) DEFAULT NULL,
  `admittedTo` varchar(155) DEFAULT NULL,
  `picture` longblob DEFAULT NULL,
  `picturepath` varchar(255) DEFAULT NULL,
  `graduate_student_id` int(11) DEFAULT NULL,
  `finance_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `user_events` */

DROP TABLE IF EXISTS `user_events`;

CREATE TABLE `user_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `student` tinyint(1) DEFAULT NULL,
  `employee` tinyint(1) DEFAULT NULL,
  `hashed_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code_until` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent` tinyint(1) DEFAULT NULL,
  `Type_User` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_setup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_users_on_username` (`username`(10)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5629 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `weekdays` */

DROP TABLE IF EXISTS `weekdays`;

CREATE TABLE `weekdays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) DEFAULT NULL,
  `weekday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_weekdays_on_batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Table structure for table `year_level` */

DROP TABLE IF EXISTS `year_level`;

CREATE TABLE `year_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_level` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `ztblbooks` */

DROP TABLE IF EXISTS `ztblbooks`;

CREATE TABLE `ztblbooks` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `IBSN` varchar(13) NOT NULL,
  `BookTitle` varchar(125) NOT NULL,
  `BookDesc` varchar(255) NOT NULL,
  `Author` varchar(125) NOT NULL,
  `PublishDate` date NOT NULL,
  `BookPublisher` varchar(125) NOT NULL,
  `Category` varchar(90) NOT NULL,
  `BookPrice` double NOT NULL,
  `BookQuantity` int(11) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `BookType` varchar(90) NOT NULL,
  `DeweyDecimal` varchar(90) NOT NULL,
  `OverAllQty` int(11) NOT NULL,
  `Donate` tinyint(1) NOT NULL,
  `Remarks` varchar(90) NOT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ztblcategory` */

DROP TABLE IF EXISTS `ztblcategory`;

CREATE TABLE `ztblcategory` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(125) NOT NULL,
  `DDecimal` varchar(90) NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Procedure structure for procedure `get_GradeSheetString_ger2x` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_GradeSheetString_ger2x` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_GradeSheetString_ger2x`(
                                           IN _stud_cat varchar(255),
                                           IN _academice_year VARCHAR(255),
                                           IN _semester VARCHAR(255),
                                           IN _batch varchar(255),
                                           IN _subject VARCHAR(255),
                                           IN _day_sched VARCHAR(255),
                                           IN _time_sched VARCHAR(255),
                                           IN _room VARCHAR(255))
BEGIN
    
      SET @rowMale := 0;
SET @rowFemale  := 0;
SELECT
CASE WHEN gender = 'MALE' THEN @rowMale := @rowMale + 1 ELSE @rowFemale := @rowFemale + 1 END AS 'No.',
person_id,
last_name 'LAST NAME',
first_name 'FIRST NAME',
middle_name 'MIDDLE NAME',
gender,
COURSEYEAR 'COURSE / YEAR',
finalgrade,
StudentSubjID,
GenderOrder
FROM(
     SELECT
	person.person_id,
	person.last_name,
	person.first_name,
	person.middle_name,
	person.gender,
	CONCAT(
		courses.course_name,
		' - ',
	SUBSTRING( students.year_level, 1, 1 )) 'COURSEYEAR',
	students_subjects.id 'StudentSubjID',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 1 AND 
	 student_grade.students_subject_id =      'StudentSubjID' ) 'MIDTERM',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
	student_grade.students_subject_id = 'StudentSubjID' ) 'FINAL',
	CONCAT((
		SELECT
			student_grade.remarks 
		FROM
			student_grade 
		WHERE
			student_grade.students_grading_id = 1 
			AND student_grade.students_subject_id = 'StudentSubjID' 
			),
		' ',
		( SELECT student_grade.remarks FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
		student_grade.students_subject_id =  'StudentSubjID' ) 
	) 'Remarks',
	subjects.id 'ID',
	CONCAT( subjects.`code`, ' - ', subjects.`name` ) AS 'Name',
	CONCAT( 'Units = ', subjects.credit_hours, ', ', 'Amount Unit = ', subjects.amount, ', ', 'Credit Distribution - ',  subjects.creditdistribution ) AS 'Description',
	'' AS 'employee_department_id',
	'' AS 'Deparment',
	students.semester,
	students.academice_year,
	subject_class_schedule.day_schedule_id,
	subject_class_schedule.`day`,
	subject_class_schedule.class_timing_id,
	subject_class_schedule.class_time,
	subject_class_schedule.room_id,
	subject_class_schedule.room,
	students_subjects.finalgrade,
	CASE WHEN person.gender = 'MALE' THEN 'MALE' ELSE 'FEMALE' END AS 'GenderOrder' 
	FROM
	students_subjects
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
	INNER JOIN students ON students_subjects.student_id = students.id
	INNER JOIN student_categories ON students.student_category_id = student_categories.id
	INNER JOIN batches ON students.batch_id = batches.id
	INNER JOIN courses ON students.course_id = courses.id
	INNER JOIN `djemfcst_hris`.`employees` ON subject_class_schedule.employee_id = `djemfcst_hris`.`employees`.SysPK_Empl
	INNER JOIN person ON person.person_id = students.person_id 
	WHERE
	person.status_type_id = 1
	AND student_categories.`name` LIKE _stud_cat 
	AND academice_year like _academice_year 
	AND students.semester like _semester
	AND batches.`name` LIKE _batch
	AND subjects.`name` LIKE _subject
	AND subject_class_schedule.`day` LIKE _day_sched
	AND subject_class_schedule.class_time LIKE _time_sched
	AND subject_class_schedule.room LIKE _room
	
	GROUP BY person_id
	ORDER BY
        gender DESC,
	course_name,
	students.year_level,
	last_name 
	)A
	-- order by GenderOrder,COURSEYEAR,last_name
	;
	  
      
 END */$$
DELIMITER ;

/* Procedure structure for procedure `get_GradeSheet_ger2x` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_GradeSheet_ger2x` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_GradeSheet_ger2x`(
                                           IN _stud_cat INT,
                                           IN _academice_year VARCHAR(255),
                                           IN _semester VARCHAR(255),
                                           IN _batch_id INT,
                                           IN _subject VARCHAR(255),
                                           IN _day_sched VARCHAR(255),
                                           IN _time_sched VARCHAR(255),
                                           IN _room VARCHAR(255))
BEGIN
    
      SET @rowMale := 0;
SET @rowFemale  := 0;
SELECT
CASE WHEN gender = 'MALE' THEN @rowMale := @rowMale + 1 ELSE @rowFemale := @rowFemale + 1 END AS 'No.',
person_id,
last_name 'LAST NAME',
first_name 'FIRST NAME',
middle_name 'MIDDLE NAME',
gender,
COURSEYEAR 'COURSE / YEAR',
finalgrade,
StudentSubjID,
GenderOrder
FROM(
     SELECT
	person.person_id,
	person.last_name,
	person.first_name,
	person.middle_name,
	person.gender,
	CONCAT(
		courses.course_name,
		' - ',
	SUBSTRING( students.year_level, 1, 1 )) 'COURSEYEAR',
	students_subjects.id 'StudentSubjID',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 1 AND 
	 student_grade.students_subject_id =      'StudentSubjID' ) 'MIDTERM',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
	student_grade.students_subject_id = 'StudentSubjID' ) 'FINAL',
	CONCAT((
		SELECT
			student_grade.remarks 
		FROM
			student_grade 
		WHERE
			student_grade.students_grading_id = 1 
			AND student_grade.students_subject_id = 'StudentSubjID' 
			),
		' ',
		( SELECT student_grade.remarks FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
		student_grade.students_subject_id =  'StudentSubjID' ) 
	) 'Remarks',
	subjects.id 'ID',
	CONCAT( subjects.`code`, ' - ', subjects.`name` ) AS 'Name',
	CONCAT( 'Units = ', subjects.credit_hours, ', ', 'Amount Unit = ', subjects.amount, ', ', 'Credit Distribution - ',  subjects.creditdistribution ) AS 'Description',
	'' AS 'employee_department_id',
	'' AS 'Deparment',
	students.semester,
	students.academice_year,
	subject_class_schedule.day_schedule_id,
	subject_class_schedule.`day`,
	subject_class_schedule.class_timing_id,
	subject_class_schedule.class_time,
	subject_class_schedule.room_id,
	subject_class_schedule.room,
	students_subjects.finalgrade,
	CASE WHEN person.gender = 'MALE' THEN 'MALE' ELSE 'FEMALE' END AS 'GenderOrder' 
	FROM
	students_subjects
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
	INNER JOIN students ON students_subjects.student_id = students.id
	INNER JOIN courses ON students.course_id = courses.id
	INNER JOIN `djemfcst_hris`.`employees` ON subject_class_schedule.employee_id = `djemfcst_hris`.`employees`.SysPK_Empl
	INNER JOIN person ON person.person_id = students.person_id 
	WHERE
	person.status_type_id = 1
	AND student_category_id = _stud_cat 
	AND academice_year = _academice_year 
	AND semester = _semester
	and students.batch_id = _batch_id
	AND subjects.`name` like _subject
	and subject_class_schedule.`day` like _day_sched
	and subject_class_schedule.class_time like _time_sched
	and subject_class_schedule.room like _room
	
	ORDER BY
        gender DESC,
	course_name,
	year_level,
	last_name 
	)A
	-- order by GenderOrder,COURSEYEAR,last_name
	;
	  
      
 END */$$
DELIMITER ;

/* Procedure structure for procedure `get_grade_sheet_ger2x` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_grade_sheet_ger2x` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_grade_sheet_ger2x`(in _subjectid int,in _semester varchar(255),
              in _academice_year varchar(255),      
              in _day_schedule_id int,
              in _class_timing_id int,
              in _room_id varchar(255))
begin
    
        set @rowMale := 0;
        set @rowFemale  := 0;
        SELECT
	 CASE WHEN gender = "MALE" THEN @rowMale := @rowMale + 1 
	     ELSE @rowFemale := @rowFemale + 1 END AS 'NO.',
	person_id,
	last_name 'LAST NAME',
	first_name 'FIRST NAME',
	middle_name 'MIDDLE NAME',
	gender,
	CONCAT(course_name,' ',year_level) 'COURSE / YEAR',
	finalgrade,
	student_subject_id
     	FROM(
		SELECT
		person.person_id,
		person.last_name,
		person.first_name,
		person.middle_name,
		person.gender,
		courses.course_name,
		students.year_level,
		students_subjects.finalgrade,
		students_subjects.id 'student_subject_id',
		subjects.id 'subjectid',
		students.semester,
		students.academice_year,
		day_schedule_id,
		class_timing_id,
		room_id
		
		FROM
		students_subjects
		INNER JOIN subject_class_schedule ON students_subjects.subject_id = subject_class_schedule.subject_id
		INNER JOIN students ON students.id = students_subjects.student_id
		INNER JOIN person ON person.person_id = students.person_id 
		INNER JOIN subjects ON subject_class_schedule.subject_id = subjects.id
		INNER JOIN courses ON students.course_id = courses.id
		WHERE person.status_type_id = 1 AND person.end_time IS NULL and
		      subjects.id = _subjectid and students.semester = _semester and
		      students.academice_year = _academice_year and day_schedule_id = _day_schedule_id and
		      class_timing_id = _class_timing_id and room_id = _room_id
			
	)A  
	ORDER BY gender desc,course_name,last_name
	;
	  
      
 END */$$
DELIMITER ;

/* Procedure structure for procedure `get_NewGradeSheet_ger2x` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_NewGradeSheet_ger2x` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_NewGradeSheet_ger2x`(
                                                IN ListOfID INT)
BEGIN
	     SET @rowMale := 0;
SET @rowFemale  := 0;
SELECT
CASE WHEN gender = 'MALE' THEN @rowMale := @rowMale + 1 ELSE @rowFemale := @rowFemale + 1 END AS 'No.',
person_id,
last_name 'LAST NAME',
first_name 'FIRST NAME',
middle_name 'MIDDLE NAME',
COURSEYEAR 'COURSE / YEAR',
finalgrade,
StudentSubjID,
GenderOrder
FROM(
     SELECT
	person.person_id,
	person.last_name,
	person.first_name,
	person.middle_name,
	person.gender,
	CONCAT(
		courses.course_name,
		' - ',
	SUBSTRING( students.year_level, 1, 1 )) 'COURSEYEAR',
	students_subjects.id 'StudentSubjID',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 1 AND 
	 student_grade.students_subject_id =      'StudentSubjID' ) 'MIDTERM',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
	student_grade.students_subject_id = 'StudentSubjID' ) 'FINAL',
	CONCAT((
		SELECT
			student_grade.remarks 
		FROM
			student_grade 
		WHERE
			student_grade.students_grading_id = 1 
			AND student_grade.students_subject_id = 'StudentSubjID' 
			),
		' ',
		( SELECT student_grade.remarks FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
		student_grade.students_subject_id =  'StudentSubjID' ) 
	) 'Remarks',
	subjects.id 'ID',
	CONCAT( subjects.`code`, ' - ', subjects.`name` ) AS 'Name',
	CONCAT( 'Units = ', subjects.credit_hours, ', ', 'Amount Unit = ', subjects.amount, ', ', 'Credit Distribution - ',  subjects.creditdistribution ) AS 'Description',
	'' AS 'employee_department_id',
	'' AS 'Deparment',
	students.semester,
	students.academice_year,
	subject_class_schedule.day_schedule_id,
	subject_class_schedule.`day`,
	subject_class_schedule.class_timing_id,
	subject_class_schedule.class_time,
	subject_class_schedule.room_id,
	subject_class_schedule.room,
	students_subjects.finalgrade,
	CASE WHEN person.gender = 'MALE' THEN 'MALE' ELSE 'FEMALE' END AS 'GenderOrder' 
	FROM
	students_subjects
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
	INNER JOIN students ON students_subjects.student_id = students.id
	INNER JOIN student_categories ON students.student_category_id = student_categories.id
	INNER JOIN batches ON students.batch_id = batches.id
	INNER JOIN courses ON students.course_id = courses.id
	INNER JOIN `djemfcst_hris`.`employees` ON subject_class_schedule.employee_id = `djemfcst_hris`.`employees`.SysPK_Empl
	INNER JOIN person ON person.person_id = students.person_id 
	WHERE
	person.status_type_id = 1
	AND students_subjects.id IN (ListOfID)
	
	GROUP BY person_id
	ORDER BY
        gender DESC,
	course_name,
	students.year_level,
	last_name 
	)A
	-- order by GenderOrder,COURSEYEAR,last_name
	;
	  
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_Newgrade_sheet_ger2x` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_Newgrade_sheet_ger2x` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_Newgrade_sheet_ger2x`(IN _subjectid INT,
              IN _semester VARCHAR(255),
              IN _academice_year VARCHAR(255),      
              IN _day_schedule_id INT,
              IN _class_timing_id INT,
              IN _room_id VARCHAR(255))
BEGIN
    
      SET @rowMale := 0;
SET @rowFemale  := 0;
SELECT
CASE WHEN gender = 'MALE' THEN @rowMale := @rowMale + 1 ELSE @rowFemale := @rowFemale + 1 END AS 'No.',
person_id,
last_name 'LAST NAME',
first_name 'FIRST NAME',
middle_name 'MIDDLE NAME',
gender,
COURSEYEAR 'COURSE / YEAR',
finalgrade,
StudentSubjID,
GenderOrder
FROM(
     SELECT
	person.person_id,
	person.last_name,
	person.first_name,
	person.middle_name,
	person.gender,
	CONCAT(
		courses.course_name,
		' - ',
	SUBSTRING( students.year_level, 1, 1 )) 'COURSEYEAR',
	students_subjects.id 'StudentSubjID',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 1 AND 
	 student_grade.students_subject_id =      'StudentSubjID' ) 'MIDTERM',
	( SELECT student_grade.grades FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
	student_grade.students_subject_id = 'StudentSubjID' ) 'FINAL',
	CONCAT((
		SELECT
			student_grade.remarks 
		FROM
			student_grade 
		WHERE
			student_grade.students_grading_id = 1 
			AND student_grade.students_subject_id = 'StudentSubjID' 
			),
		' ',
		( SELECT student_grade.remarks FROM student_grade WHERE student_grade.students_grading_id = 2 AND 
		student_grade.students_subject_id =  'StudentSubjID' ) 
	) 'Remarks',
	subjects.id 'ID',
	CONCAT( subjects.`code`, ' - ', subjects.`name` ) AS 'Name',
	CONCAT( 'Units = ', subjects.credit_hours, ', ', 'Amount Unit = ', subjects.amount, ', ', 'Credit Distribution - ',  subjects.creditdistribution ) AS 'Description',
	'' AS 'employee_department_id',
	'' AS 'Deparment',
	students.semester,
	students.academice_year,
	subject_class_schedule.day_schedule_id,
	subject_class_schedule.`day`,
	subject_class_schedule.class_timing_id,
	subject_class_schedule.class_time,
	subject_class_schedule.room_id,
	subject_class_schedule.room,
	students_subjects.finalgrade,
	CASE WHEN person.gender = 'MALE' THEN 'MALE' ELSE 'FEMALE' END AS 'GenderOrder' 
	FROM
	students_subjects
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
	INNER JOIN students ON students_subjects.student_id = students.id
	INNER JOIN courses ON students.course_id = courses.id
	INNER JOIN `djemfcst_hris`.`employees` ON subject_class_schedule.employee_id = `djemfcst_hris`.`employees`.SysPK_Empl
	-- INNER JOIN employee_departments ON employees.employee_department_id = employee_departments.id
	INNER JOIN person ON person.person_id = students.person_id 
	WHERE
	person.status_type_id = 1 AND subjects.id = _subjectid AND semester = _semester AND academice_year = _academice_year
	AND day_schedule_id = _day_schedule_id AND class_timing_id = _class_timing_id AND room_id = _room_id
	-- GROUP BY 	students_subjects.id 
	ORDER BY
        gender DESC,
	course_name,
	year_level,
	last_name 
	)A
	-- order by GenderOrder,COURSEYEAR,last_name
	;
	  
      
 END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
