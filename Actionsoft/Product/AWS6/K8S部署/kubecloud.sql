/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : kubecloud

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 19/11/2020 16:04:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for k8s_config
-- ----------------------------
DROP TABLE IF EXISTS `k8s_config`;
CREATE TABLE `k8s_config` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `type` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新着',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='K8S配置';


-- ----------------------------
-- Table structure for k8s_instance
-- ----------------------------
DROP TABLE IF EXISTS `k8s_instance`;
CREATE TABLE `k8s_instance` (
  `name` varchar(64) NOT NULL COMMENT '实例名',
  `no` varchar(64) NOT NULL COMMENT 'NO',
  `license` text NOT NULL COMMENT '许可信息',
  `db_type` varchar(64)  NOT NULL COMMENT '数据库类型',
  `db_host` varchar(512) NOT NULL COMMENT '数据库地址',
  `db_username` varchar(64) NOT NULL COMMENT '数据库账号',
  `db_password` varchar(64) NOT NULL COMMENT '数据库密码',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='K8S实例许可';


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级部门',
  `sub_count` int(5) DEFAULT '0' COMMENT '子部门数目',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `dept_sort` int(5) DEFAULT '999' COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `inx_pid` (`pid`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (2, NULL, 0, '研发部', 3, b'1', 'admin', 'admin', '2019-03-25 09:15:32', '2020-08-02 14:48:47');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '字典名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '岗位状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail` (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint(11) DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `dict_sort` int(5) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典详情';

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int(5) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (8, '人事专员', b'1', 3, NULL, NULL, '2019-03-29 14:52:28', NULL);
INSERT INTO `sys_job` VALUES (10, '产品经理', b'1', 4, NULL, NULL, '2019-03-29 14:55:51', NULL);
INSERT INTO `sys_job` VALUES (11, '全栈开发', b'1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43');
INSERT INTO `sys_job` VALUES (12, '软件测试', b'1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2020-05-10 19:56:26');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `description` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `params` text,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `log_create_time_index` (`create_time`),
  KEY `inx_log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4407 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统日志';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int(5) DEFAULT '0' COMMENT '子菜单数目',
  `type` int(11) DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `menu_sort` int(5) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `uniq_title` (`title`),
  UNIQUE KEY `uniq_name` (`name`),
  KEY `inx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, NULL, 4, 0, '用户', NULL, NULL, 3, 'system', 'system', b'0', b'0', b'0', NULL, NULL, 'admin', '2018-12-18 15:11:29', '2020-11-20 15:58:02');
INSERT INTO `sys_menu` VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', b'0', b'0', b'0', 'user:list', NULL, NULL, '2018-12-18 15:14:44', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', b'0', b'0', b'0', 'roles:list', NULL, NULL, '2018-12-18 15:16:07', NULL);
INSERT INTO `sys_menu` VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', b'0', b'0', b'1', 'menu:list', NULL, 'admin', '2018-12-18 15:17:28', '2020-11-20 16:15:49');
INSERT INTO `sys_menu` VALUES (6, NULL, 2, 0, '日志', NULL, NULL, 2, 'monitor', 'monitor', b'0', b'0', b'0', NULL, NULL, 'admin', '2018-12-18 15:17:48', '2020-11-20 15:58:08');
INSERT INTO `sys_menu` VALUES (7, 6, 1, 1, '操作日志', 'Log', 'monitor/log/index', 11, 'log', 'logs', b'0', b'1', b'0', 'handlelog:list', NULL, 'admin', '2018-12-18 15:18:26', '2020-11-27 14:54:14');
INSERT INTO `sys_menu` VALUES (32, 6, 1, 1, '异常日志', 'ErrorLog', 'monitor/log/errorLog', 12, 'error', 'errorLog', b'0', b'0', b'0', 'errorlog:list', NULL, 'admin', '2019-01-13 13:49:03', '2020-11-27 14:54:22');
INSERT INTO `sys_menu` VALUES (41, 1, 1, 1, '在线用户', 'OnlineUser', 'monitor/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', 'online:list', NULL, 'admin', '2019-10-26 22:08:43', '2020-11-27 15:06:19');
INSERT INTO `sys_menu` VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', NULL, NULL, '2019-10-29 10:59:46', NULL);
INSERT INTO `sys_menu` VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', NULL, NULL, '2019-10-29 11:00:08', NULL);
INSERT INTO `sys_menu` VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', NULL, NULL, '2019-10-29 11:00:23', NULL);
INSERT INTO `sys_menu` VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', NULL, NULL, '2019-10-29 12:45:34', NULL);
INSERT INTO `sys_menu` VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', NULL, NULL, '2019-10-29 12:46:16', NULL);
INSERT INTO `sys_menu` VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', NULL, NULL, '2019-10-29 12:46:51', NULL);
INSERT INTO `sys_menu` VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', NULL, NULL, '2019-10-29 12:55:07', NULL);
INSERT INTO `sys_menu` VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', NULL, NULL, '2019-10-29 12:55:40', NULL);
INSERT INTO `sys_menu` VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', NULL, NULL, '2019-10-29 12:56:00', NULL);
INSERT INTO `sys_menu` VALUES (117, NULL, 2, 0, 'AWS KubeCloud', NULL, NULL, 1, 'app', 'kubernetes', b'0', b'0', b'0', NULL, 'admin', 'admin', '2020-10-26 13:37:46', '2020-11-20 16:20:23');
INSERT INTO `sys_menu` VALUES (118, 117, 3, 1, '实例管理', 'Instance', 'kubernetes/instance/index', 1, 'list', 'instance', b'0', b'0', b'0', 'instance:list', 'admin', 'admin', '2020-10-26 13:41:53', '2020-11-27 10:55:00');
INSERT INTO `sys_menu` VALUES (119, 117, 7, 1, 'Kubernetes配置', 'KubernetesConfig', 'kubernetes/config/index', 2, 'system', 'config', b'0', b'0', b'0', 'k8s:config', 'admin', 'admin', '2020-10-26 13:48:03', '2020-11-20 15:57:37');
INSERT INTO `sys_menu` VALUES (120, 118, 0, 2, '实例新增', NULL, NULL, 1, NULL, NULL, b'0', b'0', b'0', 'instance:add', 'admin', 'admin', '2020-10-26 14:03:34', '2020-10-26 14:03:34');
INSERT INTO `sys_menu` VALUES (121, 118, 0, 2, '实例编辑', NULL, NULL, 2, NULL, NULL, b'0', b'0', b'0', 'instance:edit', 'admin', 'admin', '2020-10-26 14:03:58', '2020-10-26 14:03:58');
INSERT INTO `sys_menu` VALUES (122, 118, 0, 2, '实例删除', NULL, NULL, 3, NULL, NULL, b'0', b'0', b'0', 'instance:del', 'admin', 'admin', '2020-10-26 14:04:19', '2020-10-26 14:04:19');
INSERT INTO `sys_menu` VALUES (123, 119, 0, 2, '配置连接信息', NULL, NULL, 1, NULL, NULL, b'0', b'0', b'0', 'k8sconfig:auth', 'admin', 'admin', '2020-10-29 10:32:45', '2020-11-10 19:50:05');
INSERT INTO `sys_menu` VALUES (124, 119, 0, 2, '镜像新增', NULL, NULL, 2, NULL, NULL, b'0', b'0', b'0', 'k8sconfig:image:add', 'admin', 'admin', '2020-10-29 14:27:15', '2020-10-29 14:27:38');
INSERT INTO `sys_menu` VALUES (125, 119, 0, 2, '镜像编辑', NULL, NULL, 3, NULL, NULL, b'0', b'0', b'0', 'k8sconfig:image:edit', 'admin', 'admin', '2020-10-29 14:28:07', '2020-10-29 14:28:07');
INSERT INTO `sys_menu` VALUES (126, 119, 0, 2, '镜像删除', NULL, NULL, 4, NULL, NULL, b'0', b'0', b'0', 'k8sconfig:image:del', 'admin', 'admin', '2020-10-29 14:28:23', '2020-10-29 14:28:23');
INSERT INTO `sys_menu` VALUES (127, 119, 0, 2, '配置挂载路径', NULL, NULL, 5, NULL, NULL, b'0', b'0', b'0', 'k8sconfig:pv', 'admin', 'admin', '2020-11-04 18:30:22', '2020-11-04 18:30:22');
INSERT INTO `sys_menu` VALUES (128, 119, 0, 2, '配置监控', NULL, NULL, 6, NULL, NULL, b'0', b'0', b'0', 'k8sconfig:monitor', 'admin', 'admin', '2020-11-10 19:50:29', '2020-11-10 19:50:29');
INSERT INTO `sys_menu` VALUES (129, 119, 0, 2, '配置管理中心URL', NULL, NULL, 7, NULL, NULL, b'0', b'0', b'0', 'k8sconfig:managerurl', 'admin', 'admin', '2020-11-21 14:22:30', '2020-11-21 14:22:30');
INSERT INTO `sys_menu` VALUES (131, 7, 0, 2, '清空操作日志', NULL, NULL, 1, NULL, NULL, b'0', b'0', b'0', 'handlelog:delall', 'admin', 'admin', '2020-11-27 14:54:59', '2020-11-27 14:55:48');
INSERT INTO `sys_menu` VALUES (132, 32, 0, 2, '清空异常日志', NULL, NULL, 1, NULL, NULL, b'0', b'0', b'0', 'errorlog:delall', 'admin', 'admin', '2020-11-27 14:55:30', '2020-11-27 14:55:58');
INSERT INTO `sys_menu` VALUES (133, 41, 0, 2, '强退', NULL, NULL, 1, NULL, NULL, b'0', b'0', b'0', 'online:kick', 'admin', 'admin', '2020-11-27 15:11:59', '2020-11-27 15:11:59');
COMMIT;


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `level` int(255) DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `role_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2020-11-19 14:41:34');
INSERT INTO `sys_role` VALUES (2, '普通用户', 2, '-', '全部', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12');
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色部门关联';

-- ----------------------------
-- Records of sys_roles_depts
-- ----------------------------
BEGIN;
INSERT INTO `sys_roles_depts` VALUES (2, 6);
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色菜单关联';

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
BEGIN;
INSERT INTO `sys_roles_menus` VALUES (1, 1);
INSERT INTO `sys_roles_menus` VALUES (2, 1);
INSERT INTO `sys_roles_menus` VALUES (3, 1);
INSERT INTO `sys_roles_menus` VALUES (5, 1);
INSERT INTO `sys_roles_menus` VALUES (6, 1);
INSERT INTO `sys_roles_menus` VALUES (7, 1);
INSERT INTO `sys_roles_menus` VALUES (14, 1);
INSERT INTO `sys_roles_menus` VALUES (32, 1);
INSERT INTO `sys_roles_menus` VALUES (36, 1);
INSERT INTO `sys_roles_menus` VALUES (41, 1);
INSERT INTO `sys_roles_menus` VALUES (117, 1);
INSERT INTO `sys_roles_menus` VALUES (118, 1);
INSERT INTO `sys_roles_menus` VALUES (119, 1);
INSERT INTO `sys_roles_menus` VALUES (1, 2);
INSERT INTO `sys_roles_menus` VALUES (2, 2);
INSERT INTO `sys_roles_menus` VALUES (3, 2);
INSERT INTO `sys_roles_menus` VALUES (5, 2);
INSERT INTO `sys_roles_menus` VALUES (6, 2);
INSERT INTO `sys_roles_menus` VALUES (7, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门名称',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bigint(20) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新着',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `UK_kpubos9gc2cvtkb0thktkbkes` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`),
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`) USING BTREE,
  KEY `FKpq2dhypk2qgt68nauh2by22jb` (`avatar_name`) USING BTREE,
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 2, 'admin', '管理员', '男', '18888888888', 'admin@email.com', '', '', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', 1, NULL, 'admin', '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2020-09-05 10:43:31');
COMMIT;

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `job_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
BEGIN;
INSERT INTO `sys_users_jobs` VALUES (1, 11);
COMMIT;

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色关联';

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_users_roles` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for tool_email_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_email_config`;
CREATE TABLE `tool_email_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `from_user` varchar(255) DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `user` varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱配置';

-- ----------------------------
-- Records of tool_email_config
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;