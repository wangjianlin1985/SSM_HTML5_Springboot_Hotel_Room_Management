/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : room_order_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-06-29 16:10:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_bookorder`
-- ----------------------------
DROP TABLE IF EXISTS `t_bookorder`;
CREATE TABLE `t_bookorder` (
  `orderId` int(11) NOT NULL auto_increment COMMENT '订单id',
  `roomObj` varchar(20) NOT NULL COMMENT '预订房间',
  `roomTypeObj` int(11) NOT NULL COMMENT '房间类型',
  `userObj` varchar(30) NOT NULL COMMENT '预订人',
  `liveDate` varchar(20) default NULL COMMENT '入住日期',
  `days` int(11) NOT NULL COMMENT '预订天数',
  `totalMoney` float NOT NULL COMMENT '总价',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  `orderState` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '预订时间',
  PRIMARY KEY  (`orderId`),
  KEY `roomObj` (`roomObj`),
  KEY `roomTypeObj` (`roomTypeObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_bookorder_ibfk_1` FOREIGN KEY (`roomObj`) REFERENCES `t_room` (`roomNo`),
  CONSTRAINT `t_bookorder_ibfk_2` FOREIGN KEY (`roomTypeObj`) REFERENCES `t_roomtype` (`roomTypeId`),
  CONSTRAINT `t_bookorder_ibfk_3` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bookorder
-- ----------------------------
INSERT INTO `t_bookorder` VALUES ('1', '101', '1', 'user1', '2018-01-31', '2', '400', '老板帮我留着哈！', '已退房', '2018-01-28 17:56:10');
INSERT INTO `t_bookorder` VALUES ('2', '101', '1', 'user1', '2018-02-05', '2', '400', '出差还要在这里待2天哦', '待付款', '2018-01-30 23:41:59');
INSERT INTO `t_bookorder` VALUES ('3', '102', '2', 'user2', '2018-01-03', '2', '700', '我想住干净的房间', '待处理', '2018-01-31 00:02:12');
INSERT INTO `t_bookorder` VALUES ('4', '102', '2', 'user1', '2018-03-03', '3', '1050', '我和我老婆要来度蜜月', '已付款', '2018-02-21 16:58:47');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '我预订房间方便了', '有了这个网站，我以后可以网上预订房间了', 'user1', '2018-01-28 17:56:44', '是的，我们就是为了大家的方便', '2018-01-28 17:56:56');
INSERT INTO `t_leaveword` VALUES ('2', '111', '22', 'user1', '2018-01-30 22:50:10', '33', '2018-01-30 22:50:32');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `hitNum` int(11) NOT NULL COMMENT '点击率',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '网上订房网站开通了', '<p>好消息到，同志们，需要预订酒店房间的朋友，可以到我们网站注册预订了哈！</p>', '4', '2018-01-28 17:57:41');

-- ----------------------------
-- Table structure for `t_room`
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `roomNo` varchar(20) NOT NULL COMMENT 'roomNo',
  `roomTypeObj` int(11) NOT NULL COMMENT '房间类型',
  `roomPhoto` varchar(60) NOT NULL COMMENT '房间图片',
  `roomPrice` float NOT NULL COMMENT '价格(每天)',
  `floorNum` varchar(20) NOT NULL COMMENT '楼层',
  `roomState` varchar(20) NOT NULL COMMENT '占用状态',
  `roomDesc` varchar(5000) NOT NULL COMMENT '房间描述',
  PRIMARY KEY  (`roomNo`),
  KEY `roomTypeObj` (`roomTypeObj`),
  CONSTRAINT `t_room_ibfk_1` FOREIGN KEY (`roomTypeObj`) REFERENCES `t_roomtype` (`roomTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('101', '1', 'upload/470a411a-3ac5-40bb-aabc-96c0123bfac6.jpg', '200', '1', '空闲中', '<p><strong class=\"ft14\" style=\"transition: background-color 0.2s ease-out; font-size: 14px; font-family: Verdana; white-space: normal;\">房型简介</strong><span style=\"font-family: Verdana; font-size: 12px; background-color: rgb(255, 255, 255);\"></span></p><p>普通单人间，价格优惠，适合学生小情侣入住里边有无线网络20兆带电脑，厕所在房间旁边，是公共卫生间。2个普通单人房间公用一个卫生间，提供2人生活用品，24小时电热水器，有电视机，电水壶，水杯，台灯等室内配置，楼层5楼，比较安静。推荐经济房入住。床宽1.6米，长2米,！最多入住1人<br/><br/></p><p><strong class=\"ft14\" style=\"transition: background-color 0.2s ease-out; font-size: 14px; font-family: Verdana; white-space: normal;\">房型设施</strong><span style=\"font-family: Verdana; font-size: 12px; background-color: rgb(255, 255, 255);\"></span></p><ul class=\"clearfix list-paddingleft-2\" style=\"transition: background-color 0.2s ease-out; padding: 0px;\"><li><p>电视<br/><br/></p></li></ul><p><img src=\"/JavaWebProject/upload/20180131/1517328885563067902.jpg\" title=\"1517328885563067902.jpg\" alt=\"22.jpg\"/></p>');
