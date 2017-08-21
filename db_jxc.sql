/*
Navicat MySQL Data Transfer

Source Server         : nils
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_jxc

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-17 09:12:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) NOT NULL,
  `menu` varchar(255) NOT NULL,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isForb` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '所有权限', '2017-08-16 18:47:23', '否');
INSERT INTO `role` VALUES ('2', '普通员工', '除系统管理外所有操作', '2017-08-16 18:47:28', '否');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roleM` (`role_id`),
  KEY `fk_menu` (`menu_id`),
  CONSTRAINT `fk_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `fk_roleM` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_role` (`role_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------

-- ----------------------------
-- Table structure for tb_kucun
-- ----------------------------
DROP TABLE IF EXISTS `tb_kucun`;
CREATE TABLE `tb_kucun` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(30) NOT NULL DEFAULT '',
  `spname` varchar(50) NOT NULL,
  `jc` varchar(25) DEFAULT NULL,
  `cd` varchar(50) DEFAULT NULL,
  `gg` varchar(50) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `dw` varchar(10) DEFAULT NULL,
  `dj` decimal(10,2) DEFAULT NULL,
  `kcsl` int(11) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_kucun
-- ----------------------------
INSERT INTO `tb_kucun` VALUES ('1', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '42.00', '19400');
INSERT INTO `tb_kucun` VALUES ('2', 'sp1007', '铅笔', 'QB', '长春', '9*', '沿着', '铅笔厂', '10.00', '4');
INSERT INTO `tb_kucun` VALUES ('3', 'sp1008', '手工艺品', 'SAYP', '长春市', '1', '5', '长春', '0.00', '999');
INSERT INTO `tb_kucun` VALUES ('4', 'sp1003', '碧**莉香型洗衣粉', 'BLMLXXXYF', '广**保洁公司', '350g', '塑包', '袋', '0.00', '6');
INSERT INTO `tb_kucun` VALUES ('5', 'sp1009', '锅巴', '锅巴', '吉林', '200G/袋', '袋', '袋', '0.00', '0');
INSERT INTO `tb_kucun` VALUES ('6', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '30.00', '19400');
INSERT INTO `tb_kucun` VALUES ('7', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('8', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('9', 'sp1007', '铅笔', 'QB', '长春', '9*', '沿着', '铅笔厂', '10.00', '4');
INSERT INTO `tb_kucun` VALUES ('10', 'sp1008', '手工艺品', 'SAYP', '长春市', '1', '5', '长春', '0.00', '999');
INSERT INTO `tb_kucun` VALUES ('11', 'sp1003', '碧**莉香型洗衣粉', 'BLMLXXXYF', '广**保洁公司', '350g', '塑包', '袋', '0.00', '6');
INSERT INTO `tb_kucun` VALUES ('12', 'sp1009', '锅巴', '锅巴', '吉林', '200G/袋', '袋', '袋', '0.00', '0');
INSERT INTO `tb_kucun` VALUES ('13', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('14', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('15', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('16', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('17', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('18', 'sp1007', '铅笔', 'QB', '长春', '9*', '沿着', '铅笔厂', '10.00', '4');
INSERT INTO `tb_kucun` VALUES ('19', 'sp1008', '手工艺品', 'SAYP', '长春市', '1', '5', '长春', '0.00', '999');
INSERT INTO `tb_kucun` VALUES ('20', 'sp1003', '碧**莉香型洗衣粉', 'BLMLXXXYF', '广**保洁公司', '350g', '塑包', '袋', '0.00', '6');
INSERT INTO `tb_kucun` VALUES ('21', 'sp1009', '锅巴', '锅巴', '吉林', '200G/袋', '袋', '袋', '0.00', '0');
INSERT INTO `tb_kucun` VALUES ('22', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('23', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('24', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('25', 'sp1007', '铅笔', 'QB', '长春', '9*', '沿着', '铅笔厂', '10.00', '4');
INSERT INTO `tb_kucun` VALUES ('26', 'sp1008', '手工艺品', 'SAYP', '长春市', '1', '5', '长春', '0.00', '999');
INSERT INTO `tb_kucun` VALUES ('27', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('28', 'sp1003', '碧**莉香型洗衣粉', 'BLMLXXXYF', '广**保洁公司', '350g', '塑包', '袋', '0.00', '6');
INSERT INTO `tb_kucun` VALUES ('29', 'sp1009', '锅巴', '锅巴', '吉林', '200G/袋', '袋', '袋', '0.00', '0');
INSERT INTO `tb_kucun` VALUES ('30', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('31', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');
INSERT INTO `tb_kucun` VALUES ('32', 'sp1005', '润*滴眼液', 'RZDYY', '山*正大福*达制药有限公司', '10ml/支', '纸盒', '盒', '40.00', '19400');

-- ----------------------------
-- Table structure for tb_xsth_main
-- ----------------------------
DROP TABLE IF EXISTS `tb_xsth_main`;
CREATE TABLE `tb_xsth_main` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `xsthID` varchar(30) NOT NULL,
  `pzs` int(11) NOT NULL,
  `je` decimal(10,2) NOT NULL,
  `ysjl` varchar(50) DEFAULT NULL,
  `khname` varchar(100) NOT NULL,
  `thdate` datetime NOT NULL,
  `czy` varchar(30) NOT NULL,
  `jsr` varchar(30) NOT NULL,
  `jsfs` varchar(10) NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_xsth_main
-- ----------------------------
INSERT INTO `tb_xsth_main` VALUES ('1', 'XT20051005001', '1', '6666.00', '0.00', '新*纪文化百货用品商城', '2005-10-05 00:00:00', 'admin', 'jh', '现金');
INSERT INTO `tb_xsth_main` VALUES ('2', 'XT20051005002', '1', '666.00', '合格', '新*纪文化百货用品商城', '2005-10-05 00:00:00', 'admin', 'hj', '现金');
INSERT INTO `tb_xsth_main` VALUES ('3', 'XT20051005003', '1', '890.00', '合格', '新*纪文化百货用品商城', '2005-10-05 00:00:00', 'admin', 'wgh', '现金');
INSERT INTO `tb_xsth_main` VALUES ('4', 'XT20051216001', '1', '790.00', '不合格', '新*纪文化百货用品商城', '2005-12-16 00:00:00', 'admin', 'kk', '现金');
INSERT INTO `tb_xsth_main` VALUES ('5', 'XT20071017001', '1', '2086560.00', '合格', '明日科技有限公司', '2007-10-17 00:00:00', '测试人员', '432', '现金');
INSERT INTO `tb_xsth_main` VALUES ('6', 'XT20071017002', '1', '4173120.00', '不合格', '明日科技有限公司', '2007-10-17 00:00:00', '测试人员', '432', '现金');
INSERT INTO `tb_xsth_main` VALUES ('8', 'XT20080410001', '1', '-151000.00', '321', '明日科技有限公司', '2008-04-10 10:34:27', 'tsoft', '范德萨', '现金');
INSERT INTO `tb_xsth_main` VALUES ('10', '1', '1', '1.00', '不合格', '1', '2017-08-14 00:00:00', '1', '1', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `blacklist` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'A0000', 'admin', 'qKldE223hDbAQLmMgZwdyQ==', 'hwcdbyrvuw', '管理员', '否');
INSERT INTO `user` VALUES ('2', 'B0001', 'ligui', 'eNmoc5qe0kjfW6GCh2wxmg==', 'n@rwrmlkzt', '管理员', '否');
INSERT INTO `user` VALUES ('3', 'B0002', 'hupeng', 'alEf2/UVimmx+QF/IxrzXA==', 'ykdxe$zws~', '普通员工', '否');
INSERT INTO `user` VALUES ('4', 'B0003', 'haonan', '5nmhrWJMTJx7ZREjy09K5A==', 'gpyqt$xm&v', '普通员工', '否');
