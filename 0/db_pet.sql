/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : db_pet

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-11-08 17:51:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `ID` varchar(70) NOT NULL COMMENT '唯一编号',
  `OPENID` varchar(20) DEFAULT NULL COMMENT '微信登录ID',
  `CELL_NUMBER` varchar(20) DEFAULT NULL COMMENT '手机号',
  `NICK_NAME` varchar(20) NOT NULL COMMENT '昵称',
  `PASSWORD` varchar(40) NOT NULL COMMENT '密码',
  `HEAD_IMG` varchar(100) DEFAULT NULL COMMENT '头像',
  `SEX` char(2) DEFAULT NULL COMMENT '性别（0：女 1：男）',
  `MOTTO` varchar(50) DEFAULT NULL COMMENT '个性签名',
  `PROVINCE` varchar(20) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(20) DEFAULT NULL COMMENT '城市',
  `IS_REAL_NAME` char(2) DEFAULT '0' COMMENT '是否实名认证（0：否 1：是）',
  `IS_CREDIT` char(2) DEFAULT '0' COMMENT '是否信用认证、授权（0：否 1： 是）',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODEIFY_DATE` varchar(20) NOT NULL COMMENT '修改时间',
  `CREATE_USER_ID` varchar(20) NOT NULL DEFAULT '0' COMMENT '创建人员编号',
  `MODEIFY_USER_ID` varchar(20) NOT NULL DEFAULT '0' COMMENT '修改人员编号',
  `IS_LOCKED` char(2) NOT NULL DEFAULT '0' COMMENT '是否锁定（0：否 1：是）',
  `IS_DELETED` char(2) NOT NULL DEFAULT '0' COMMENT '是否删除（0：否 1：是）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