INSERT INTO `t_room` VALUES ('102', '2', 'upload/570f27b5-cefe-473e-81b9-020350b745f1.jpg', '350', '1', '空闲中', '<p><strong class=\"ft14\" style=\"transition: background-color 0.2s ease-out; font-size: 14px; font-family: Verdana; white-space: normal;\">房型简介</strong><span style=\"font-family: Verdana; font-size: 12px; background-color: rgb(255, 255, 255);\"></span></p><p>标准双人间，两张床，一米二一张，独立卫生间。房间安静，宽阔。建筑面积：20平方米，楼层：2-5层，床型：单人床1.5米，2张，最多入住人数：2人<br/><br/></p><p><strong class=\"ft14\" style=\"transition: background-color 0.2s ease-out; font-size: 14px; font-family: Verdana; white-space: normal;\">房型设施</strong><span style=\"font-family: Verdana; font-size: 12px; background-color: rgb(255, 255, 255);\"></span></p><ul class=\"clearfix list-paddingleft-2\" style=\"transition: background-color 0.2s ease-out; padding: 0px;\"><li><p>卫浴 &nbsp;宽带 &nbsp;电视</p></li></ul><p><br/><img src=\"/JavaWebProject/upload/20180131/1517329010315085395.jpg\" title=\"1517329010315085395.jpg\" alt=\"22.jpg\"/></p><p><br/></p>');

-- ----------------------------
-- Table structure for `t_roomtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_roomtype`;
CREATE TABLE `t_roomtype` (
  `roomTypeId` int(11) NOT NULL auto_increment COMMENT '类型id',
  `roomTypeName` varchar(20) NOT NULL COMMENT '房间类型',
  `price` float NOT NULL COMMENT '价格(每天)',
  PRIMARY KEY  (`roomTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roomtype
-- ----------------------------
INSERT INTO `t_roomtype` VALUES ('1', '普通单人间', '200');
INSERT INTO `t_roomtype` VALUES ('2', '标准双人间', '350');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `cardNumber` varchar(30) NOT NULL COMMENT '身份证号',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', 'upload/26e0dd04-29be-4259-bb02-bfd108a2e4f1.jpg', '2018-01-02', '513042199612113439', '13958342342', 'dashen@163.com', '四川成都红星路13号', '2018-01-28 17:53:47');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '李明霞', '女', 'upload/8a0b5e8d-78d3-4758-80a1-9d540414ddb5.jpg', '2018-01-04', '513055199812024323', '13984083084', 'mingxia@163.com', '四川攀枝花', '2018-01-30 23:50:30');
