/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-02-12 23:44:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `dic_id` int(32) NOT NULL AUTO_INCREMENT,
  `dic_type` varchar(128) DEFAULT NULL,
  `dic_name` varchar(255) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `available` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------
INSERT INTO `t_dictionary` VALUES ('13', '负责人', '刘宗恺', '研发负责人', '1');
INSERT INTO `t_dictionary` VALUES ('14', '负责人', '代艳明', '研发负责人', '1');
INSERT INTO `t_dictionary` VALUES ('15', '所属行业', '军工', '重点行业', '1');

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `permission_id` int(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `prj_id` int(32) NOT NULL AUTO_INCREMENT,
  `prj_name` varchar(64) NOT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `product_version` varchar(128) DEFAULT NULL,
  `issue_type` varchar(50) DEFAULT NULL,
  `describtion` varchar(4096) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `engineer` varchar(50) DEFAULT NULL,
  `engineer_tel` varchar(50) DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `labor_costs` float DEFAULT NULL,
  `reporter` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `process` varchar(4096) DEFAULT NULL,
  `improvement` varchar(2048) DEFAULT NULL,
  `comments` varchar(4096) DEFAULT NULL,
  `last_response` datetime DEFAULT NULL,
  `operator_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`prj_id`),
  KEY `prj_name` (`prj_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1706 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1703', '浙江移动', '金融/电信', '0.1.2b', '网关_服务器', '并发错误', '2017-02-06 00:00:00', '已完成', '都保星', null, '2017-02-06 00:00:00', '2', '秦琼', '15210369853', '并发错误', '并发错误', '并发错误', '2017-02-06 00:00:00', null);
INSERT INTO `t_project` VALUES ('1704', '北京市公安局', '公安', '0.2.5r', '网关_服务器', '反向代理问题', '2017-02-03 00:00:00', '进行中', '邓佳佳', null, null, '1', '李东兴', '15301236548', '分析原因\r\n2017-02-06 13:40:23\r\n2017-02-06 13:40:27\r\n2017-02-06 13:42:23', '分析原因', '分析原因', '2017-02-06 00:00:00', null);
INSERT INTO `t_project` VALUES ('1705', '北京教委', '政府/综合', '0.2.5r', '网关_旁路_Agent', 'E:\\JavaWorkspace\\project\r\n北京教委', '2017-02-01 00:00:00', '进行中', '都保星', null, null, '3', '郑振铎', '1325689784165', '北京教委', '北京教委', '北京教委', '2017-02-06 00:00:00', null);

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(32) NOT NULL DEFAULT '0',
  `permission_id` int(32) DEFAULT NULL,
  `role_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (null, '1', '0');
