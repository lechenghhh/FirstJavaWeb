/*
Navicat MySQL Data Transfer

Source Server         : 本地的MySQL
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : microweb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-01-25 10:23:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `lasttime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', 'mysql 建数据库用什么字符集222', 'mysql基本支持所有字符集，默认为latin1拉丁字符集，多数选用utf8，支持全部字符，占用空间大，只想在中国使用可以使用gbk。', '2017-01-13 17:41:45');
INSERT INTO `news` VALUES ('2', '百威啤酒\r\n百威啤酒 推荐 来自 微博 weibo.com', '1辆自行车、16个日夜、1200公里归家路……父女上演现实版千里走单骑年度暖心大片。这部年度暖心大片，过年回家前大家应该看看。 L百威年度催泪大片 暖心一整年', '2017-01-02 09:06:57');
INSERT INTO `news` VALUES ('3', '中国国家地理 37分钟前 来自 皮皮时光机', '1920年1月2日，美国科幻小说作家艾萨克·阿西莫夫出生。在小说《我，机器人》中，他提出三大法则：一，机器人不得伤害人类，或坐视人类受到伤害；二，除非违背第一法则，机器人必须服从人类命令；三，在不违背第一及第二法则下，机器人必须保护自己。这成为后续科幻作品所遵从的定理。', '2017-01-02 09:07:29');
INSERT INTO `news` VALUES ('4', 'Lens杂志 58分钟前 来自 微博 weibo.com', 'KissLens 或许世上几乎所有人都不追求什么自由，不过自以为追求罢了。一切都是幻想。假如真给予自由，人们十有八九不知所措。——村上春树（Photo by Paolo Raeli）', '2017-01-13 13:04:24');
INSERT INTO `news` VALUES ('26', '好玩好玩真好玩', '好玩啊的真的好好玩', '2017-01-13 17:37:34');
INSERT INTO `news` VALUES ('28', '28282828', '28lai 放大就风好大快捷键', '2017-01-18 13:09:28');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT 'name',
  `math` int(11) NOT NULL DEFAULT '60',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'lecheng', '100');
INSERT INTO `student` VALUES ('2', 'jiangshan22', '88');
INSERT INTO `student` VALUES ('3', 'wangjiawu33', '78');
INSERT INTO `student` VALUES ('4', 'duchangfeng44', '100');

-- ----------------------------
-- Table structure for websites
-- ----------------------------
DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `alexa` int(11) NOT NULL DEFAULT '0',
  `country` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of websites
-- ----------------------------
INSERT INTO `websites` VALUES ('1', 'Google', 'https://www.google.cm/', '1', 'USA');
INSERT INTO `websites` VALUES ('2', '淘宝', 'https://www.taobao.com/', '13', 'CN');
INSERT INTO `websites` VALUES ('3', '菜鸟教程', 'http://www.runoob.com', '5892', '');
INSERT INTO `websites` VALUES ('4', '微博', 'http://weibo.com/', '20', 'CN');
INSERT INTO `websites` VALUES ('5', 'Facebook', 'https://www.facebook.com/', '3', 'USA');
INSERT INTO `websites` VALUES ('7', 'google', 'www.google.com', '1', 'USA');
INSERT INTO `websites` VALUES ('8', '淘宝', 'www.taobao.com', '13', 'CN');
INSERT INTO `websites` VALUES ('9', '菜鸟教程', 'www.runoob.com', '5892', 'CN');
INSERT INTO `websites` VALUES ('10', '微博', 'www.weibo.com', '20', 'CN');
INSERT INTO `websites` VALUES ('11', 'Facebook', 'www.facebook.com', '3', 'USA');
SET FOREIGN_KEY_CHECKS=1;
