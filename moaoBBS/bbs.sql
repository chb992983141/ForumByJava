/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-05-01 22:32:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blogscomment
-- ----------------------------
DROP TABLE IF EXISTS `blogscomment`;
CREATE TABLE `blogscomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL,
  `table_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogscomment
-- ----------------------------

-- ----------------------------
-- Table structure for blogslog
-- ----------------------------
DROP TABLE IF EXISTS `blogslog`;
CREATE TABLE `blogslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `log` text,
  `logType` varchar(255) DEFAULT NULL,
  `log_title` varchar(255) DEFAULT NULL,
  `praise` int(11) DEFAULT NULL,
  `transshipment` varchar(255) DEFAULT NULL,
  `transshipment_num` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogslog
-- ----------------------------

-- ----------------------------
-- Table structure for blogsmessage
-- ----------------------------
DROP TABLE IF EXISTS `blogsmessage`;
CREATE TABLE `blogsmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `message` text NOT NULL,
  `message_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogsmessage
-- ----------------------------

-- ----------------------------
-- Table structure for blogsmood
-- ----------------------------
DROP TABLE IF EXISTS `blogsmood`;
CREATE TABLE `blogsmood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `mood` text NOT NULL,
  `praise` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogsmood
-- ----------------------------

-- ----------------------------
-- Table structure for blogsphoto
-- ----------------------------
DROP TABLE IF EXISTS `blogsphoto`;
CREATE TABLE `blogsphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `group_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `photoInfo` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogsphoto
-- ----------------------------

-- ----------------------------
-- Table structure for blogsphotogroup
-- ----------------------------
DROP TABLE IF EXISTS `blogsphotogroup`;
CREATE TABLE `blogsphotogroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) DEFAULT NULL,
  `photoGroup` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogsphotogroup
-- ----------------------------

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `charm` int(11) NOT NULL,
  `imgpath` varchar(255) NOT NULL,
  `showmain` int(11) NOT NULL,
  `sellsum` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('11', '灏嗗啗鍑哄緛绀煎寘', '1', '灏嗗啗鍑哄緛绀煎寘', '345', '45', 'images/shop/flower/flower2.jpg', '1', '0000000001');
INSERT INTO `commodity` VALUES ('16', '浠欒惤鍑″皹鐗逛緵榧犳爣', '1', '浠欒惤鍑″皹鐗逛緵榧犳爣', '214354', '345', 'images/shop/flower/flower7.jpg', '1', '0000000000');
INSERT INTO `commodity` VALUES ('18', '灏嗗啗鍑哄緛绀煎寘', '1', '灏嗗啗鍑哄緛绀煎寘', '435435', '564', 'images/shop/flower/flower9.jpg', '1', '0000000000');
INSERT INTO `commodity` VALUES ('20', '姒滅溂绀煎寘', '0', '姒滅溂绀煎寘', '4321', '0', 'images/shop/face/face11.jpg', '1', '0000000000');
INSERT INTO `commodity` VALUES ('23', '鍥界編5鍏冧唬閲戝埜', '0', '鍥界編5鍏冧唬閲戝埜', '4321', '0', 'images/shop/face/face14.jpg', '1', '0000000000');
INSERT INTO `commodity` VALUES ('26', '浠欑洘鑷冲皧绀煎寘', '0', '浠欑洘鑷冲皧绀煎寘', '4321', '0', 'images/shop/face/face17.jpg', '1', '0000000000');
INSERT INTO `commodity` VALUES ('28', '360姘存澂', '0', '360姘存澂', '4321', '0', 'images/shop/face/face19.jpg', '1', '0000000000');
INSERT INTO `commodity` VALUES ('34', 'CKtest', '0', 'test', '12', '23', 'images/shop/face/shop20130118203006.jpg', '0', '0000000000');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buytime` varchar(225) NOT NULL,
  `pricesum` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `shopname` varchar(225) NOT NULL,
  `shopnum` int(11) NOT NULL,
  `shopprice` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------

