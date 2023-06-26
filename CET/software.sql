/*
 Navicat MySQL Data Transfer

 Source Server         : XXL
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : software

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 03/06/2023 18:26:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 用户', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change 用户', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 用户', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view 用户', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add captcha store', 8, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (30, 'Can change captcha store', 8, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (31, 'Can delete captcha store', 8, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (32, 'Can view captcha store', 8, 'view_captchastore');
INSERT INTO `auth_permission` VALUES (33, 'Can add 考点', 9, 'add_exam_entry_table');
INSERT INTO `auth_permission` VALUES (34, 'Can change 考点', 9, 'change_exam_entry_table');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 考点', 9, 'delete_exam_entry_table');
INSERT INTO `auth_permission` VALUES (36, 'Can view 考点', 9, 'view_exam_entry_table');
INSERT INTO `auth_permission` VALUES (37, 'Can add 用户名', 10, 'add_user_data');
INSERT INTO `auth_permission` VALUES (38, 'Can change 用户名', 10, 'change_user_data');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 用户名', 10, 'delete_user_data');
INSERT INTO `auth_permission` VALUES (40, 'Can view 用户名', 10, 'view_user_data');
INSERT INTO `auth_permission` VALUES (41, 'Can add 用户考试信息', 11, 'add_user_entry_table');
INSERT INTO `auth_permission` VALUES (42, 'Can change 用户考试信息', 11, 'change_user_entry_table');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 用户考试信息', 11, 'delete_user_entry_table');
INSERT INTO `auth_permission` VALUES (44, 'Can view 用户考试信息', 11, 'view_user_entry_table');
INSERT INTO `auth_permission` VALUES (45, 'Can add paper_text', 12, 'add_paper_text');
INSERT INTO `auth_permission` VALUES (46, 'Can change paper_text', 12, 'change_paper_text');
INSERT INTO `auth_permission` VALUES (47, 'Can delete paper_text', 12, 'delete_paper_text');
INSERT INTO `auth_permission` VALUES (48, 'Can view paper_text', 12, 'view_paper_text');
INSERT INTO `auth_permission` VALUES (49, 'Can add single_choose', 13, 'add_single_choose');
INSERT INTO `auth_permission` VALUES (50, 'Can change single_choose', 13, 'change_single_choose');
INSERT INTO `auth_permission` VALUES (51, 'Can delete single_choose', 13, 'delete_single_choose');
INSERT INTO `auth_permission` VALUES (52, 'Can view single_choose', 13, 'view_single_choose');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (124, 'BCFA', 'bcfa', 'd09979b3124bd2302645311b7185ba0417022a20', '2023-06-03 10:30:14.317364');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (8, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'home', 'exam_entry_table');
INSERT INTO `django_content_type` VALUES (12, 'home', 'paper_text');
INSERT INTO `django_content_type` VALUES (13, 'home', 'single_choose');
INSERT INTO `django_content_type` VALUES (10, 'home', 'user_data');
INSERT INTO `django_content_type` VALUES (11, 'home', 'user_entry_table');
INSERT INTO `django_content_type` VALUES (7, 'login', 'user');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-05-31 10:39:31.105369');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-05-31 10:39:32.019556');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-05-31 10:39:35.579539');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-05-31 10:39:36.989766');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-31 10:39:37.051090');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-05-31 10:39:37.621056');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-05-31 10:39:37.996969');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-05-31 10:39:38.093883');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-05-31 10:39:38.142471');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-05-31 10:39:38.445252');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-05-31 10:39:38.466646');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-05-31 10:39:38.540760');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-05-31 10:39:38.957017');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-05-31 10:39:39.341446');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-05-31 10:39:39.437008');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-05-31 10:39:39.500189');
INSERT INTO `django_migrations` VALUES (17, 'captcha', '0001_initial', '2023-05-31 10:39:39.861083');
INSERT INTO `django_migrations` VALUES (18, 'captcha', '0002_alter_captchastore_id', '2023-05-31 10:39:39.888563');
INSERT INTO `django_migrations` VALUES (19, 'home', '0001_initial', '2023-05-31 10:39:40.861451');
INSERT INTO `django_migrations` VALUES (20, 'login', '0001_initial', '2023-05-31 10:39:41.099412');
INSERT INTO `django_migrations` VALUES (21, 'login', '0002_auto_20190517_2057', '2023-05-31 10:39:41.129392');
INSERT INTO `django_migrations` VALUES (22, 'login', '0003_user_type', '2023-05-31 10:39:41.465379');
INSERT INTO `django_migrations` VALUES (23, 'sessions', '0001_initial', '2023-05-31 10:39:41.630225');
INSERT INTO `django_migrations` VALUES (24, 'home', '0002_auto_20230531_1911', '2023-05-31 11:11:36.562610');
INSERT INTO `django_migrations` VALUES (25, 'home', '0003_auto_20230601_1206', '2023-06-01 04:07:11.935098');
INSERT INTO `django_migrations` VALUES (26, 'home', '0004_user_entry_table_id_card', '2023-06-01 04:46:51.180783');
INSERT INTO `django_migrations` VALUES (27, 'home', '0005_auto_20230601_1251', '2023-06-01 04:51:55.797423');
INSERT INTO `django_migrations` VALUES (28, 'home', '0006_auto_20230601_1418', '2023-06-01 06:18:23.194341');
INSERT INTO `django_migrations` VALUES (29, 'home', '0007_paper_text_single_choose', '2023-06-01 09:46:43.170202');
INSERT INTO `django_migrations` VALUES (30, 'home', '0008_auto_20230601_1944', '2023-06-01 11:44:17.202513');
INSERT INTO `django_migrations` VALUES (31, 'home', '0009_user_entry_table_status', '2023-06-03 05:53:47.707097');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('haw0utki4r7jj8mfe1rsnbycwsbjj98m', 'NzRjYTM1OTAzZTcyMzY3YmUzZDdmYTRlYTc5MzMwYzAwNTA4MDk3Mjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjo3LCJ1c2VyX25hbWUiOiJNWFkifQ==', '2023-06-17 08:38:53.439194');
INSERT INTO `django_session` VALUES ('lszjuunf006qdcv9b13e36cq4w22t3ck', '.eJyrVsosjs_JT8_MU7IqKSpN1VEqLU4tis9MUbKygLLzEnNTlayUAgIjlaAiJZUFIJHiktKU1LwSpVoARTwX1A:1q5ORw:EQa5YTaxm89dGPq-U_NRV5oZKi_RS091od8_U4br3WU', '2023-06-17 10:25:32.328984');

-- ----------------------------
-- Table structure for home_exam_entry_table
-- ----------------------------
DROP TABLE IF EXISTS `home_exam_entry_table`;
CREATE TABLE `home_exam_entry_table`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_point` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exam_time` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `number` int NOT NULL,
  `entry_number` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home_exam_entry_table
-- ----------------------------
INSERT INTO `home_exam_entry_table` VALUES (3, '南开大学津南校区', '2023-06-15', 98, 2);
INSERT INTO `home_exam_entry_table` VALUES (7, '南开大学八里台校区', '2023-06-15', 177, 3);
INSERT INTO `home_exam_entry_table` VALUES (9, '南开大学津南校区', '2023-12-15', 500, 0);
INSERT INTO `home_exam_entry_table` VALUES (10, '天津大学北洋园校区', '2023-12-15', 499, 1);
INSERT INTO `home_exam_entry_table` VALUES (11, '南开大学八里台校区', '2023-12-15', 180, 0);
INSERT INTO `home_exam_entry_table` VALUES (12, '天津大学卫津路校区', '2023-06-17', 180, 0);

-- ----------------------------
-- Table structure for home_paper_text
-- ----------------------------
DROP TABLE IF EXISTS `home_paper_text`;
CREATE TABLE `home_paper_text`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reading` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `writing` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `translation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home_paper_text
-- ----------------------------
INSERT INTO `home_paper_text` VALUES (1, 'The ability to make inferences from same and different, once thought to be unique to humans, is viewed as a cornerstone of abstract intelligent thought. A new  study, however, has  shown that what psychologists call  same- different discrimination is present in creatures generally seen as unintelligent: newborn ducklings (小鸭) .\r\nThe  study, published  Thursday  in  Science,  challenges  our  idea  of what  it means to have  a birdbrain,  said Edward Wasserman, an experimental psychologist at the University of Iowa who wrote an independent review of the study.\r\n\"In fact, birds are extremely intelligent and our problem pretty much lies in figuring out how to get them to \'talk\' to us, or tell us how smart they really are,\"he said.\r\nAntone Martinho and Alex Kacelnik, co-authors of the new paper, devised a clever experiment to better test bird  intelligence.\r\nFirst, they took  1-day-old  ducklings  and  exposed them to  a pair  of moving  objects.  The two  objects were either  the  same  or  different  in  shape  or  color.  Then  they  exposed  each  duckling  to  two  entirely  new  pairs  of moving  objects.\r\nThe  researchers  found  that  about  70%  of the  ducklings  preferred  to  move  toward  the  pair  of objects  that had the same shape or color relationship as the first objects they saw. A duckling that was first shown two green spheres, in other words, was more likely to move toward a pair of blue spheres than a mismatched pair of orange and purple  spheres.\r\nDucklings go through a rapid learning process called imprinting shortly after birth—it\'s what allows them to identify and follow their mothers.\r\nThese  findings  suggest  that  ducklings  use  abstract  relationships  between  sensory  inputs  like  color,  shape, sounds and odor to recognize their mothers, said Dr. Kacelnik.\r\nBy  studying  imprinting,  the  authors  of this  study  have  shown  for  the  first  time  that  an  animal  can  learn relationships  between  concepts  without  training,  said  Jeffrey  Katz,  an  experimental  psychologist  at  Auburn University who was not involved in the study.\r\nPrevious  studies  have  suggested  that  other  animals,  including  pigeons,  dolphins,  honeybees  and  some primates(灵长类动物), can discern same from different, but only after extensive training.\r\nAdding   ducklings   to   the   list—particularly   untrained   newborn   ducklings—suggests   that   the   ability   to compare  abstract  concepts  \"is  far  more  necessary  to  a  wider  variety  of animals\'  survival  than  we  previously thought,\"Dr. Martinho  said. He believes the ability is  so crucial because it helps animals consider context when identifying  objects in their environment.\r\nIt\'s clear from this study and others like it that \"animals process and appreciate far more of the intricacies in their world  than  we\'ve  ever understood,\"Dr.  Wasserman  said.\"We  are  in  a  revolutionary phase  in  terms  of our ability to understand the minds of other animals.\"', 'Directions:  For this part, you  are  allowed  30 minutes  to write  an  essay  that begins with  the  sentence  \"People are  now  increasingly  aware  of the  danger  of \'appearance  anxiety\'or  being  obsessed  with  one\'s  looks.\"You  can make comments, cite examples or use your personal experiences to develop your essay. You should write at least\r\n150 words but no more than 200 words.', '徐霞客是中国明代的著名地理学家。他花费了三十多年的时间游遍了大半个中国。他主要靠徒步 跋涉，寻访了许多荒远偏僻的地区。他把自己的见闻和考察结果详细记录下来，为后人留下了珍贵的 考察资料。他通过对许多河流的实地调查，纠正了文献中关于水源的错误。他还详细地描述了地形、 气候等因素对植物的影响，生动地描绘了各地的名胜古迹和风土人情。他的考察记录由后人整理成了 《徐霞客游记》,在国内外产生了广泛的影响。');

-- ----------------------------
-- Table structure for home_single_choose
-- ----------------------------
DROP TABLE IF EXISTS `home_single_choose`;
CREATE TABLE `home_single_choose`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int NOT NULL,
  `qu_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `A` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `B` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `C` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `D` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ans` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home_single_choose
-- ----------------------------
INSERT INTO `home_single_choose` VALUES (1, 1, 'listening', NULL, 'In a food store.', 'In a restaurant.', 'In a kitchen.', 'In a supermarket.', 'B');
INSERT INTO `home_single_choose` VALUES (2, 1, 'listening', NULL, 'She  eats meat occasionally.', 'She enjoys cheeseburgers.', 'She  is  a partial vegetarian.', 'She is allergic to seafood.', 'C');
INSERT INTO `home_single_choose` VALUES (3, 1, 'listening', NULL, 'Changing  one\'s  eating habit.', 'Dealing with one\'s colleagues.', 'Following the same diet for years.', 'Keeping awake at morning meetings.', 'A');
INSERT INTO `home_single_choose` VALUES (4, 1, 'listening', NULL, 'They are both animal lovers.', 'They  enjoy  perfect  health.', 'They only eat organic food.', 'They are cutting back on coffee.', 'B');
INSERT INTO `home_single_choose` VALUES (5, 1, 'reading', 'In what way were humans thought to be unique?', 'Being  capable  of same-different  discrimination.', 'Being able to distinguish abstract from concrete. ', 'Being a major source of animal intelligence.', 'Being the cornerstone of the creative world.', 'A');
INSERT INTO `home_single_choose` VALUES (6, 1, 'reading', 'What do we learn from the study published in Science?', 'Our understanding of the bird world was biased.', 'Our communication with birds was far from adequate.', 'Our  knowledge  about  bird  psychology  needs  updating.', 'Our  conception  of  birds\'intelligence  was  wrong.', 'D');
INSERT INTO `home_single_choose` VALUES (7, 1, 'reading', 'What  did  the  researchers  discover  about  most  ducklings  from  their  experiment?', 'They  could  associate  shape  with  color.', 'They  could  tell  whether  the  objects  were  the  same.', 'They  preferred  colored  objects  to  colorless  ones.', 'They  reacted  quickly  to  moving  objects.', 'B');
INSERT INTO `home_single_choose` VALUES (8, 1, 'reading', 'What  was  novel  about  the  experiment  in  the  study  reported  in  Science?', 'The  ducklings  were  compared  with  other  animals.', 'It  was  conducted  by  experimental  psychologists.', 'The  animals  used  received  no  training.', 'It used  a number  of colors  and  shapes.', 'C');
INSERT INTO `home_single_choose` VALUES (9, 1, 'reading', 'What  do  we  learn  from  Dr.  Wasserman\'s  comment  on  the  study  of animal  minds  at  the  end  of the  passage?', 'Research  methods  are  being  updated.', ' It  is  getting  more  and  more  intricate.', 'It  is  attracting  more  public  attention.', 'Remarkable  progress  is  being  made.', 'D');

-- ----------------------------
-- Table structure for home_user_data
-- ----------------------------
DROP TABLE IF EXISTS `home_user_data`;
CREATE TABLE `home_user_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_true_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_school` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_f_score` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home_user_data
-- ----------------------------
INSERT INTO `home_user_data` VALUES (18, 'XXL', '无', '无', '无', '未通过');
INSERT INTO `home_user_data` VALUES (19, 'MXY', '无', '无', '无', '未通过');
INSERT INTO `home_user_data` VALUES (20, 'PQY', '潘桥', '120104199001010630', '南开大学', '通过');
INSERT INTO `home_user_data` VALUES (21, 'JLX', '贾', '120104199001010627', '南开大学', '通过');

-- ----------------------------
-- Table structure for home_user_entry_table
-- ----------------------------
DROP TABLE IF EXISTS `home_user_entry_table`;
CREATE TABLE `home_user_entry_table`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exam_point` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exam_time` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `listening` int NOT NULL,
  `reading` int NOT NULL,
  `total` int NOT NULL,
  `writing` int NOT NULL,
  `ID_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tran_ans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wri_ans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home_user_entry_table
-- ----------------------------
INSERT INTO `home_user_entry_table` VALUES (6, '123@qq.com', '南开大学津南校区', '2023-6-1', 0, 0, 15, 15, '120104199001010630', '', 'jhgcfhvj', '已出分');
INSERT INTO `home_user_entry_table` VALUES (9, '456@qq.com', '南开大学八里台校区', '2023-6-15', 20, 10, 80, 50, '120104199001010627', 'preferred to move toward the pair of objects that had the same shape or color relationship as the first objects they saw. A duckling that was first shown two green spheres, in other words, was more likely to move toward a pair of blue spheres than a mismatched pair of orange and purple spheres. Ducklings go through a rapid learning process called imprinting shortly after birth—it\'s what allows them to identify and follow their mothers. These findings suggest that ducklings use abstract relationships between sensory inputs like color, shape, sounds and odor to recognize their mothers, said Dr. Kacelnik. By studying imprinting, the authors of this study have shown for the first time that an animal can learn relationships between concepts without training, said Jeffrey Katz, an experimental psychologist at Auburn University who was not involve', 'For this part, you are allowed 30 minutes to write an essay that begins with the sentence \"People are now increasingly aware of the danger of \'appearance anxiety\'or being obsessed with one\'s looks.\"You can make comments, cite examples or use your personal experiences to develop your essay. You should write at least 150 words but no more than 200 words.', '已出分');
INSERT INTO `home_user_entry_table` VALUES (10, '123@qq.com', '天津大学北洋园校区', '2023-12-15', 10, 10, 120, 100, '120104199001010630', 'his part, you are allowed 30 minutes to write an essay that begins with the sentence \"People are now increasingly aware of the danger of \'appearance anxiety\'or being obsessed with one\'s looks.\"You can make com', 'his part, you are allowed 30 minutes to write an essay that begins with the sentence \"People are now increasingly aware of the danger of \'appearance anxiety\'or being obsessed with one\'s looks.\"You can make com', '已出分');

-- ----------------------------
-- Table structure for login_user
-- ----------------------------
DROP TABLE IF EXISTS `login_user`;
CREATE TABLE `login_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of login_user
-- ----------------------------
INSERT INTO `login_user` VALUES (6, 'XXL', '2345', '234@qq.com', 'female', '2023-06-01 05:56:08.331297', 'teacher');
INSERT INTO `login_user` VALUES (7, 'MXY', '3456', '345@qq.com', 'female', '2023-06-01 06:12:08.544769', 'manager');
INSERT INTO `login_user` VALUES (8, 'PQY', '1234', '123@qq.com', 'female', '2023-06-01 06:20:41.211880', 'student');
INSERT INTO `login_user` VALUES (9, 'JLX', '4567', '456@qq.com', 'female', '2023-06-03 05:23:53.225827', 'student');

SET FOREIGN_KEY_CHECKS = 1;
