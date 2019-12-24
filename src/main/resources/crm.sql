/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50646
 Source Host           : 47.104.70.108:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50646
 File Encoding         : 65001

 Date: 24/12/2019 22:10:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_id` bigint(20) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'boss', '总经办', NULL, NULL, NULL);
INSERT INTO `department` VALUES (2, 'market', '市场部', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for emp_role
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` bigint(20) NOT NULL,
  `r_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of emp_role
-- ----------------------------
INSERT INTO `emp_role` VALUES (1, 13, 5);
INSERT INTO `emp_role` VALUES (2, 13, 6);
INSERT INTO `emp_role` VALUES (4, 11, 6);
INSERT INTO `emp_role` VALUES (5, 6, 6);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inputtime` date NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT NULL,
  `admin` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_dept`(`dept_id`) USING BTREE,
  CONSTRAINT `FK_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '??', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (2, 'zhangsan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (3, 'zhangsan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (4, 'lisi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (5, '??', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (6, '李四', '李四', '222', '911', 1, '123@qq.com', '2019-12-03', 0, 0);
INSERT INTO `employee` VALUES (7, 'admin', NULL, '123', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `employee` VALUES (8, '32432', '3243', '888888', '43543543', 2, '123456@163.com', '2019-12-07', 0, 0);
INSERT INTO `employee` VALUES (9, 'dsfds', 'aaa', '888888', '23143242', 2, '123456@163.com', '2019-12-07', 0, 0);
INSERT INTO `employee` VALUES (10, 'dsfsd', '2222', '888888', '3423432', 2, '1332441997@qq.com', '2019-12-14', 0, 0);
INSERT INTO `employee` VALUES (11, 'shiki', 'shiki', '888888', '11111', 2, '123456@163.com', '2019-12-13', 1, 0);
INSERT INTO `employee` VALUES (12, 'wangwu', 'wangwu', '888888', '23143242', 2, '1332441997@qq.com', '2019-12-07', 1, 0);
INSERT INTO `employee` VALUES (13, '王五', '王五', '888888', '23143242', 2, '123456@163.com', '2019-12-22', 1, 0);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opUser_id` bigint(20) NULL DEFAULT NULL,
  `opTime` datetime(0) NULL DEFAULT NULL,
  `opIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_emp`(`opUser_id`) USING BTREE,
  CONSTRAINT `FK_emp` FOREIGN KEY (`opUser_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 284 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, NULL, '2019-12-08 19:09:31', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@615a499b:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (2, 7, '2019-12-08 19:09:39', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@92fd7f8:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (3, 7, '2019-12-08 19:09:39', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@615a499b:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (4, 7, '2019-12-08 19:09:50', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@615a499b:int com.shiki.crm.service.IEmployeeService.updateByPrimaryKey(Employee)', '[{\"id\":11,\"username\":\"shiki\",\"realname\":\"shiki\",\"password\":null,\"tel\":\"11111\",\"dept\":{\"id\":2,\"sn\":null,\"name\":null,\"manager\":null,\"parent\":null,\"state\":null},\"email\":\"123456@163.com\",\"inputtime\":\"2019-12-13\",\"state\":null,\"admin\":null}]');
INSERT INTO `log` VALUES (5, 7, '2019-12-08 19:09:51', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@615a499b:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (6, NULL, '2019-12-11 23:04:05', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@61da1c1e:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[null,null]');
INSERT INTO `log` VALUES (7, NULL, '2019-12-11 23:04:18', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@61da1c1e:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (8, 7, '2019-12-11 23:04:24', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@c9581a3:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (9, 7, '2019-12-11 23:04:24', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@61da1c1e:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (10, NULL, '2019-12-15 00:26:25', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@6a33be05:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (11, NULL, '2019-12-15 01:03:53', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@204035c0:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (12, NULL, '2019-12-15 14:55:16', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@43f91974:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (13, 7, '2019-12-15 14:55:34', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (14, 7, '2019-12-15 14:58:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (15, 7, '2019-12-15 14:59:42', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (16, 7, '2019-12-15 15:00:59', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (17, 7, '2019-12-15 15:02:22', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (18, 7, '2019-12-15 15:12:20', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (19, 7, '2019-12-15 15:12:42', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (20, 7, '2019-12-15 15:13:03', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (21, 7, '2019-12-15 15:19:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (22, 7, '2019-12-15 15:24:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (23, 7, '2019-12-15 15:26:29', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (24, 7, '2019-12-15 15:27:24', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (25, 7, '2019-12-15 15:27:39', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (26, 7, '2019-12-15 15:29:22', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (27, 7, '2019-12-15 15:30:46', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (28, 7, '2019-12-15 15:32:02', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@799a7b57:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (29, NULL, '2019-12-15 16:02:13', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@27f2a32c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (30, 7, '2019-12-15 16:02:18', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@53ed522a:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (31, 7, '2019-12-15 16:02:18', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@78b10b5b:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (32, NULL, '2019-12-15 16:25:07', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@27f2a32c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (33, 7, '2019-12-15 16:25:12', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@448500b3:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (34, 7, '2019-12-15 16:25:12', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@59be4341:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (35, 7, '2019-12-15 16:25:23', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@448500b3:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (36, 7, '2019-12-15 16:25:23', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@59be4341:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (38, NULL, '2019-12-15 16:30:08', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@48b5c74d:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (39, 7, '2019-12-15 16:30:15', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@48406576:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (40, 7, '2019-12-15 16:30:15', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@328aee19:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (41, 7, '2019-12-15 16:30:22', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@48406576:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (42, 7, '2019-12-15 16:30:22', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@328aee19:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (46, 7, '2019-12-15 16:46:12', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@48406576:int com.shiki.crm.service.IRoleService.insert(Role)', '[{\"id\":5,\"name\":\"超级管理员\",\"sn\":\"admin\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null},{\"id\":2,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES (47, 7, '2019-12-15 16:47:06', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@48406576:int com.shiki.crm.service.IRoleService.insert(Role)', '[{\"id\":6,\"name\":\"普通管理员\",\"sn\":\"normal\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null},{\"id\":2,\"name\":null,\"resource\":null},{\"id\":3,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES (48, NULL, '2019-12-15 17:24:11', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@68e5b616:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (49, 7, '2019-12-15 17:24:15', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@1b9849c5:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (50, 7, '2019-12-15 17:24:15', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2424d5aa:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (51, 7, '2019-12-15 17:25:33', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2424d5aa:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (52, 7, '2019-12-15 17:25:33', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@1b9849c5:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (53, NULL, '2019-12-15 20:04:15', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@7a6b9af4:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (54, 7, '2019-12-15 20:04:19', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@cdb6485:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (55, 7, '2019-12-15 20:04:19', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@46738e3b:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (56, NULL, '2019-12-15 20:24:15', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@43f91974:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (57, 7, '2019-12-15 20:24:19', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@1bdf14c:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (58, 7, '2019-12-15 20:24:19', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@57aaeba0:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (59, 7, '2019-12-15 20:24:26', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@1bdf14c:PageResult com.shiki.crm.service.IPermissionService.queryByRid(Long)', '[5]');
INSERT INTO `log` VALUES (60, NULL, '2019-12-15 20:36:44', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@70902712:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (61, NULL, '2019-12-15 20:38:32', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@4da503af:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (62, 7, '2019-12-15 20:38:36', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@7b87b4f2:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (63, 7, '2019-12-15 20:38:36', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@101c211f:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (64, 7, '2019-12-15 20:38:39', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@101c211f:PageResult com.shiki.crm.service.IPermissionService.queryByRid(Long)', '[5]');
INSERT INTO `log` VALUES (65, 7, '2019-12-15 20:38:48', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@7b87b4f2:int com.shiki.crm.service.IRoleService.updateByPrimaryKey(Role)', '[{\"id\":5,\"name\":\"超级管理员\",\"sn\":\"admin\",\"permissions\":[{\"id\":1,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES (66, 7, '2019-12-15 20:38:50', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@7b87b4f2:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (67, 7, '2019-12-15 20:38:52', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@101c211f:PageResult com.shiki.crm.service.IPermissionService.queryByRid(Long)', '[5]');
INSERT INTO `log` VALUES (68, NULL, '2019-12-22 14:28:46', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@38a92549:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123456\"]');
INSERT INTO `log` VALUES (69, NULL, '2019-12-22 14:29:01', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@38a92549:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (70, 7, '2019-12-22 14:29:13', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@65e93234:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (71, 7, '2019-12-22 14:29:13', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@38a92549:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (72, 7, '2019-12-22 14:36:25', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@65e93234:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (73, 7, '2019-12-22 14:37:04', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@65e93234:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (74, 7, '2019-12-22 14:37:04', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@38a92549:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (75, NULL, '2019-12-22 14:41:03', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@3ca9d7be:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (76, 7, '2019-12-22 14:41:08', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@547b18e0:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (77, 7, '2019-12-22 14:41:08', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@4333f70b:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (78, 7, '2019-12-22 14:41:08', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@3ca9d7be:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (79, 7, '2019-12-22 14:43:19', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@4333f70b:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (80, 7, '2019-12-22 14:43:19', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@547b18e0:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (81, 7, '2019-12-22 14:43:19', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@3ca9d7be:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (82, 7, '2019-12-22 14:47:41', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@547b18e0:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (83, 7, '2019-12-22 14:47:41', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@4333f70b:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (84, 7, '2019-12-22 14:47:41', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@3ca9d7be:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (85, NULL, '2019-12-22 15:00:05', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@17433325:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (86, 7, '2019-12-22 15:00:08', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@7eedff19:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (87, 7, '2019-12-22 15:00:08', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@43b1b051:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (88, 7, '2019-12-22 15:00:09', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@17433325:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (89, 7, '2019-12-22 15:00:58', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@17433325:int com.shiki.crm.service.IEmployeeService.insert(Employee)', '[{\"id\":13,\"username\":\"王五\",\"realname\":\"王五\",\"password\":\"888888\",\"tel\":\"23143242\",\"dept\":{\"id\":2,\"sn\":null,\"name\":null,\"manager\":null,\"parent\":null,\"state\":null},\"email\":\"123456@163.com\",\"inputtime\":\"2019-12-22\",\"state\":true,\"admin\":false,\"roles\":[{\"id\":5,\"name\":null,\"sn\":null,\"permissions\":null},{\"id\":6,\"name\":null,\"sn\":null,\"permissions\":null}]}]');
INSERT INTO `log` VALUES (90, 7, '2019-12-22 15:00:59', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@17433325:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (91, 7, '2019-12-22 15:05:33', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@7eedff19:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (92, 7, '2019-12-22 15:05:33', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@43b1b051:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (93, 7, '2019-12-22 15:05:33', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@17433325:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (94, NULL, '2019-12-22 15:22:03', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (95, 7, '2019-12-22 15:22:07', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (96, 7, '2019-12-22 15:22:07', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@27f1717f:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (97, 7, '2019-12-22 15:22:07', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (98, 7, '2019-12-22 15:22:10', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[13]');
INSERT INTO `log` VALUES (99, 7, '2019-12-22 15:23:09', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (100, 7, '2019-12-22 15:23:12', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@27f1717f:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (101, 7, '2019-12-22 15:23:12', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (102, 7, '2019-12-22 15:23:12', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (103, 7, '2019-12-22 15:23:16', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[13]');
INSERT INTO `log` VALUES (104, 7, '2019-12-22 15:23:58', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[11]');
INSERT INTO `log` VALUES (105, 7, '2019-12-22 15:24:11', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:int com.shiki.crm.service.IEmployeeService.updateByPrimaryKey(Employee)', '[{\"id\":11,\"username\":\"shiki\",\"realname\":\"shiki\",\"password\":null,\"tel\":\"11111\",\"dept\":{\"id\":2,\"sn\":null,\"name\":null,\"manager\":null,\"parent\":null,\"state\":null},\"email\":\"123456@163.com\",\"inputtime\":\"2019-12-13\",\"state\":null,\"admin\":null,\"roles\":[{\"id\":5,\"name\":null,\"sn\":null,\"permissions\":null}]}]');
INSERT INTO `log` VALUES (106, 7, '2019-12-22 15:24:12', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (107, 7, '2019-12-22 15:24:17', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[11]');
INSERT INTO `log` VALUES (108, 7, '2019-12-22 15:26:43', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[11]');
INSERT INTO `log` VALUES (109, 7, '2019-12-22 15:29:03', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (110, 7, '2019-12-22 15:29:09', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@27f1717f:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (111, 7, '2019-12-22 15:29:09', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (112, 7, '2019-12-22 15:29:09', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (113, 7, '2019-12-22 15:29:13', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[11]');
INSERT INTO `log` VALUES (114, 7, '2019-12-22 15:29:18', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:int com.shiki.crm.service.IEmployeeService.update(Employee)', '[{\"id\":11,\"username\":\"shiki\",\"realname\":\"shiki\",\"password\":null,\"tel\":\"11111\",\"dept\":{\"id\":2,\"sn\":null,\"name\":null,\"manager\":null,\"parent\":null,\"state\":null},\"email\":\"123456@163.com\",\"inputtime\":\"2019-12-13\",\"state\":null,\"admin\":null,\"roles\":[{\"id\":5,\"name\":null,\"sn\":null,\"permissions\":null}]}]');
INSERT INTO `log` VALUES (115, 7, '2019-12-22 15:29:20', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (116, 7, '2019-12-22 15:29:21', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@72c78eb5:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[11]');
INSERT INTO `log` VALUES (117, 7, '2019-12-22 15:29:29', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:int com.shiki.crm.service.IEmployeeService.update(Employee)', '[{\"id\":11,\"username\":\"shiki\",\"realname\":\"shiki\",\"password\":null,\"tel\":\"11111\",\"dept\":{\"id\":2,\"sn\":null,\"name\":null,\"manager\":null,\"parent\":null,\"state\":null},\"email\":\"123456@163.com\",\"inputtime\":\"2019-12-13\",\"state\":null,\"admin\":null,\"roles\":[{\"id\":6,\"name\":null,\"sn\":null,\"permissions\":null}]}]');
INSERT INTO `log` VALUES (118, 7, '2019-12-22 15:29:31', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (119, NULL, '2019-12-22 16:30:10', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (120, 7, '2019-12-22 16:30:15', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@2f68fc27:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (121, 7, '2019-12-22 16:30:15', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@378433af:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (122, 7, '2019-12-22 16:30:16', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (123, NULL, '2019-12-22 16:42:24', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@1cf692f5:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (124, 7, '2019-12-22 16:42:27', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@558cbf81:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (125, 7, '2019-12-22 16:42:27', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@25cd5404:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (126, 7, '2019-12-22 16:42:28', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@1cf692f5:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (127, NULL, '2019-12-22 17:28:26', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@60da3c6b:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"王五\",\"888888\"]');
INSERT INTO `log` VALUES (128, 13, '2019-12-22 17:28:27', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[13]');
INSERT INTO `log` VALUES (129, 13, '2019-12-22 17:28:46', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public java.lang.String com.shiki.crm.web.controller.EmployeeController.index()\"]');
INSERT INTO `log` VALUES (130, 13, '2019-12-22 17:28:47', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:public java.util.List com.shiki.crm.web.controller.DepartmentController.queryForEmp()\"]');
INSERT INTO `log` VALUES (131, 13, '2019-12-22 17:28:47', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleForEmp()\"]');
INSERT INTO `log` VALUES (132, 13, '2019-12-22 17:28:47', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (133, 13, '2019-12-22 17:28:47', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@2c60625a:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (134, 13, '2019-12-22 17:28:47', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@45ef446b:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (135, 13, '2019-12-22 17:28:47', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@60da3c6b:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (136, 13, '2019-12-22 17:29:17', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.lang.String com.shiki.crm.web.controller.RoleController.role()\"]');
INSERT INTO `log` VALUES (137, 13, '2019-12-22 17:29:18', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.RoleController.list(com.shiki.crm.query.QueryObject)\"]');
INSERT INTO `log` VALUES (138, 13, '2019-12-22 17:29:18', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.PermissionController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.PermissionController.queryPermissionForPage(com.shiki.crm.query.PermissionQueryObject)\"]');
INSERT INTO `log` VALUES (139, 13, '2019-12-22 17:29:18', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (140, 13, '2019-12-22 17:29:18', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@45ef446b:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (141, 13, '2019-12-22 17:29:56', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@60da3c6b:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (142, 7, '2019-12-22 17:29:56', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@3536ab33:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[7]');
INSERT INTO `log` VALUES (143, NULL, '2019-12-22 17:35:14', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (144, 7, '2019-12-22 17:35:14', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[7]');
INSERT INTO `log` VALUES (145, 7, '2019-12-22 17:35:25', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public java.lang.String com.shiki.crm.web.controller.EmployeeController.index()\"]');
INSERT INTO `log` VALUES (146, 7, '2019-12-22 17:35:25', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:public java.util.List com.shiki.crm.web.controller.DepartmentController.queryForEmp()\"]');
INSERT INTO `log` VALUES (147, 7, '2019-12-22 17:35:25', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleForEmp()\"]');
INSERT INTO `log` VALUES (148, 7, '2019-12-22 17:35:26', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (149, 7, '2019-12-22 17:35:26', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (150, 7, '2019-12-22 17:35:26', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (151, 7, '2019-12-22 17:35:26', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (152, 7, '2019-12-22 17:36:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public java.lang.String com.shiki.crm.web.controller.EmployeeController.index()\"]');
INSERT INTO `log` VALUES (153, 7, '2019-12-22 17:36:25', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:public java.util.List com.shiki.crm.web.controller.DepartmentController.queryForEmp()\"]');
INSERT INTO `log` VALUES (154, 7, '2019-12-22 17:36:27', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleForEmp()\"]');
INSERT INTO `log` VALUES (155, 7, '2019-12-22 17:36:27', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (156, 7, '2019-12-22 17:36:27', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (157, 7, '2019-12-22 17:36:27', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (158, 7, '2019-12-22 17:36:27', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (159, 7, '2019-12-22 17:36:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public java.lang.String com.shiki.crm.web.controller.EmployeeController.index()\"]');
INSERT INTO `log` VALUES (160, 7, '2019-12-22 17:36:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleForEmp()\"]');
INSERT INTO `log` VALUES (161, 7, '2019-12-22 17:36:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:public java.util.List com.shiki.crm.web.controller.DepartmentController.queryForEmp()\"]');
INSERT INTO `log` VALUES (162, 7, '2019-12-22 17:36:45', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (163, 7, '2019-12-22 17:36:45', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (164, 7, '2019-12-22 17:36:45', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (165, 7, '2019-12-22 17:36:45', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (166, 7, '2019-12-22 17:37:09', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public java.lang.String com.shiki.crm.web.controller.EmployeeController.index()\"]');
INSERT INTO `log` VALUES (167, 7, '2019-12-22 17:37:12', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:public java.util.List com.shiki.crm.web.controller.DepartmentController.queryForEmp()\"]');
INSERT INTO `log` VALUES (168, 7, '2019-12-22 17:37:13', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleForEmp()\"]');
INSERT INTO `log` VALUES (169, 7, '2019-12-22 17:37:13', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (170, 7, '2019-12-22 17:37:13', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (171, 7, '2019-12-22 17:37:13', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (172, 7, '2019-12-22 17:37:13', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (173, 7, '2019-12-22 17:37:57', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.lang.String com.shiki.crm.web.controller.RoleController.role()\"]');
INSERT INTO `log` VALUES (174, 7, '2019-12-22 17:37:58', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.RoleController.list(com.shiki.crm.query.QueryObject)\"]');
INSERT INTO `log` VALUES (175, 7, '2019-12-22 17:37:58', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.PermissionController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.PermissionController.queryPermissionForPage(com.shiki.crm.query.PermissionQueryObject)\"]');
INSERT INTO `log` VALUES (176, 7, '2019-12-22 17:37:58', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (177, 7, '2019-12-22 17:37:58', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:PageResult com.shiki.crm.service.IPermissionService.selectByCondition(QueryObject)', '[{\"page\":1,\"rows\":10,\"rid\":null,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (178, 7, '2019-12-22 17:38:13', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleIdByEid(java.lang.Long)\"]');
INSERT INTO `log` VALUES (179, 7, '2019-12-22 17:38:13', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[6]');
INSERT INTO `log` VALUES (180, 7, '2019-12-22 17:38:21', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.PermissionController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.PermissionController.queryByRid(java.lang.Long)\"]');
INSERT INTO `log` VALUES (181, 7, '2019-12-22 17:38:21', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:PageResult com.shiki.crm.service.IPermissionService.queryByRid(Long)', '[6]');
INSERT INTO `log` VALUES (182, 7, '2019-12-22 17:38:33', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public com.shiki.crm.util.AjaxResult com.shiki.crm.web.controller.RoleController.update(com.shiki.crm.domain.Role)\"]');
INSERT INTO `log` VALUES (183, 7, '2019-12-22 17:38:34', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:int com.shiki.crm.service.IRoleService.updateByPrimaryKey(Role)', '[{\"id\":6,\"name\":\"普通管理员\",\"sn\":\"normal\",\"permissions\":[{\"id\":3,\"name\":null,\"resource\":null}]}]');
INSERT INTO `log` VALUES (184, 7, '2019-12-22 17:38:35', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.RoleController.list(com.shiki.crm.query.QueryObject)\"]');
INSERT INTO `log` VALUES (185, 7, '2019-12-22 17:38:35', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:PageResult com.shiki.crm.service.IRoleService.queryForPage(QueryObject)', '[{\"page\":1,\"rows\":10,\"start\":0}]');
INSERT INTO `log` VALUES (186, 7, '2019-12-22 17:38:38', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleIdByEid(java.lang.Long)\"]');
INSERT INTO `log` VALUES (187, 7, '2019-12-22 17:38:39', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.queryRoleIdByEid(Long)', '[6]');
INSERT INTO `log` VALUES (188, 7, '2019-12-22 17:38:43', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.util.AjaxResult com.shiki.crm.web.controller.EmployeeController.update(com.shiki.crm.domain.Employee)\"]');
INSERT INTO `log` VALUES (189, 7, '2019-12-22 17:38:43', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:int com.shiki.crm.service.IEmployeeService.update(Employee)', '[{\"id\":6,\"username\":\"李四\",\"realname\":\"李四\",\"password\":null,\"tel\":\"911\",\"dept\":{\"id\":1,\"sn\":null,\"name\":null,\"manager\":null,\"parent\":null,\"state\":null},\"email\":\"123@qq.com\",\"inputtime\":\"2019-12-03\",\"state\":null,\"admin\":null,\"roles\":[{\"id\":6,\"name\":null,\"sn\":null,\"permissions\":null}]}]');
INSERT INTO `log` VALUES (190, 7, '2019-12-22 17:38:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (191, 7, '2019-12-22 17:38:45', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (192, 7, '2019-12-22 17:39:03', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"李四\",\"222\"]');
INSERT INTO `log` VALUES (193, 6, '2019-12-22 17:39:03', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[6]');
INSERT INTO `log` VALUES (194, 6, '2019-12-22 17:39:06', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public java.lang.String com.shiki.crm.web.controller.EmployeeController.index()\"]');
INSERT INTO `log` VALUES (195, 6, '2019-12-22 17:39:06', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:public java.util.List com.shiki.crm.web.controller.DepartmentController.queryForEmp()\"]');
INSERT INTO `log` VALUES (196, 6, '2019-12-22 17:39:06', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleForEmp()\"]');
INSERT INTO `log` VALUES (197, 6, '2019-12-22 17:39:06', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (198, 6, '2019-12-22 17:39:06', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (199, 6, '2019-12-22 17:39:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (200, 6, '2019-12-22 17:39:07', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (201, 6, '2019-12-22 17:39:33', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public java.lang.String com.shiki.crm.web.controller.EmployeeController.index()\"]');
INSERT INTO `log` VALUES (202, 6, '2019-12-22 17:40:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:public java.util.List com.shiki.crm.web.controller.RoleController.queryRoleForEmp()\"]');
INSERT INTO `log` VALUES (203, 6, '2019-12-22 17:40:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:public com.shiki.crm.page.PageResult com.shiki.crm.web.controller.EmployeeController.list(com.shiki.crm.query.EmployeeQueryObject)\"]');
INSERT INTO `log` VALUES (204, 6, '2019-12-22 17:40:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:public java.util.List com.shiki.crm.web.controller.DepartmentController.queryForEmp()\"]');
INSERT INTO `log` VALUES (205, 6, '2019-12-22 17:40:27', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (206, 6, '2019-12-22 17:40:27', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (207, 6, '2019-12-22 17:40:27', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (208, 6, '2019-12-22 17:41:34', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@78c8c20c:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"李四\",\"222\"]');
INSERT INTO `log` VALUES (209, 6, '2019-12-22 17:41:34', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[6]');
INSERT INTO `log` VALUES (210, 6, '2019-12-22 17:41:52', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:index\"]');
INSERT INTO `log` VALUES (211, 6, '2019-12-22 17:42:27', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:list\"]');
INSERT INTO `log` VALUES (212, 6, '2019-12-22 17:42:27', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:queryRoleForEmp\"]');
INSERT INTO `log` VALUES (213, 6, '2019-12-22 17:42:27', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:queryForEmp\"]');
INSERT INTO `log` VALUES (214, 6, '2019-12-22 17:42:27', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (215, 6, '2019-12-22 17:42:44', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (216, 6, '2019-12-22 17:43:03', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:index\"]');
INSERT INTO `log` VALUES (217, 6, '2019-12-22 17:43:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:queryRoleForEmp\"]');
INSERT INTO `log` VALUES (218, 6, '2019-12-22 17:43:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:list\"]');
INSERT INTO `log` VALUES (219, 6, '2019-12-22 17:43:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e78e35:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:queryForEmp\"]');
INSERT INTO `log` VALUES (220, 6, '2019-12-22 17:43:07', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b32b85f:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (221, 6, '2019-12-22 17:43:14', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@7a75c909:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (222, NULL, '2019-12-22 17:44:03', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@1089dcf5:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"李四\",\"222\"]');
INSERT INTO `log` VALUES (223, 6, '2019-12-22 17:44:03', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[6]');
INSERT INTO `log` VALUES (224, 6, '2019-12-22 17:44:07', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:index\"]');
INSERT INTO `log` VALUES (225, 6, '2019-12-22 17:44:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:queryForEmp\"]');
INSERT INTO `log` VALUES (226, 6, '2019-12-22 17:44:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:queryRoleForEmp\"]');
INSERT INTO `log` VALUES (227, 6, '2019-12-22 17:44:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:list\"]');
INSERT INTO `log` VALUES (228, 6, '2019-12-22 17:44:08', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@33107d94:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (229, 6, '2019-12-22 17:44:08', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b398ca6:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (230, 6, '2019-12-22 17:44:15', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:index\"]');
INSERT INTO `log` VALUES (231, 6, '2019-12-22 17:44:16', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:queryForEmp\"]');
INSERT INTO `log` VALUES (232, 6, '2019-12-22 17:44:16', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:queryRoleForEmp\"]');
INSERT INTO `log` VALUES (233, 6, '2019-12-22 17:44:16', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:list\"]');
INSERT INTO `log` VALUES (234, 6, '2019-12-22 17:44:16', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b398ca6:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (235, 6, '2019-12-22 17:44:16', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@33107d94:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (236, 6, '2019-12-22 17:44:35', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@1089dcf5:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (237, 7, '2019-12-22 17:44:35', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@6e53888c:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[7]');
INSERT INTO `log` VALUES (238, 7, '2019-12-22 17:44:38', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@33107d94:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (239, 7, '2019-12-22 17:44:38', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@6b398ca6:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (240, 7, '2019-12-22 17:44:38', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@1089dcf5:PageResult com.shiki.crm.service.IEmployeeService.queryForPage(EmployeeQueryObject)', '[{\"page\":1,\"rows\":10,\"keyword\":null,\"start\":0}]');
INSERT INTO `log` VALUES (241, NULL, '2019-12-22 18:52:26', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@62fdc5de:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"wangwu\",\"888888\"]');
INSERT INTO `log` VALUES (242, 12, '2019-12-22 18:52:27', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[12]');
INSERT INTO `log` VALUES (243, 12, '2019-12-22 18:52:30', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:index\"]');
INSERT INTO `log` VALUES (244, 12, '2019-12-22 18:52:31', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:save\"]');
INSERT INTO `log` VALUES (245, 12, '2019-12-22 18:52:31', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:queryForEmp\"]');
INSERT INTO `log` VALUES (246, 12, '2019-12-22 18:52:31', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:queryRoleForEmp\"]');
INSERT INTO `log` VALUES (247, 12, '2019-12-22 18:52:31', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:list\"]');
INSERT INTO `log` VALUES (248, 12, '2019-12-22 18:52:31', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@2b2c2e7a:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (249, 12, '2019-12-22 18:52:31', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@1a1fed23:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (250, 12, '2019-12-22 18:53:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:index\"]');
INSERT INTO `log` VALUES (251, 12, '2019-12-22 18:53:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:save\"]');
INSERT INTO `log` VALUES (252, 12, '2019-12-22 18:53:44', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:update\"]');
INSERT INTO `log` VALUES (253, 12, '2019-12-22 18:53:45', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.DepartmentController:queryForEmp\"]');
INSERT INTO `log` VALUES (254, 12, '2019-12-22 18:53:45', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.RoleController:queryRoleForEmp\"]');
INSERT INTO `log` VALUES (255, 12, '2019-12-22 18:53:45', '127.0.0.1', 'com.shiki.crm.service.impl.DepartmentServiceImpl@2b2c2e7a:List com.shiki.crm.service.IDepartmentService.queryForEmp()', '[]');
INSERT INTO `log` VALUES (256, 12, '2019-12-22 18:53:45', '127.0.0.1', 'com.shiki.crm.service.impl.RoleServiceImpl@1a1fed23:List com.shiki.crm.service.IRoleService.selectAll()', '[]');
INSERT INTO `log` VALUES (257, 12, '2019-12-22 18:53:45', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@2ba14daf:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.EmployeeController:list\"]');
INSERT INTO `log` VALUES (258, NULL, '2019-12-22 22:01:01', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@1f007639:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"admin\",\"123\"]');
INSERT INTO `log` VALUES (259, 7, '2019-12-22 22:01:01', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@4db5ae12:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[7]');
INSERT INTO `log` VALUES (260, 7, '2019-12-22 22:01:02', '127.0.0.1', 'com.shiki.crm.service.impl.MenuService@20b96898:List com.shiki.crm.service.IMenuService.queryMenu()', '[]');
INSERT INTO `log` VALUES (261, 7, '2019-12-22 22:02:07', '127.0.0.1', 'com.shiki.crm.service.impl.MenuService@20b96898:List com.shiki.crm.service.IMenuService.queryMenu()', '[]');
INSERT INTO `log` VALUES (262, NULL, '2019-12-22 22:09:03', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@f998495:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"王五\",\"888888\"]');
INSERT INTO `log` VALUES (263, 13, '2019-12-22 22:09:04', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@40203487:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[13]');
INSERT INTO `log` VALUES (264, 13, '2019-12-22 22:09:04', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@40203487:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.IndexController:index\"]');
INSERT INTO `log` VALUES (265, 13, '2019-12-22 22:09:04', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@40203487:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.MenuController:menu\"]');
INSERT INTO `log` VALUES (266, 13, '2019-12-22 22:09:04', '127.0.0.1', 'com.shiki.crm.service.impl.MenuServiceImpl@3397b8ff:List com.shiki.crm.service.IMenuService.queryMenu()', '[]');
INSERT INTO `log` VALUES (267, NULL, '2019-12-22 22:15:07', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@60b2c5f7:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"王五\",\"888888\"]');
INSERT INTO `log` VALUES (268, 13, '2019-12-22 22:15:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@1aa0d49:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[13]');
INSERT INTO `log` VALUES (269, 13, '2019-12-22 22:15:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@1aa0d49:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.IndexController:index\"]');
INSERT INTO `log` VALUES (270, 13, '2019-12-22 22:15:08', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@1aa0d49:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.MenuController:menu\"]');
INSERT INTO `log` VALUES (271, 13, '2019-12-22 22:15:08', '127.0.0.1', 'com.shiki.crm.service.impl.MenuServiceImpl@2817f1e1:List com.shiki.crm.service.IMenuService.queryMenu()', '[]');
INSERT INTO `log` VALUES (272, NULL, '2019-12-22 22:21:53', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@b80312a:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"王五\",\"888888\"]');
INSERT INTO `log` VALUES (273, 13, '2019-12-22 22:21:53', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@4d5ce55f:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[13]');
INSERT INTO `log` VALUES (274, 13, '2019-12-22 22:21:54', '127.0.0.1', 'com.shiki.crm.service.impl.MenuServiceImpl@58fd9feb:List com.shiki.crm.service.IMenuService.queryMenu()', '[]');
INSERT INTO `log` VALUES (275, 13, '2019-12-22 22:21:54', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@4d5ce55f:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.IndexController:index\"]');
INSERT INTO `log` VALUES (276, 13, '2019-12-22 22:21:54', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@4d5ce55f:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.MenuController:menu\"]');
INSERT INTO `log` VALUES (277, 13, '2019-12-22 22:21:57', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@4d5ce55f:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.IndexController:index\"]');
INSERT INTO `log` VALUES (278, 13, '2019-12-22 22:21:57', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@4d5ce55f:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.MenuController:menu\"]');
INSERT INTO `log` VALUES (279, NULL, '2019-12-22 22:26:08', '127.0.0.1', 'com.shiki.crm.service.impl.EmployeeImpl@41e071f1:Employee com.shiki.crm.service.IEmployeeService.getEmployeeForLogin(String,String)', '[\"王五\",\"888888\"]');
INSERT INTO `log` VALUES (280, 13, '2019-12-22 22:26:18', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@dc86044:List com.shiki.crm.service.IPermissionService.queryPermissionByEid(Long)', '[13]');
INSERT INTO `log` VALUES (281, 13, '2019-12-22 22:26:20', '127.0.0.1', 'com.shiki.crm.service.impl.MenuServiceImpl@1d6dc87d:List com.shiki.crm.service.IMenuService.queryMenu()', '[]');
INSERT INTO `log` VALUES (282, 13, '2019-12-22 22:26:41', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@dc86044:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.IndexController:index\"]');
INSERT INTO `log` VALUES (283, 13, '2019-12-22 22:26:42', '127.0.0.1', 'com.shiki.crm.service.impl.PermissionServiceImpl@dc86044:Permission com.shiki.crm.service.IPermissionService.queryByResource(String)', '[\"com.shiki.crm.web.controller.MenuController:menu\"]');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checked` tinyint(1) NULL DEFAULT NULL,
  `attributes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统管理', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (2, '员工管理', NULL, NULL, '{\"url\": \"/employee\"}', 1, NULL);
INSERT INTO `menu` VALUES (3, '部门管理', NULL, NULL, '{\"url\": \"/department\"}', 1, NULL);
INSERT INTO `menu` VALUES (4, '营销管理', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (5, '潜在客户管理', NULL, NULL, NULL, 4, NULL);
INSERT INTO `menu` VALUES (6, '角色管理', NULL, NULL, '{\"url\": \"/role\"}', 1, NULL);
INSERT INTO `menu` VALUES (7, '权限管理', NULL, NULL, '{\"url\": \"/permission\"}', 1, NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '员工列表', 'com.shiki.crm.web.controller.EmployeeController:list');
INSERT INTO `permission` VALUES (2, '员工新增', 'com.shiki.crm.web.controller.EmployeeController:save');
INSERT INTO `permission` VALUES (3, '员工编辑', 'com.shiki.crm.web.controller.EmployeeController:update');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (5, '超级管理员', 'admin');
INSERT INTO `role` VALUES (6, '普通管理员', 'normal');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_id` bigint(20) NULL DEFAULT NULL,
  `p_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_role`(`r_id`) USING BTREE,
  INDEX `FK_permission`(`p_id`) USING BTREE,
  CONSTRAINT `FK_permission` FOREIGN KEY (`p_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_role` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (6, 5, 1);
INSERT INTO `role_permission` VALUES (7, 6, 3);

SET FOREIGN_KEY_CHECKS = 1;