-- ----------------------------
-- Table structure for invitecode
-- ----------------------------
DROP TABLE IF EXISTS `invitecode`;
CREATE TABLE `invitecode` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invitecode` varchar(15) NOT NULL,
  `effective` int(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invitecode
-- ----------------------------
INSERT INTO `invitecode` VALUES ('1', '2012213591', '2');
INSERT INTO `invitecode` VALUES ('2', '2012213582', '3');
INSERT INTO `invitecode` VALUES ('3', '2012213594', '0');
INSERT INTO `invitecode` VALUES ('4', '2012213583', '2');
INSERT INTO `invitecode` VALUES ('5', '2012213595', '3');

-- ----------------------------
-- Table structure for topiccomment
-- ----------------------------
DROP TABLE IF EXISTS `topiccomment`;
CREATE TABLE `topiccomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answertime` datetime DEFAULT NULL,
  `bad` int(11) NOT NULL,
  `commentContent` longtext,
  `contentid` int(11) NOT NULL,
  `contentrank` int(11) NOT NULL,
  `praise` int(11) NOT NULL,
  `topictitleid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8D99AA50B0F2DD0E` (`user_id`),
  KEY `FK8D99AA508C6AD6D7` (`topictitleid`),
  KEY `FK2095BE507E0DF216` (`user_id`),
  KEY `FK2095BE509B9BA6CF` (`topictitleid`),
  KEY `FK2095BE5094D75690` (`user_id`),
  KEY `FK2095BE50CF3FFE95` (`topictitleid`),
  KEY `FK8D99AA506C74CF86` (`user_id`),
  KEY `FK8D99AA509B15AF5F` (`topictitleid`),
  CONSTRAINT `FK2095BE507E0DF216` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK2095BE5094D75690` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK2095BE509B9BA6CF` FOREIGN KEY (`topictitleid`) REFERENCES `topictitle` (`id`),
  CONSTRAINT `FK2095BE50CF3FFE95` FOREIGN KEY (`topictitleid`) REFERENCES `topictitle` (`id`),
  CONSTRAINT `FK8D99AA506C74CF86` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK8D99AA508C6AD6D7` FOREIGN KEY (`topictitleid`) REFERENCES `topictitle` (`id`),
  CONSTRAINT `FK8D99AA509B15AF5F` FOREIGN KEY (`topictitleid`) REFERENCES `topictitle` (`id`),
  CONSTRAINT `FK8D99AA50B0F2DD0E` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topiccomment
