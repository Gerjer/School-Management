/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : djemfcst_v2

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 12/07/2023 18:08:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for privileges
-- ----------------------------
DROP TABLE IF EXISTS `privileges`;
CREATE TABLE `privileges`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `parent_id` int NULL DEFAULT NULL,
  `status_type_id` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of privileges
-- ----------------------------
INSERT INTO `privileges` VALUES (1, 'FINANCE', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (2, 'FEES', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (3, 'Create Fees  ', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (4, 'Finance Fee Category', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (5, 'STUDENT ASSESSMENT', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (6, 'TRANSACTION', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (7, 'STUDENTS ACCOUNT PAYMENT', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (8, 'MANAGE INCOME/EXPENSE ', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (9, 'ADD INCOME', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (10, 'ADD EXPENSE ', NULL, NULL, NULL, 1, 1);
INSERT INTO `privileges` VALUES (11, 'REGISTRAR ', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (12, 'STUDENT ADMISSION', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (13, 'ADMISSION MODULES', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (14, 'FINAL GRADES', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (15, 'MODULES INFO', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (16, 'FACULTY', NULL, NULL, NULL, 16, 1);
INSERT INTO `privileges` VALUES (17, 'GRADING PERIOD', NULL, NULL, NULL, 16, 1);
INSERT INTO `privileges` VALUES (18, 'MANAGE GRADE', NULL, NULL, NULL, 16, 1);
INSERT INTO `privileges` VALUES (19, 'by Schedule', NULL, NULL, NULL, 16, 1);
INSERT INTO `privileges` VALUES (20, 'by Student ', NULL, NULL, NULL, 16, 1);
INSERT INTO `privileges` VALUES (21, 'GRADE SHEET', NULL, NULL, NULL, 16, 1);
INSERT INTO `privileges` VALUES (22, 'SETUP', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (23, 'STUDENT CATEGORY', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (24, 'COURSE / GRADE', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (25, 'Manage Course Grade Level', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (26, 'Manage Batch or Section', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (27, 'Link/Group Courses', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (28, 'SUBJECT', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (29, 'Credit Distribution', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (30, 'Manage Subject', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (31, 'EMPLOYEE CREDENTIALS', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (32, 'Department', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (33, 'Position', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (34, 'Job Title', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (35, 'PAY GRADES', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (36, 'ROOMS', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (37, 'TIME SCHEDULE', NULL, NULL, NULL, 22, 1);
INSERT INTO `privileges` VALUES (38, 'LISTS', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (39, 'INSTRUCTOR / EMPLOYEE', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (40, 'STUDENTS PROFILE', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (41, 'ADMISSION FILE', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (42, 'SYSTEMS', NULL, NULL, NULL, 42, 1);
INSERT INTO `privileges` VALUES (43, 'USERS', NULL, NULL, NULL, 42, 1);
INSERT INTO `privileges` VALUES (44, 'DB CONNECTION', NULL, NULL, NULL, 42, 1);
INSERT INTO `privileges` VALUES (45, 'PREVILEGE', NULL, NULL, NULL, 42, 1);
INSERT INTO `privileges` VALUES (46, 'ACCESS', NULL, NULL, NULL, 42, 1);
INSERT INTO `privileges` VALUES (47, 'REPORT', NULL, NULL, NULL, 47, 1);
INSERT INTO `privileges` VALUES (48, 'BLANK FORM', NULL, NULL, NULL, 47, 1);
INSERT INTO `privileges` VALUES (49, 'INCOME AND EXPENSE', NULL, NULL, NULL, 47, 1);
INSERT INTO `privileges` VALUES (50, 'BILLING STATEMENT', NULL, NULL, NULL, 47, 1);
INSERT INTO `privileges` VALUES (51, 'REQUISITION FORM', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (52, 'TES APPLICATION', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (53, 'STUDENT ADMISSION LIST', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (54, 'DTR', NULL, NULL, NULL, 42, 1);
INSERT INTO `privileges` VALUES (56, 'ENROLLMENT LIST', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (57, 'ENROLLED LIST', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (58, 'PROMOTIONAL LIST', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (59, 'STUDENT LIST', NULL, NULL, NULL, 38, 1);
INSERT INTO `privileges` VALUES (60, 'TRANSCRIPT OF RECORDS', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (61, 'FORM 9', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (62, 'RATE PER UNIT', NULL, NULL, NULL, 11, 1);
INSERT INTO `privileges` VALUES (63, 'SECTIONING', NULL, NULL, '', 22, 1);
INSERT INTO `privileges` VALUES (64, 'PROSPECTUS', NULL, NULL, '', 16, 1);
INSERT INTO `privileges` VALUES (65, 'EVALUATION FORM', NULL, NULL, NULL, 16, 1);

SET FOREIGN_KEY_CHECKS = 1;
