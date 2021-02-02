/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : fastapi_admin

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 26/01/2021 21:38:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_casbin_rule`;
CREATE TABLE `sys_casbin_rule` (
  `p_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_casbin_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '''主键编码''',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `create_by` bigint DEFAULT NULL COMMENT '''创建者''',
  `update_by` bigint DEFAULT NULL COMMENT '''更新者''',
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_category_create_by` (`create_by`) USING BTREE,
  KEY `idx_sys_category_update_by` (`update_by`) USING BTREE,
  KEY `idx_sys_category_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_columns
-- ----------------------------
DROP TABLE IF EXISTS `sys_columns`;
CREATE TABLE `sys_columns` (
  `column_id` bigint NOT NULL AUTO_INCREMENT,
  `table_id` bigint DEFAULT NULL,
  `column_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `column_comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `column_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `go_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `go_field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `json_field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_pk` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_increment` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_required` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_insert` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_edit` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_list` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_query` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `query_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `html_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dict_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sort` bigint DEFAULT NULL,
  `list` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pk` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `super_column` tinyint(1) DEFAULT NULL,
  `usable_column` tinyint(1) DEFAULT NULL,
  `increment` tinyint(1) DEFAULT NULL,
  `insert` tinyint(1) DEFAULT NULL,
  `edit` tinyint(1) DEFAULT NULL,
  `query` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fk_table_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fk_table_name_class` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fk_table_name_package` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fk_label_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fk_label_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_By` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_columns
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '''主键编码''',
  `config_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ConfigName',
  `config_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ConfigKey',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ConfigValue',
  `config_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ConfigType',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Remark',
  `create_by` bigint DEFAULT NULL COMMENT '''创建者''',
  `update_by` bigint DEFAULT NULL COMMENT '''更新者''',
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_config_create_by` (`create_by`) USING BTREE,
  KEY `idx_sys_config_update_by` (`update_by`) USING BTREE,
  KEY `idx_sys_config_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys_index_skinName', 'skin-blue', 'Y', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', 1, 1, '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', '初始化密码 123456', 1, 1, '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys_index_sideTheme', 'theme-dark', 'Y', '深色主题theme-dark，浅色主题theme-light', 1, 1, '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_content
-- ----------------------------
DROP TABLE IF EXISTS `sys_content`;
CREATE TABLE `sys_content` (
  `id` int NOT NULL,
  `cate_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_content
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL,
  `dept_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dept_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sort` bigint DEFAULT NULL,
  `leader` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '''创建者''',
  `update_by` bigint DEFAULT NULL COMMENT '''更新者''',
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `idx_sys_dept_create_by` (`create_by`) USING BTREE,
  KEY `idx_sys_dept_update_by` (`update_by`) USING BTREE,
  KEY `idx_sys_dept_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 0, '/0/1', '爱拓科技', 0, 'aituo', '13782218188', 'atuo@aituo.com', '2', 1, 1, '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dept` VALUES (7, 1, '/0/1/7', '研发部', 1, 'aituo', '13782218188', 'atuo@aituo.com', '2', 1, 1, '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dept` VALUES (8, 1, '/0/1/8', '运维部', 0, 'aituo', '13782218188', 'atuo@aituo.com', '2', 1, 1, '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dept` VALUES (9, 1, '/0/1/9', '客服部', 0, 'aituo', '13782218188', 'atuo@aituo.com', '2', 1, 1, '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dept` VALUES (10, 1, '/0/1/10', '人力资源', 2, 'aituo', '13782218188', 'atuo@aituo.com', '2', 1, 1, '2021-01-19 23:25:42.930', '2021-01-24 12:24:30.215', NULL);
INSERT INTO `sys_dept` VALUES (11, 8, NULL, '测试', 3, '1', '18613782654', '330931931@qq.com', '0', 1, 1, '2021-01-24 12:12:27.276', '2021-01-24 12:12:41.905', '2021-01-24 12:21:51.873');
INSERT INTO `sys_dept` VALUES (12, 11, NULL, '啊啊啊', 1, '1111', '18613782654', 'ibryang@163.com', '0', 1, 1, '2021-01-24 12:12:54.905', NULL, '2021-01-24 12:21:44.077');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT,
  `dict_sort` bigint DEFAULT NULL,
  `dict_label` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dict_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `css_class` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `list_class` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_default` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `default` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 0, '正常', '2', 'sys_normal_disable', '', '', '', '2', '', '1', '', '系统正常', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (2, 0, '停用', '1', 'sys_normal_disable', '', '', '', '2', '', '1', '', '系统停用', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (3, 0, '男', '0', 'sys_user_sex', '', '', '', '2', '', '1', '', '性别男', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (4, 0, '女', '1', 'sys_user_sex', '', '', '', '2', '', '1', '', '性别女', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (5, 0, '未知', '2', 'sys_user_sex', '', '', '', '2', '', '1', '', '性别未知', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (6, 0, '显示', '0', 'sys_show_hide', '', '', '', '2', '', '1', '', '显示菜单', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (7, 0, '隐藏', '1', 'sys_show_hide', '', '', '', '2', '', '1', '', '隐藏菜单', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (8, 0, '是', 'Y', 'sys_yes_no', '', '', '', '2', '', '1', '', '系统默认是', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (9, 0, '否', 'N', 'sys_yes_no', '', '', '', '2', '', '1', '', '系统默认否', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (10, 0, '正常', '2', 'sys_job_status', '', '', '', '2', '', '1', '', '正常状态', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (11, 0, '停用', '1', 'sys_job_status', '', '', '', '2', '', '1', '', '停用状态', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (12, 0, '默认', 'DEFAULT', 'sys_job_group', '', '', '', '2', '', '1', '', '默认分组', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (13, 0, '系统', 'SYSTEM', 'sys_job_group', '', '', '', '2', '', '1', '', '系统分组', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (14, 0, '通知', '1', 'sys_notice_type', '', '', '', '2', '', '1', '', '通知', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (15, 0, '公告', '2', 'sys_notice_type', '', '', '', '2', '', '1', '', '公告', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (16, 0, '正常', '0', 'sys_common_status', '', '', '', '2', '', '1', '', '正常状态', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (17, 0, '关闭', '1', 'sys_common_status', '', '', '', '2', '', '1', '', '关闭状态', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (18, 0, '新增', '1', 'sys_oper_type', '', '', '', '2', '', '1', '', '新增操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (19, 0, '修改', '2', 'sys_oper_type', '', '', '', '2', '', '1', '', '修改操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (20, 0, '删除', '3', 'sys_oper_type', '', '', '', '2', '', '1', '', '删除操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (21, 0, '授权', '4', 'sys_oper_type', '', '', '', '2', '', '1', '', '授权操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (22, 0, '导出', '5', 'sys_oper_type', '', '', '', '2', '', '1', '', '导出操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (23, 0, '导入', '6', 'sys_oper_type', '', '', '', '2', '', '1', '', '导入操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (24, 0, '强退', '7', 'sys_oper_type', '', '', '', '2', '', '1', '', '强退操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (25, 0, '生成代码', '8', 'sys_oper_type', '', '', '', '2', '', '1', '', '生成操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (26, 0, '清空数据', '9', 'sys_oper_type', '', '', '', '2', '', '1', '', '清空操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (27, 0, '成功', '0', 'sys_notice_status', '', '', '', '2', '', '1', '', '成功状态', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (28, 0, '失败', '1', 'sys_notice_status', '', '', '', '2', '', '1', '', '失败状态', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (29, 0, '登录', '10', 'sys_oper_type', '', '', '', '2', '', '1', '1', '登录操作', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 0, '退出', '11', 'sys_oper_type', '', '', '', '2', '', '1', '1', '', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '获取验证码', '12', 'sys_oper_type', '', '', '', '2', '', '1', '1', '获取验证码', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dict_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '系统开关', 'sys_normal_disable', '2', '1', '1', '系统开关列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (2, '用户性别', 'sys_user_sex', '2', '1', '', '用户性别列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (3, '菜单状态', 'sys_show_hide', '2', '1', '', '菜单状态列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (4, '系统是否', 'sys_yes_no', '2', '1', '', '系统是否列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (5, '任务状态', 'sys_job_status', '2', '1', '', '任务状态列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (6, '任务分组', 'sys_job_group', '2', '1', '', '任务分组列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '2', '1', '', '通知类型列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (8, '系统状态', 'sys_common_status', '2', '1', '', '登录状态列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '2', '1', '', '操作类型列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_dict_type` VALUES (10, '通知状态', 'sys_notice_status', '2', '1', '', '通知状态列表', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_file_dir
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_dir`;
CREATE TABLE `sys_file_dir` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '''主键编码''',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '目录名称',
  `p_id` int DEFAULT NULL COMMENT '上级目录',
  `sort` bigint DEFAULT NULL COMMENT '排序',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路径',
  `create_by` bigint DEFAULT NULL COMMENT '''创建者''',
  `update_by` bigint DEFAULT NULL COMMENT '''更新者''',
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_file_dir_create_by` (`create_by`) USING BTREE,
  KEY `idx_sys_file_dir_update_by` (`update_by`) USING BTREE,
  KEY `idx_sys_file_dir_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_file_dir
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '''主键编码''',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `size` int DEFAULT NULL COMMENT '大小',
  `p_id` int DEFAULT NULL COMMENT '目录',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '来源',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `full_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '全地址',
  `create_by` bigint DEFAULT NULL COMMENT '''创建者''',
  `update_by` bigint DEFAULT NULL COMMENT '''更新者''',
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_file_info_deleted_at` (`deleted_at`) USING BTREE,
  KEY `idx_sys_file_info_create_by` (`create_by`) USING BTREE,
  KEY `idx_sys_file_info_update_by` (`update_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_type` tinyint DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `invoke_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `misfire_policy` bigint DEFAULT NULL,
  `concurrent` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `entry_id` smallint DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '接口测试', 'DEFAULT', 1, '0/5 * * * * ', 'http://localhost:8000', '', 1, 1, 1, 0, '', '', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
INSERT INTO `sys_job` VALUES (2, '函数测试', 'DEFAULT', 2, '0/5 * * * * ', 'ExamplesOne', '参数', 1, 1, 1, 0, '', '', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '''主键编码''',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '状态',
  `ipaddr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ip地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '归属地',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '浏览器',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系统',
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '固件',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '信息',
  `create_by` bigint DEFAULT NULL COMMENT '''创建者''',
  `update_by` bigint DEFAULT NULL COMMENT '''更新者''',
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_login_log_update_by` (`update_by`) USING BTREE,
  KEY `idx_sys_login_log_deleted_at` (`deleted_at`) USING BTREE,
  KEY `idx_sys_login_log_create_by` (`create_by`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_log` VALUES (1, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 00:23:35.272', NULL);
INSERT INTO `sys_login_log` VALUES (2, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 00:29:14.674', NULL);
INSERT INTO `sys_login_log` VALUES (3, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 00:31:00.475', NULL);
INSERT INTO `sys_login_log` VALUES (4, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 00:36:36.475', NULL);
INSERT INTO `sys_login_log` VALUES (5, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 09:35:46.762', NULL);
INSERT INTO `sys_login_log` VALUES (6, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:31:08.747', NULL);
INSERT INTO `sys_login_log` VALUES (7, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:31:27.971', NULL);
INSERT INTO `sys_login_log` VALUES (8, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:31:32.034', NULL);
INSERT INTO `sys_login_log` VALUES (9, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:32:17.121', NULL);
INSERT INTO `sys_login_log` VALUES (10, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:34:32.087', NULL);
INSERT INTO `sys_login_log` VALUES (11, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:34:58.418', NULL);
INSERT INTO `sys_login_log` VALUES (12, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:35:13.065', NULL);
INSERT INTO `sys_login_log` VALUES (13, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 11:45:08.410', NULL);
INSERT INTO `sys_login_log` VALUES (14, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 14:39:07.045', NULL);
INSERT INTO `sys_login_log` VALUES (15, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 14:41:50.470', NULL);
INSERT INTO `sys_login_log` VALUES (16, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 15:27:20.924', NULL);
INSERT INTO `sys_login_log` VALUES (17, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 15:29:46.265', NULL);
INSERT INTO `sys_login_log` VALUES (18, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 16:03:12.380', NULL);
INSERT INTO `sys_login_log` VALUES (19, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 16:03:17.790', NULL);
INSERT INTO `sys_login_log` VALUES (20, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 16:03:24.190', NULL);
INSERT INTO `sys_login_log` VALUES (21, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 16:09:55.856', NULL);
INSERT INTO `sys_login_log` VALUES (22, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 20:52:19.103', NULL);
INSERT INTO `sys_login_log` VALUES (23, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-22 21:12:20.464', NULL);
INSERT INTO `sys_login_log` VALUES (24, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:15:02.910', NULL);
INSERT INTO `sys_login_log` VALUES (25, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:15:42.423', NULL);
INSERT INTO `sys_login_log` VALUES (26, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:16:21.332', NULL);
INSERT INTO `sys_login_log` VALUES (27, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:17:10.995', NULL);
INSERT INTO `sys_login_log` VALUES (28, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:27:53.998', NULL);
INSERT INTO `sys_login_log` VALUES (29, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:32:13.174', NULL);
INSERT INTO `sys_login_log` VALUES (30, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:33:08.412', NULL);
INSERT INTO `sys_login_log` VALUES (31, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:33:31.920', NULL);
INSERT INTO `sys_login_log` VALUES (32, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 10:42:09.009', NULL);
INSERT INTO `sys_login_log` VALUES (33, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 11:15:51.227', NULL);
INSERT INTO `sys_login_log` VALUES (34, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 11:16:11.708', NULL);
INSERT INTO `sys_login_log` VALUES (35, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-23 16:12:48.062', NULL);
INSERT INTO `sys_login_log` VALUES (36, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-24 11:41:21.969', NULL);
INSERT INTO `sys_login_log` VALUES (37, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-24 16:26:27.891', NULL);
INSERT INTO `sys_login_log` VALUES (38, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-24 16:41:07.380', NULL);
INSERT INTO `sys_login_log` VALUES (39, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-24 16:41:19.166', NULL);
INSERT INTO `sys_login_log` VALUES (40, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-24 16:41:54.844', NULL);
INSERT INTO `sys_login_log` VALUES (41, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-24 21:00:01.171', NULL);
INSERT INTO `sys_login_log` VALUES (42, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-24 21:02:28.133', NULL);
INSERT INTO `sys_login_log` VALUES (43, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-24 21:02:51.556', NULL);
INSERT INTO `sys_login_log` VALUES (44, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 09:24:23.321', NULL);
INSERT INTO `sys_login_log` VALUES (45, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 09:25:10.315', NULL);
INSERT INTO `sys_login_log` VALUES (46, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 09:31:14.513', NULL);
INSERT INTO `sys_login_log` VALUES (47, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 09:34:45.654', NULL);
INSERT INTO `sys_login_log` VALUES (48, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 09:35:28.084', NULL);
INSERT INTO `sys_login_log` VALUES (49, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 10:44:34.396', NULL);
INSERT INTO `sys_login_log` VALUES (50, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 10:47:41.049', NULL);
INSERT INTO `sys_login_log` VALUES (51, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 10:50:35.981', NULL);
INSERT INTO `sys_login_log` VALUES (52, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 10:54:37.675', NULL);
INSERT INTO `sys_login_log` VALUES (53, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:02:47.938', NULL);
INSERT INTO `sys_login_log` VALUES (54, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:06:10.255', NULL);
INSERT INTO `sys_login_log` VALUES (55, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:06:41.930', NULL);
INSERT INTO `sys_login_log` VALUES (56, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:29:53.322', NULL);
INSERT INTO `sys_login_log` VALUES (57, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:30:38.586', NULL);
INSERT INTO `sys_login_log` VALUES (58, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:30:58.615', NULL);
INSERT INTO `sys_login_log` VALUES (59, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:31:20.438', NULL);
INSERT INTO `sys_login_log` VALUES (60, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:31:40.671', NULL);
INSERT INTO `sys_login_log` VALUES (61, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:32:03.133', NULL);
INSERT INTO `sys_login_log` VALUES (62, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:32:20.324', NULL);
INSERT INTO `sys_login_log` VALUES (63, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:33:40.367', NULL);
INSERT INTO `sys_login_log` VALUES (64, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:33:58.469', NULL);
INSERT INTO `sys_login_log` VALUES (65, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:38:15.321', NULL);
INSERT INTO `sys_login_log` VALUES (66, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:38:55.584', NULL);
INSERT INTO `sys_login_log` VALUES (67, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:39:10.390', NULL);
INSERT INTO `sys_login_log` VALUES (68, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:39:34.584', NULL);
INSERT INTO `sys_login_log` VALUES (69, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:42:41.612', NULL);
INSERT INTO `sys_login_log` VALUES (70, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:42:56.071', NULL);
INSERT INTO `sys_login_log` VALUES (71, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:43:27.287', NULL);
INSERT INTO `sys_login_log` VALUES (72, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:44:47.994', NULL);
INSERT INTO `sys_login_log` VALUES (73, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:45:08.560', NULL);
INSERT INTO `sys_login_log` VALUES (74, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:45:42.587', NULL);
INSERT INTO `sys_login_log` VALUES (75, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 11:46:09.632', NULL);
INSERT INTO `sys_login_log` VALUES (76, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:46:19.419', NULL);
INSERT INTO `sys_login_log` VALUES (77, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:47:20.525', NULL);
INSERT INTO `sys_login_log` VALUES (78, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:47:37.154', NULL);
INSERT INTO `sys_login_log` VALUES (79, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:48:05.063', NULL);
INSERT INTO `sys_login_log` VALUES (80, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:48:21.257', NULL);
INSERT INTO `sys_login_log` VALUES (81, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 11:49:09.699', NULL);
INSERT INTO `sys_login_log` VALUES (82, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 23:28:19.344', NULL);
INSERT INTO `sys_login_log` VALUES (83, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 23:28:33.384', NULL);
INSERT INTO `sys_login_log` VALUES (84, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 23:28:36.521', NULL);
INSERT INTO `sys_login_log` VALUES (85, 'admin', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2021-01-25 23:29:53.688', NULL);
INSERT INTO `sys_login_log` VALUES (86, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 23:31:12.407', NULL);
INSERT INTO `sys_login_log` VALUES (87, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 23:31:20.923', NULL);
INSERT INTO `sys_login_log` VALUES (88, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 23:52:00.578', NULL);
INSERT INTO `sys_login_log` VALUES (89, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-25 23:54:19.947', NULL);
INSERT INTO `sys_login_log` VALUES (90, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-26 00:00:04.434', NULL);
INSERT INTO `sys_login_log` VALUES (91, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-26 00:03:14.404', NULL);
INSERT INTO `sys_login_log` VALUES (92, 'liangqiu', '1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 Edg/87.0.664.57', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '2021-01-26 00:03:16.812', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `paths` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `menu_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parent_id` smallint DEFAULT NULL,
  `no_cache` tinyint(1) DEFAULT NULL,
  `breadcrumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sort` tinyint DEFAULT NULL,
  `visible` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `is_frame` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (2, 'Upms', '系统管理', 'example', '/upms', '/0/2', 'M', '无', '', 0, 1, '', 'Layout', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3, 'Sysuser', '用户管理', 'user', 'sysuser', '/0/2/3', 'C', '无', 'system:sysuser:list', 2, NULL, NULL, '/sysuser/index', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:10:42.000', NULL);
INSERT INTO `sys_menu` VALUES (43, '', '新增用户', '', '/api/v1/sysuser', '/0/2/3/43', 'F', 'POST', 'system:sysuser:add', 3, NULL, NULL, NULL, 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (44, '', '查询用户', '', '/api/v1/sysuser', '/0/2/3/44', 'F', 'GET', 'system:sysuser:query', 3, NULL, NULL, NULL, 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (45, '', '修改用户', '', '/api/v1/sysuser/', '/0/2/3/45', 'F', 'PUT', 'system:sysuser:edit', 3, NULL, NULL, NULL, 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (46, '', '删除用户', '', '/api/v1/sysuser/', '/0/2/3/46', 'F', 'DELETE', 'system:sysuser:remove', 3, NULL, NULL, NULL, 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 15:32:45.000', NULL);
INSERT INTO `sys_menu` VALUES (51, 'Menu', '菜单管理', 'tree-table', 'menu', '/0/2/51', 'C', '无', 'system:sysmenu:list', 2, 1, '', '/menu/index', 3, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:16:30.000', NULL);
INSERT INTO `sys_menu` VALUES (52, 'Role', '角色管理', 'peoples', 'role', '/0/2/52', 'C', '无', 'system:sysrole:list', 2, 1, '', '/role/index', 2, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:16:19.000', NULL);
INSERT INTO `sys_menu` VALUES (56, 'Dept', '部门管理', 'tree', 'dept', '/0/2/56', 'C', '无', 'system:sysdept:list', 2, 0, '', '/dept/index', 4, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:16:47.000', NULL);
INSERT INTO `sys_menu` VALUES (57, 'post', '岗位管理', 'pass', 'post', '/0/2/57', 'C', '无', 'system:syspost:list', 2, 0, '', '/post/index', 5, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:16:53.000', NULL);
INSERT INTO `sys_menu` VALUES (58, 'Dict', '字典管理', 'education', 'dict', '/0/2/58', 'C', '无', 'system:sysdicttype:list', 2, 0, '', '/dict/index', 6, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2021-01-24 14:36:38.110', NULL);
INSERT INTO `sys_menu` VALUES (59, 'DictData', '字典数据', 'education', 'dict/data/:dictId', '/0/2/59', 'C', '无', 'system:sysdictdata:list', 2, 0, '', '/dict/data', 100, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:17:25.000', NULL);
INSERT INTO `sys_menu` VALUES (60, 'Tools', '系统工具', 'component', '/tools', '/0/60', 'M', '无', '', 0, 0, '', 'Layout', 3, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (61, 'Swagger', '系统接口', 'guide', 'swagger', '/0/60/61', 'C', '无', '', 60, 0, '', '/tools/swagger/index', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (62, 'Config', '参数设置', 'list', '/config', '/0/2/62', 'C', '无', 'system:sysconfig:list', 2, 0, '', '/config/index', 7, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2021-01-24 14:36:45.022', NULL);
INSERT INTO `sys_menu` VALUES (63, '', '接口权限', 'bug', '', '/0/63', 'M', '', '', 0, 0, '', '', 99, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 16:39:32.000', NULL);
INSERT INTO `sys_menu` VALUES (64, '', '用户管理', 'user', '', '/0/63/64', 'M', '', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (66, '', '菜单管理', 'tree-table', '', '/0/63/66', 'C', '', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (67, '', '菜单列表', 'tree-table', '/api/v1/menulist', '/0/63/66/67', 'A', 'GET', '', 66, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (68, '', '新建菜单', 'tree', '/api/v1/menu', '/0/63/66/68', 'A', 'POST', '', 66, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (69, '', '字典', 'dict', '', '/0/63/69', 'M', '', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (70, '', '类型', 'dict', '', '/0/63/69/70', 'C', '', '', 69, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (71, '', '字典类型获取', 'tree', '/api/v1/dict/databytype/', '/0/63/256/71', 'A', 'GET', '', 256, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (72, '', '修改菜单', 'bug', '/api/v1/menu', '/0/63/66/72', 'A', 'PUT', '', 66, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, '', '删除菜单', 'bug', '/api/v1/menu/:id', '/0/63/66/73', 'A', 'DELETE', '', 66, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, '', '管理员列表', 'bug', '/api/v1/sysUserList', '/0/63/64/74', 'A', 'GET', NULL, 64, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, '', '根据id获取管理员', 'bug', '/api/v1/sysUser/:id', '/0/63/64/75', 'A', 'GET', NULL, 64, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, '', '获取管理员', 'bug', '/api/v1/sysUser/', '/0/63/256/76', 'A', 'GET', NULL, 256, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-07-18 14:30:28.000', NULL);
INSERT INTO `sys_menu` VALUES (77, '', '创建管理员', 'bug', '/api/v1/sysUser', '/0/63/64/77', 'A', 'POST', NULL, 64, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, '', '修改管理员', 'bug', '/api/v1/sysUser', '/0/63/64/78', 'A', 'PUT', NULL, 64, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, '', '删除管理员', 'bug', '/api/v1/sysUser/:id', '/0/63/64/79', 'A', 'DELETE', NULL, 64, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, '', '当前用户个人信息', 'bug', '/api/v1/user/profile', '/0/63/256/267/80', 'A', 'GET', NULL, 267, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-05-03 20:50:40.000', NULL);
INSERT INTO `sys_menu` VALUES (81, '', '角色列表', 'bug', '/api/v1/rolelist', '/0/63/201/81', 'A', 'GET', NULL, 201, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (82, '', '获取角色信息', 'bug', '/api/v1/role/:id', '/0/63/201/82', 'A', 'GET', NULL, 201, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, '', '创建角色', 'bug', '/api/v1/role', '/0/63/201/83', 'A', 'POST', NULL, 201, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (84, '', '修改角色', 'bug', '/api/v1/role', '/0/63/201/84', 'A', 'PUT', NULL, 201, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (85, '', '删除角色', 'bug', '/api/v1/role/:id', '/0/63/201/85', 'A', 'DELETE', NULL, 201, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (86, '', '参数列表', 'bug', '/api/v1/configList', '/0/63/202/86', 'A', 'GET', NULL, 202, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (87, '', '根据id获取参数', 'bug', '/api/v1/config/:id', '/0/63/202/87', 'A', 'GET', NULL, 202, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (89, '', '创建参数', 'bug', '/api/v1/config', '/0/63/202/89', 'A', 'POST', NULL, 202, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (90, '', '修改参数', 'bug', '/api/v1/config', '/0/63/202/90', 'A', 'PUT', NULL, 202, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, '', '删除参数', 'bug', '/api/v1/config/:id', '/0/63/202/91', 'A', 'DELETE', NULL, 202, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, '', '获取角色菜单', 'bug', '/api/v1/menurole', '/0/63/256/92', 'A', 'GET', NULL, 256, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-07-10 20:47:39.000', NULL);
INSERT INTO `sys_menu` VALUES (93, '', '根据角色id获取角色', 'bug', '/api/v1/roleMenuTreeselect/:id', '/0/63/256/93', 'A', 'GET', NULL, 256, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-07-10 20:47:52.000', NULL);
INSERT INTO `sys_menu` VALUES (94, '', '获取菜单树', 'bug', '/api/v1/menuTreeselect', '/0/63/256/94', 'A', 'GET', NULL, 256, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-05-03 20:52:11.000', NULL);
INSERT INTO `sys_menu` VALUES (95, '', '获取角色菜单', 'bug', '/api/v1/rolemenu', '/0/63/205/95', 'A', 'GET', NULL, 205, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (96, '', '创建角色菜单', 'bug', '/api/v1/rolemenu', '/0/63/205/96', 'A', 'POST', NULL, 205, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (97, '', '删除用户菜单数据', 'bug', '/api/v1/rolemenu/:id', '/0/63/205/97', 'A', 'DELETE', NULL, 205, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (103, '', '部门菜单列表', 'bug', '/api/v1/deptList', '/0/63/203/103', 'A', 'GET', NULL, 203, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, '', '根据id获取部门信息', 'bug', '/api/v1/dept/:id', '/0/63/203/104', 'A', 'GET', NULL, 203, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (105, '', '创建部门', 'bug', '/api/v1/dept', '/0/63/203/105', 'A', 'POST', NULL, 203, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (106, '', '修改部门', 'bug', '/api/v1/dept', '/0/63/203/106', 'A', 'PUT', NULL, 203, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (107, '', '删除部门', 'bug', '/api/v1/dept/:id', '/0/63/203/107', 'A', 'DELETE', NULL, 203, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (108, '', '字典数据列表', 'bug', '/api/v1/dict/datalist', '/0/63/69/206/108', 'A', 'GET', NULL, 206, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, '', '通过编码获取字典数据', 'bug', '/api/v1/dict/data/:id', '/0/63/69/206/109', 'A', 'GET', NULL, 206, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (110, '', '通过字典类型获取字典数据', 'bug', '/api/v1/dict/databytype/:id', '/0/63/256/110', 'A', 'GET', NULL, 256, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (111, '', '创建字典数据', 'bug', '/api/v1/dict/data', '/0/63/69/206/111', 'A', 'POST', NULL, 206, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (112, '', '修改字典数据', 'bug', '/api/v1/dict/data/', '/0/63/69/206/112', 'A', 'PUT', NULL, 206, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (113, '', '删除字典数据', 'bug', '/api/v1/dict/data/:id', '/0/63/69/206/113', 'A', 'DELETE', NULL, 206, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (114, '', '字典类型列表', 'bug', '/api/v1/dict/typelist', '/0/63/69/70/114', 'A', 'GET', NULL, 70, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (115, '', '通过id获取字典类型', 'bug', '/api/v1/dict/type/:id', '/0/63/69/70/115', 'A', 'GET', NULL, 70, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (116, '', '创建字典类型', 'bug', '/api/v1/dict/type', '/0/63/69/70/116', 'A', 'POST', NULL, 70, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (117, '', '修改字典类型', 'bug', '/api/v1/dict/type', '/0/63/69/70/117', 'A', 'PUT', NULL, 70, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (118, '', '删除字典类型', 'bug', '/api/v1/dict/type/:id', '/0/63/69/70/118', 'A', 'DELETE', NULL, 70, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (119, '', '获取岗位列表', 'bug', '/api/v1/postlist', '/0/63/204/119', 'A', 'GET', NULL, 204, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (120, '', '通过id获取岗位信息', 'bug', '/api/v1/post/:id', '/0/63/204/120', 'A', 'GET', NULL, 204, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (121, '', '创建岗位', 'bug', '/api/v1/post', '/0/63/204/121', 'A', 'POST', NULL, 204, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (122, '', '修改岗位', 'bug', '/api/v1/post', '/0/63/204/122', 'A', 'PUT', NULL, 204, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (123, '', '删除岗位', 'bug', '/api/v1/post/:id', '/0/63/204/123', 'A', 'DELETE', NULL, 204, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (138, '', '获取根据id菜单信息', 'bug', '/api/v1/menu/:id', '/0/63/66/138', 'A', 'GET', NULL, 66, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (142, '', '获取角色对应的菜单id数组', 'bug', '/api/v1/menuids', '/0/63/256/142', 'A', 'GET', NULL, 256, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (201, '', '角色管理', 'peoples', '', '/0/63/201', 'C', 'GET', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (202, '', '参数设置', 'list', '', '/0/63/202', 'C', 'DELETE', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (203, '', '部门管理', 'tree', '', '/0/63/203', 'C', 'POST', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (204, '', '岗位管理', 'pass', '', '/0/63/204', 'C', '', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (205, '', '角色菜单管理', 'nested', '', '/0/63/205', 'C', '', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (206, '', '数据', '', '', '/0/63/69/206', 'C', 'PUT', '', 69, 0, '', '', 2, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (211, 'Log', '日志管理', 'log', '/log', '/0/2/211', 'M', '', '', 2, 0, '', '/log/index', 8, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:15:32.000', NULL);
INSERT INTO `sys_menu` VALUES (212, 'LoginLog', '登录日志', 'logininfor', '/loginlog', '/0/2/211/212', 'C', '', 'system:sysloginlog:list', 211, 0, '', '/loginlog/index', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (213, '', '获取登录日志', 'bug', '/api/v1/loginloglist', '/0/63/214/213', 'A', 'GET', NULL, 214, NULL, NULL, NULL, 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (214, '', '日志管理', 'log', '', '/0/63/214', 'M', 'GET', '', 63, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (215, '', '删除日志', 'bug', '/api/v1/loginlog/:id', '/0/63/214/215', 'A', 'DELETE', '', 214, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (216, 'OperLog', '操作日志', 'skill', '/operlog', '/0/2/211/216', 'C', '', 'system:sysoperlog:list', 211, 0, '', '/operlog/index', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2021-01-24 13:22:05.391', NULL);
INSERT INTO `sys_menu` VALUES (217, '', '获取操作日志', 'bug', '/api/v1/operloglist', '/0/63/214/217', 'A', 'GET', '', 214, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (220, '', '新增菜单', '', '', '/0/2/51/220', 'F', '', 'system:sysmenu:add', 51, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (221, '', '修改菜单', 'edit', '', '/0/2/51/221', 'F', '', 'system:sysmenu:edit', 51, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (222, '', '查询菜单', 'search', '', '/0/2/51/222', 'F', '', 'system:sysmenu:query', 51, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (223, '', '删除菜单', '', '', '/0/2/51/223', 'F', '', 'system:sysmenu:remove', 51, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (224, '', '新增角色', '', '', '/0/2/52/224', 'F', '', 'system:sysrole:add', 52, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (225, '', '查询角色', '', '', '/0/2/52/225', 'F', '', 'system:sysrole:query', 52, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (226, '', '修改角色', '', '', '/0/2/52/226', 'F', '', 'system:sysrole:edit', 52, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (227, '', '删除角色', '', '', '/0/2/52/227', 'F', '', 'system:sysrole:remove', 52, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (228, '', '查询部门', '', '', '/0/2/56/228', 'F', '', 'system:sysdept:query', 56, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (229, '', '新增部门', '', '', '/0/2/56/229', 'F', '', 'system:sysdept:add', 56, 0, '', '', 1, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (230, '', '修改部门', '', '', '/0/2/56/230', 'F', '', 'system:sysdept:edit', 56, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (231, '', '删除部门', '', '', '/0/2/56/231', 'F', '', 'system:sysdept:remove', 56, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (232, '', '查询岗位', '', '', '/0/2/57/232', 'F', '', 'system:syspost:query', 57, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (233, '', '新增岗位', '', '', '/0/2/57/233', 'F', '', 'system:syspost:add', 57, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (234, '', '修改岗位', '', '', '/0/2/57/234', 'F', '', 'system:syspost:edit', 57, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (235, '', '删除岗位', '', '', '/0/2/57/235', 'F', '', 'system:syspost:remove', 57, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (236, '', '字典查询', '', '', '/0/2/58/236', 'F', '', 'system:sysdicttype:query', 58, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (237, '', '新增类型', '', '', '/0/2/58/237', 'F', '', 'system:sysdicttype:add', 58, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (238, '', '修改类型', '', '', '/0/2/58/238', 'F', '', 'system:sysdicttype:edit', 58, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (239, '', '删除类型', '', '', '/0/2/58/239', 'F', '', 'system:sysdicttype:remove', 58, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (240, '', '查询数据', '', '', '/0/2/59/240', 'F', '', 'system:sysdictdata:query', 59, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (241, '', '新增数据', '', '', '/0/2/59/241', 'F', '', 'system:sysdictdata:add', 59, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (242, '', '修改数据', '', '', '/0/2/59/242', 'F', '', 'system:sysdictdata:edit', 59, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (243, '', '删除数据', '', '', '/0/2/59/243', 'F', '', 'system:sysdictdata:remove', 59, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (244, '', '查询参数', '', '', '/0/2/62/244', 'F', '', 'system:sysconfig:query', 62, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (245, '', '新增参数', '', '', '/0/2/62/245', 'F', '', 'system:sysconfig:add', 62, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (246, '', '修改参数', '', '', '/0/2/62/246', 'F', '', 'system:sysconfig:edit', 62, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (247, '', '删除参数', '', '', '/0/2/62/247', 'F', '', 'system:sysconfig:remove', 62, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (248, '', '查询登录日志', '', '', '/0/2/211/212/248', 'F', '', 'system:sysloginlog:query', 212, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (249, '', '删除登录日志', '', '', '/0/2/211/212/249', 'F', '', 'system:sysloginlog:remove', 212, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (250, '', '查询操作日志', '', '', '/0/2/211/216/250', 'F', '', 'system:sysoperlog:query', 216, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (251, '', '删除操作日志', '', '', '/0/2/211/216/251', 'F', '', 'system:sysoperlog:remove', 216, 0, '', '', 0, '0', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (252, '', '获取登录用户信息', '', '/api/v1/getinfo', '/0/63/256/252', 'A', 'GET', '', 256, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (253, '', '角色数据权限', '', '/api/v1/roledatascope', '/0/63/256/253', 'A', 'PUT', '', 256, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-07-10 20:47:58.000', NULL);
INSERT INTO `sys_menu` VALUES (254, '', '部门树接口【数据权限】', '', '/api/v1/roleDeptTreeselect/:id', '/0/63/256/254', 'A', 'GET', '', 256, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (255, '', '部门树【用户列表】', '', '/api/v1/deptTree', '/0/63/256/255', 'A', 'GET', '', 256, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (256, '', '必开接口', '', '', '/0/63/256', 'M', 'GET', '', 63, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (257, '', '通过key获取参数', 'bug', '/api/v1/configKey/:id', '/0/63/256/257', 'A', 'GET', '', 256, 0, '', '', 1, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (258, '', '退出登录', '', '/api/v1/logout', '/0/63/256/258', 'A', 'POST', '', 256, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (259, '', '头像上传', '', '/api/v1/user/avatar', '/0/63/256/267/259', 'A', 'POST', '', 267, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-05-03 20:50:05.000', NULL);
INSERT INTO `sys_menu` VALUES (260, '', '修改密码', '', '/api/v1/user/pwd', '/0/63/256/260', 'A', 'PUT', '', 256, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (261, 'Gen', '代码生成', 'code', 'gen', '/0/60/261', 'C', '', '', 60, 0, '', '/tools/gen/index', 2, '0', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-04-12 11:18:12.000', NULL);
INSERT INTO `sys_menu` VALUES (262, 'EditTable', '代码生成修改', 'build', 'editTable', '/0/60/262', 'C', '', '', 60, 0, '', '/tools/gen/editTable', 100, '1', 1, 1, '0', '2020-04-11 15:52:48.000', '2020-05-03 20:38:36.000', NULL);
INSERT INTO `sys_menu` VALUES (263, '', '字典类型下拉框【生成功能】', '', '/api/v1/dict/typeoptionselect', '/0/63/256/263', 'A', 'GET', '', 256, 0, '', '', 0, '1', 1, 1, '0', '2020-04-11 15:52:48.000', NULL, NULL);
INSERT INTO `sys_menu` VALUES (264, 'Build', '表单构建', 'build', 'build', '/0/60/264', 'C', '', '', 60, 0, '', '/tools/build/index', 1, '0', 1, 1, '1', '2020-04-11 15:52:48.000', '2020-07-18 13:51:47.000', NULL);
INSERT INTO `sys_menu` VALUES (267, '', '个人中心', '', '', '/0/63/256/267', 'M', '', '', 256, 0, '', '', 0, '1', 1, 1, '1', '2020-05-03 20:49:39.000', '2020-05-03 20:49:39.000', NULL);
INSERT INTO `sys_menu` VALUES (269, 'Server', '服务监控', 'druid', 'system/monitor', '/0/60/269', 'C', '', 'monitor:server:list', 60, 0, '', '/system/monitor', 0, '0', 1, 1, '1', '2020-04-14 00:28:19.000', '2020-08-09 02:07:53.000', NULL);
INSERT INTO `sys_menu` VALUES (459, 'sys_job管理', '定时任务', 'time-range', '/sys_job', '/0/459', 'M', '无', '', 0, 0, '', 'Layout', 2, '0', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-09 01:27:11.000', NULL);
INSERT INTO `sys_menu` VALUES (460, 'sys_job管理', '定时任务', 'tool', 'sys_job', '/0/459/460', 'C', '无', 'sysjob:sysjob:list', 459, 0, '', '/sysjob/index', 0, '0', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-04 15:18:32.000', NULL);
INSERT INTO `sys_menu` VALUES (461, 'sys_job', '分页获取定时任务', 'pass', 'sys_job', '/0/459/460/461', 'F', '无', 'sysjob:sysjob:query', 460, 0, '', '', 0, '0', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (462, 'sys_job', '创建定时任务', 'pass', 'sys_job', '/0/459/460/462', 'F', '无', 'sysjob:sysjob:add', 460, 0, '', '', 0, '0', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (463, 'sys_job', '修改定时任务', 'pass', 'sys_job', '/0/459/460/463', 'F', '无', 'sysjob:sysjob:edit', 460, 0, '', '', 0, '0', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (464, 'sys_job', '删除定时任务', 'pass', 'sys_job', '/0/459/460/464', 'F', '无', 'sysjob:sysjob:remove', 460, 0, '', '', 0, '0', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (465, 'sys_job', '定时任务', 'bug', 'sys_job', '/0/63/465', 'M', '无', '', 63, 0, '', '', 0, '1', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (466, 'sys_job', '分页获取定时任务', 'bug', '/api/v1/sysjob', '/0/63/465/466', 'A', 'GET', '', 465, 0, '', '', 0, '1', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (467, 'sys_job', '根据id获取定时任务', 'bug', '/api/v1/sysjob/:id', '/0/63/465/467', 'A', 'GET', '', 465, 0, '', '', 0, '1', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (468, 'sys_job', '创建定时任务', 'bug', '/api/v1/sysjob', '/0/63/465/468', 'A', 'POST', '', 465, 0, '', '', 0, '1', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (469, 'sys_job', '修改定时任务', 'bug', '/api/v1/sysjob', '/0/63/465/469', 'A', 'PUT', '', 465, 0, '', '', 0, '1', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (470, 'sys_job', '删除定时任务', 'bug', '/api/v1/sysjob/:id', '/0/63/465/470', 'A', 'DELETE', '', 465, 0, '', '', 0, '1', 1, 1, '0', '2020-08-03 09:17:37.000', '2020-08-03 09:17:37.000', NULL);
INSERT INTO `sys_menu` VALUES (471, 'job_log', '日志', 'bug', 'job_log', '/0/459/471', 'C', '', '', 459, 0, '', '/sysjob/log', 0, '1', 1, 1, '1', '2020-08-05 21:24:46.000', '2020-08-06 00:02:20.000', NULL);
INSERT INTO `sys_menu` VALUES (473, 'sysSetting', '系统配置', 'form', 'syssettings', '/0/60/473', 'C', '无', 'syssetting:syssetting:list', 60, 0, '', '/system/settings', 0, '0', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 02:17:10.000', NULL);
INSERT INTO `sys_menu` VALUES (474, 'sys_setting', '分页获取SysSetting', 'pass', 'sys_setting', '/0/60/473/474', 'F', '无', 'syssetting:syssetting:query', 473, 0, '', '', 0, '0', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (475, 'sys_setting', '创建SysSetting', 'pass', 'sys_setting', '/0/60/473/475', 'F', '无', 'syssetting:syssetting:add', 473, 0, '', '', 0, '0', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (476, 'sys_setting', '修改SysSetting', 'pass', 'sys_setting', '/0/60/473/476', 'F', '无', 'syssetting:syssetting:edit', 473, 0, '', '', 0, '0', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (477, 'sys_setting', '删除SysSetting', 'pass', 'sys_setting', '/0/60/473/477', 'F', '无', 'syssetting:syssetting:remove', 473, 0, '', '', 0, '0', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (478, 'sys_setting', 'SysSetting', 'bug', 'sys_setting', '/0/63/478', 'M', '无', '', 63, 0, '', '', 0, '1', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (479, 'sys_setting', '分页获取SysSetting', 'bug', '/api/v1/syssettingList', '/0/63/478/479', 'A', 'GET', '', 478, 0, '', '', 0, '1', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (480, 'sys_setting', '根据id获取SysSetting', 'bug', '/api/v1/syssetting/:id', '/0/63/478/480', 'A', 'GET', '', 478, 0, '', '', 0, '1', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (481, 'sys_setting', '创建SysSetting', 'bug', '/api/v1/syssetting', '/0/63/478/481', 'A', 'POST', '', 478, 0, '', '', 0, '1', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (482, 'sys_setting', '修改SysSetting', 'bug', '/api/v1/syssetting', '/0/63/478/482', 'A', 'PUT', '', 478, 0, '', '', 0, '1', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (483, 'sys_setting', '删除SysSetting', 'bug', '/api/v1/syssetting/:id', '/0/63/478/483', 'A', 'DELETE', '', 478, 0, '', '', 0, '1', 1, 1, '0', '2020-08-09 01:05:22.000', '2020-08-09 01:05:22.000', NULL);
INSERT INTO `sys_menu` VALUES (496, 'Sources', '资源管理', 'network', '/sources', '/0/496', 'M', '无', '', 0, 1, '', 'Layout', 3, '0', 1, 1, '1', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (497, 'File', '文件管理', 'documentation', 'file-manage', '/0/496/497', 'C', '', '', 496, 1, '', '/fileManage/index', 0, '0', 1, 1, '1', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (499, 'SysCategory', '分类', 'pass', 'syscategory', '/0/498/499', 'C', '无', 'syscategory:syscategory:list', 498, 1, '', '/syscategory/index', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (500, '', '分页获取分类', 'pass', '', '/0/498/499/500', 'F', '无', 'syscategory:syscategory:query', 499, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (501, '', '创建分类', 'pass', '', '/0/498/499/501', 'F', '无', 'syscategory:syscategory:add', 499, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (502, '', '修改分类', 'pass', '', '/0/498/499/502', 'F', '无', 'syscategory:syscategory:edit', 499, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (503, '', '删除分类', 'pass', '', '/0/498/499/503', 'F', '无', 'syscategory:syscategory:remove', 499, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (504, 'Category', '分类', 'bug', 'category', '/0/63/504', 'M', '无', '', 63, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (505, '', '分页获取分类', 'bug', '/api/v1/syscategoryList', '/0/63/504/505', 'A', 'GET', '', 504, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (506, '', '根据id获取分类', 'bug', '/api/v1/syscategory/:id', '/0/63/504/506', 'A', 'GET', '', 504, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (507, '', '创建分类', 'bug', '/api/v1/syscategory', '/0/63/504/507', 'A', 'POST', '', 504, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (508, '', '修改分类', 'bug', '/api/v1/syscategory', '/0/63/504/508', 'A', 'PUT', '', 504, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (509, '', '删除分类', 'bug', '/api/v1/syscategory/:id', '/0/63/504/509', 'A', 'DELETE', '', 504, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (511, 'SysContent', '内容管理', 'pass', 'syscontent', '/0/498/511', 'C', '无', 'syscontent:syscontent:list', 498, 1, '', '/syscontent/index', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (512, '', '分页获取内容管理', 'pass', '', '/0/510/511/512', 'F', '无', 'syscontent:syscontent:query', 511, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (513, '', '创建内容管理', 'pass', '', '/0/510/511/513', 'F', '无', 'syscontent:syscontent:add', 511, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (514, '', '修改内容管理', 'pass', '', '/0/510/511/514', 'F', '无', 'syscontent:syscontent:edit', 511, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (515, '', '删除内容管理', 'pass', '', '/0/510/511/515', 'F', '无', 'syscontent:syscontent:remove', 511, 1, '', '', 0, '0', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (516, 'Content', '内容管理', 'bug', 'content', '/0/63/516', 'M', '无', '', 63, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (517, '', '分页获取内容管理', 'bug', '/api/v1/syscontentList', '/0/63/516/517', 'A', 'GET', '', 516, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (518, '', '根据id获取内容管理', 'bug', '/api/v1/syscontent/:id', '/0/63/516/518', 'A', 'GET', '', 516, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (519, '', '创建内容管理', 'bug', '/api/v1/syscontent', '/0/63/516/519', 'A', 'POST', '', 516, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (520, '', '修改内容管理', 'bug', '/api/v1/syscontent', '/0/63/516/520', 'A', 'PUT', '', 516, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
INSERT INTO `sys_menu` VALUES (521, '', '删除内容管理', 'bug', '/api/v1/syscontent/:id', '/0/63/516/521', 'A', 'DELETE', '', 516, 1, '', '', 0, '1', 1, 1, '0', '2021-01-19 23:25:43.114', '2021-01-19 23:25:43.114', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_migration
-- ----------------------------
DROP TABLE IF EXISTS `sys_migration`;
CREATE TABLE `sys_migration` (
  `version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apply_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_migration
-- ----------------------------
BEGIN;
INSERT INTO `sys_migration` VALUES ('1599190683659', '2021-01-19 23:25:42.925');
INSERT INTO `sys_migration` VALUES ('1599190683670', '2021-01-19 23:25:43.110');
INSERT INTO `sys_migration` VALUES ('1599190683680', '2021-01-19 23:25:43.124');
COMMIT;

-- ----------------------------
-- Table structure for sys_opera_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_opera_log`;
CREATE TABLE `sys_opera_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '''主键编码''',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作模块',
  `business_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作类型',
  `business_types` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'BusinessTypes',
  `method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '函数',
  `request_method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求方式',
  `operator_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作类型',
  `oper_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作者',
  `dept_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '访问地址',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '客户端ip',
  `oper_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '访问位置',
  `oper_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求参数',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作状态',
  `oper_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `json_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '返回数据',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `latency_time` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '耗时',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ua',
  `create_by` bigint DEFAULT NULL COMMENT '''创建者''',
  `update_by` bigint DEFAULT NULL COMMENT '''更新者''',
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_opera_log_create_by` (`create_by`) USING BTREE,
  KEY `idx_sys_opera_log_update_by` (`update_by`) USING BTREE,
  KEY `idx_sys_opera_log_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_opera_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_opera_log` VALUES (1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT,
  `post_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `post_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sort` bigint DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, '首席执行官', 'CEO', 0, '2', '首席执行官', '1', '1', '2021-01-19 23:25:42.930', '2021-01-24 12:38:45.620', NULL);
INSERT INTO `sys_post` VALUES (2, '首席技术执行官', 'CTO', 5, '1', '首席技术执行官', '1', '1', '2021-01-19 23:25:42.930', '2021-01-24 12:41:55.829', '2021-01-24 12:41:17.307');
INSERT INTO `sys_post` VALUES (3, '首席运营官', 'COO', 3, '1', '测试工程师', '1', '1', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', '2021-01-24 12:41:17.307');
INSERT INTO `sys_post` VALUES (4, 'test', 'test', 0, '0', '111', '1', '1', '2021-01-24 12:43:39.919', NULL, '2021-01-24 12:43:43.841');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `role_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `role_sort` bigint DEFAULT NULL,
  `flag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `data_scope` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '系统管理员', '2', 'admin', 1, '', '1', '1', '', 1, '2', '2021-01-19 23:25:42.930', '2021-01-23 21:08:47.189', NULL);
INSERT INTO `sys_role` VALUES (2, 'test', '1', 'test', 1, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '2021-01-23 21:41:39.418');
INSERT INTO `sys_role` VALUES (3, '测试', '2', 'user', 1, NULL, '1', '1', NULL, 1, '1', '2021-01-23 21:28:12.117', '2021-01-26 00:10:39.746', '2021-01-23 21:41:39.418');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL,
  `dept_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (1, 1, 1);
INSERT INTO `sys_role_dept` VALUES (4, 1, 10);
INSERT INTO `sys_role_dept` VALUES (6, 1, 9);
INSERT INTO `sys_role_dept` VALUES (7, 3, 9);
INSERT INTO `sys_role_dept` VALUES (8, 3, 10);
INSERT INTO `sys_role_dept` VALUES (9, 3, 1);
INSERT INTO `sys_role_dept` VALUES (10, 3, 7);
INSERT INTO `sys_role_dept` VALUES (11, 3, 8);
INSERT INTO `sys_role_dept` VALUES (12, 3, 11);
INSERT INTO `sys_role_dept` VALUES (13, 3, 12);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL,
  `menu_id` bigint DEFAULT NULL,
  `role_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `create_by` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `update_by` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (572, 2, 43, 'test', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (573, 2, 44, 'test', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (574, 2, 220, 'test', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (575, 2, 221, 'test', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (576, 2, 2, 'test', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (577, 2, 3, 'test', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (578, 2, 51, 'test', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (579, 3, 2, 'sss', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (580, 3, 3, 'sss', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (582, 3, 44, 'sss', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (585, 3, 51, 'sss', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (588, 3, 222, 'sss', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (595, 3, 56, 'sss', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (596, 3, 228, 'sss', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (627, 3, 256, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (628, 3, 257, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (629, 3, 516, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (630, 3, 517, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (631, 3, 518, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (632, 3, 519, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (633, 3, 520, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (634, 3, 521, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (635, 3, 258, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (636, 3, 259, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (637, 3, 260, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (638, 3, 263, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (639, 3, 267, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (640, 3, 509, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (641, 3, 63, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (642, 3, 64, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (643, 3, 66, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (644, 3, 67, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (645, 3, 68, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (646, 3, 69, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (647, 3, 70, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (648, 3, 71, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (649, 3, 72, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (650, 3, 73, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (651, 3, 74, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (652, 3, 75, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (653, 3, 76, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (654, 3, 77, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (655, 3, 78, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (656, 3, 79, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (657, 3, 80, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (658, 3, 81, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (659, 3, 82, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (660, 3, 83, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (661, 3, 84, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (662, 3, 85, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (663, 3, 86, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (664, 3, 87, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (665, 3, 89, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (666, 3, 90, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (667, 3, 91, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (668, 3, 92, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (669, 3, 93, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (670, 3, 94, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (671, 3, 95, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (672, 3, 96, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (673, 3, 97, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (674, 3, 103, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (675, 3, 104, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (676, 3, 105, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (677, 3, 106, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (678, 3, 107, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (679, 3, 108, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (680, 3, 109, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (681, 3, 110, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (682, 3, 111, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (683, 3, 112, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (684, 3, 113, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (685, 3, 114, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (686, 3, 115, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (687, 3, 116, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (688, 3, 117, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (689, 3, 118, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (690, 3, 119, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (691, 3, 120, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (692, 3, 121, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (693, 3, 122, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (694, 3, 123, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (695, 3, 138, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (696, 3, 142, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (697, 3, 201, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (698, 3, 202, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (699, 3, 203, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (700, 3, 204, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (701, 3, 205, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (702, 3, 206, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (703, 3, 465, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (704, 3, 466, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (705, 3, 467, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (706, 3, 468, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (707, 3, 213, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (708, 3, 214, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (709, 3, 215, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (710, 3, 469, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (711, 3, 217, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (712, 3, 470, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (713, 3, 478, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (714, 3, 479, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (715, 3, 480, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (716, 3, 481, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (717, 3, 482, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (718, 3, 483, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (719, 3, 508, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (720, 3, 504, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (721, 3, 505, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (722, 3, 506, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (723, 3, 507, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (724, 3, 252, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (725, 3, 253, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (726, 3, 254, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (727, 3, 255, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (728, 3, 52, '测试', '1', NULL);
INSERT INTO `sys_role_menu` VALUES (740, 3, 225, '测试', '1', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting` (
  `settings_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '''最后更新时间''',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '''删除时间''',
  PRIMARY KEY (`settings_id`) USING BTREE,
  KEY `idx_sys_setting_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_setting
-- ----------------------------
BEGIN;
INSERT INTO `sys_setting` VALUES (1, 'go-admin管理系统', 'https://gitee.com/mydearzwj/image/raw/master/img/go-admin.png', '2021-01-19 23:25:42.930', '2021-01-19 23:25:42.930', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_tables
-- ----------------------------
DROP TABLE IF EXISTS `sys_tables`;
CREATE TABLE `sys_tables` (
  `table_id` bigint NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `table_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tpl_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `function_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `function_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pk_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pk_go_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pk_json_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tree_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tree_parent_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tree` tinyint(1) DEFAULT NULL,
  `crud` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_data_scope` tinyint DEFAULT NULL,
  `is_actions` tinyint DEFAULT NULL,
  `is_auth` tinyint DEFAULT NULL,
  `is_logical_delete` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logical_delete` tinyint(1) DEFAULT NULL,
  `logical_delete_column` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_tables
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nick_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dept_id` bigint DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', 'ibry', '13818888811', 1, '', '', '0', '1@qq.com', 1, 2, '1', '1', '', '2', '2021-01-19 23:25:42.930', '2021-01-23 11:46:00.821', NULL);
INSERT INTO `sys_user` VALUES (2, 'test', '123456', 'test', '18888888888', 1, NULL, NULL, '2', '330931931@qq.com', 1, 1, '1', '1', 'test', '1', '2021-01-23 00:19:56.369', '2021-01-23 00:43:05.029', '2021-01-23 01:42:18.513');
INSERT INTO `sys_user` VALUES (3, 'test2', '123456', 'test2', '18888888111', 1, NULL, NULL, '2', 'ibryang@163.com', 9, 3, '1', '1', NULL, '2', '2021-01-23 00:44:08.362', '2021-01-23 02:00:31.918', '2021-01-23 01:35:25.474');
INSERT INTO `sys_user` VALUES (4, 'liangqiu', '123456', '凉秋', '18888888888', 3, NULL, NULL, '1', '330931931@qq.com', 7, 1, '1', NULL, NULL, '2', '2021-01-24 16:09:06.589', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