-- ----------------------------
INSERT INTO `topiccomment` VALUES ('11', '2016-04-15 21:47:55', '4', '哈哈哈哈哈哈，论坛终于开张了，我就是元老级的用户，哈哈哈，我默默得看你们装逼~！！！', '0', '0', '8', '4', '5');
INSERT INTO `topiccomment` VALUES ('12', '2016-04-17 10:52:40', '1', '<p>\r\n	<span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">1、友好发帖<img src=\"http://localhost:8080/moaoBBS/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">2、无反动言论<img src=\"http://localhost:8080/moaoBBS/js/kindeditor/plugins/emoticons/images/9.gif\" border=\"0\" alt=\"\" /></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">3、不得进行人身攻击<img src=\"http://localhost:8080/moaoBBS/js/kindeditor/plugins/emoticons/images/18.gif\" border=\"0\" alt=\"\" /></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:24px;\">4、不得无礼取闹<img src=\"http://localhost:8080/moaoBBS/js/kindeditor/plugins/emoticons/images/36.gif\" border=\"0\" alt=\"\" /></span>\r\n</p>', '0', '0', '1', '5', '5');
INSERT INTO `topiccomment` VALUES ('13', '2016-04-21 14:09:08', '1', '作为祖国的接班人，未来的花朵，坚决拥护楼主的领导！<br />', '0', '0', '1', '5', '4');
INSERT INTO `topiccomment` VALUES ('14', '2016-04-22 10:39:22', '0', '　【<a href=\"http://www.cnmo.com/\" class=\"key_word\">手机</a>中国 新闻】<a href=\"http://product.cnmo.com/pro_sub_manu/sub_57_manu_1434_1.shtml\" class=\"key_word\">魅族</a>即将于4月25日举办这个月最后一场演唱会，为魅友们带来魅蓝家族新成员——魅蓝3，该机和已经发布的<a href=\"http://product.cnmo.com/cell_phone/index1622306.shtml\" class=\"key_word\">魅蓝 note</a>3以及魅族PRO 6一样，在发布前已经在网络上多次曝光，话说魅族这保密工作有待加强啊。\r\n<p>\r\n	<strong>塑料也能做高端</strong>\r\n</p>\r\n<p>\r\n　魅族本次发放的魅蓝3邀请函非常豪放，除了博朗闹钟之外，还有lamy宝珠笔、巴慕达GreenFan电风扇以及GameBoy游戏机，这些产品的共同\r\n特点就是虽然采用塑料材质，但是却都是各行业的高端货。黄章同样表示：“巴慕达证明塑料真的可以做高端产品。有人抄袭巴慕达的产品，我更愿意研读巴慕达的\r\n设计哲学。”\r\n</p>\r\n<a href=\"http://product.cnmo.com/article/1331508.html\" class=\"bpic\"><img title=\"王尼玛会登台嘛？ 魅蓝3发布会亮点抢先看第1张图\" id=\"img_first\" alt=\"王尼玛会登台嘛？ 魅蓝3发布会亮点抢先看第1张图\" src=\"http://img.cnmo-img.com.cn/1332_500x1000/1331508.jpg\" align=\"1\" /></a>', '0', '0', '0', '6', '13');
INSERT INTO `topiccomment` VALUES ('15', '2016-04-22 11:30:37', '0', '一楼占楼，够不够十五个字哈哈哈哈<br />', '0', '0', '2', '4', '13');
INSERT INTO `topiccomment` VALUES ('16', '2016-04-22 20:16:52', '1', '我就试试能不能用头顶的回复按钮', '0', '0', '1', '4', '5');
INSERT INTO `topiccomment` VALUES ('17', '2016-04-22 20:20:31', '1', '我就测试下新的“说两句”按钮！！！', '0', '0', '2', '4', '5');

-- ----------------------------
-- Table structure for topictitle
-- ----------------------------
DROP TABLE IF EXISTS `topictitle`;
CREATE TABLE `topictitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answerNum` int(11) NOT NULL,
  `chickNum` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `releaseTime` datetime DEFAULT NULL,
  `topic` varchar(80) NOT NULL,
  `topicRank` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK44782689B0F2DD0E` (`user_id`),
  KEY `FKCF693A897E0DF216` (`user_id`),
  KEY `FKCF693A8994D75690` (`user_id`),
  KEY `FK447826896C74CF86` (`user_id`),
  CONSTRAINT `FK447826896C74CF86` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK44782689B0F2DD0E` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKCF693A897E0DF216` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKCF693A8994D75690` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topictitle
-- ----------------------------
INSERT INTO `topictitle` VALUES ('4', '4', '1', '0', '2016-04-15 21:47:56', '我是萌新，求罩！！！！', '10', '5');
INSERT INTO `topictitle` VALUES ('5', '2', '1', '0', '2016-04-17 10:52:40', '民人论坛发帖规则', '10', '5');
INSERT INTO `topictitle` VALUES ('6', '1', '1', '0', '2016-04-22 10:39:22', '【转载】王尼玛会登台嘛？ 魅蓝3发布会亮点抢先看', '10', '13');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attention` int(11) DEFAULT NULL,
  `autograph` varchar(100) DEFAULT NULL,
  `birthday` varchar(19) DEFAULT NULL,
  `charm` int(11) DEFAULT NULL,
  `contribute` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `headpic` varchar(128) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `mailbox` varchar(40) NOT NULL,
  `nickname` varchar(10) NOT NULL,
  `onlinetime` int(11) DEFAULT NULL,
  `password` varchar(12) NOT NULL,
  `power` int(11) DEFAULT NULL,
  `registertime` timestamp(4) NULL DEFAULT NULL,
  `sex` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailbox` (`mailbox`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '0', null, null, '1', '0', '1', null, '0', '111', '1111', null, '111', '1', '2016-04-11 10:37:16.0000', '1');
