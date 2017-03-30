/*
Navicat MySQL Data Transfer

Source Server         : MySQLConnection
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : fsw

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-04-24 19:00:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `filestore`
-- ----------------------------
DROP TABLE IF EXISTS `filestore`;
CREATE TABLE `filestore` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(50) NOT NULL,
  `creationTime` datetime NOT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of filestore
-- ----------------------------

-- ----------------------------
-- Table structure for `user_registration`
-- ----------------------------
DROP TABLE IF EXISTS `user_registration`;
CREATE TABLE `user_registration` (
  `sno` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `emailId` varchar(50) NOT NULL,
  `mobileNo` varchar(10) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_registration
-- ----------------------------
