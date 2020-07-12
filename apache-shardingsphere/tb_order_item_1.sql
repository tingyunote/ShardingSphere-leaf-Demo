/*
Navicat MySQL Data Transfer

Source Server         : 冉松4
Source Server Version : 50730
Source Host           : 47.104.130.105:3306
Source Database       : myshop_0

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-07-12 09:23:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_order_0
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item_1`;
CREATE TABLE `tb_order_item_1` (
  `id` bigint(8) NOT NULL,
  `order_id` bigint(8) DEFAULT NULL,
  `user_id` bigint(8) DEFAULT NULL,
  `order_item_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