INSERT INTO `user` VALUES ('2', '0', null, null, '1', '0', '2', '', '0', '222', '2222', null, '222', '1', '2016-04-10 10:37:24.0000', '1');
INSERT INTO `user` VALUES ('3', '0', null, null, '1', '0', '1', null, '0', '333', '3333', null, '333', '1', '2016-04-12 10:37:30.0000', '0');
INSERT INTO `user` VALUES ('4', '0', null, null, '1', '13', '2', null, '1', '992983141@qq.com', '创造者', null, '111111111', '1', '2016-04-12 11:12:11.9610', '1');
INSERT INTO `user` VALUES ('5', '0', null, null, '1', '29', '1', null, '3', '1111@qq.com', 'creater', null, '111111111', '1', '2016-04-12 11:32:34.6620', '0');
INSERT INTO `user` VALUES ('6', '0', null, null, '1', '0', '2', null, '0', '929456610@qq.com', '耶稣三世', null, '111111111', '1', '2016-04-12 11:36:41.2010', '0');
INSERT INTO `user` VALUES ('7', '0', null, null, '1', '0', '1', null, '0', '1111@11.com', '西天如来', null, '111111111', '1', '2016-04-12 18:12:54.1580', '1');
INSERT INTO `user` VALUES ('8', '0', null, null, '1', '0', '2', null, '0', '00000@00.com', '张三', null, '111111111', '0', '2016-04-12 18:41:59.5870', '1');
INSERT INTO `user` VALUES ('9', '0', null, null, '1', '0', '1', null, '0', '000@00.com', 'update张三', null, '111111111', '0', '2016-04-12 18:57:37.2240', '1');
INSERT INTO `user` VALUES ('10', '0', null, null, '1', '0', '1', null, '0', '000000@00.com', 'creater', null, '1111111111', '0', '2016-04-12 19:02:53.4860', '1');
INSERT INTO `user` VALUES ('11', '0', null, null, '1', '0', '1', null, '0', '222@22.com', 'creater', null, '111111111', '0', '2016-04-13 22:04:07.6710', '1');
INSERT INTO `user` VALUES ('12', '0', null, null, '1', '0', '0', null, '0', '2222@22.com', '2师兄', '1', '111111111', '0', '2016-04-15 21:18:59.5370', '1');
INSERT INTO `user` VALUES ('13', '0', null, null, '1', '7', '0', null, '1', 'aaa@aa.com', '测试机器人_女', '1', '111111111', '1', '2016-04-22 10:31:24.6400', '0');
INSERT INTO `user` VALUES ('14', '0', null, null, '1', '0', '0', null, '0', '5555@55.com', '55555', '1', '111111111', '0', '2016-05-01 21:38:45.1410', '0');
INSERT INTO `user` VALUES ('15', '0', null, null, '1', '0', '0', null, '0', '4444@44.com', '4444', '1', '111111111', '0', '2016-05-01 21:53:22.7680', '0');
INSERT INTO `user` VALUES ('16', '0', null, null, '1', '0', '0', null, '0', '6666@66.com', '6666', '1', '111111111', '0', '2016-05-01 21:54:06.2350', '0');
INSERT INTO `user` VALUES ('17', '0', null, null, '1', '0', '0', null, '0', '777@77.com', '777', '1', '111111111', '0', '2016-05-01 21:56:43.0810', '0');

-- ----------------------------
-- Table structure for votecomment
-- ----------------------------
DROP TABLE IF EXISTS `votecomment`;
CREATE TABLE `votecomment` (
  `voteoptionid` int(11) NOT NULL AUTO_INCREMENT,
  `voteid` int(11) NOT NULL,
  `voteoptionname` varchar(40) NOT NULL,
  `voteoptionsum` int(11) NOT NULL,
  PRIMARY KEY (`voteoptionid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of votecomment
-- ----------------------------
INSERT INTO `votecomment` VALUES ('1', '2', '测试成功', '0');
INSERT INTO `votecomment` VALUES ('2', '2', '无bug', '0');
INSERT INTO `votecomment` VALUES ('3', '2', '拜bug', '0');
INSERT INTO `votecomment` VALUES ('4', '2', 'debug', '0');
