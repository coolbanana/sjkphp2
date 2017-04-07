/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : search
Target Host     : localhost:3306
Target Database : search
Date: 2017-04-07 23:35:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for check
-- ----------------------------
DROP TABLE IF EXISTS `check`;
CREATE TABLE `check` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) NOT NULL,
  `a_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check
-- ----------------------------
INSERT INTO `check` VALUES ('111', 'xxx的第一次检查', '0');
INSERT INTO `check` VALUES ('112', 'yy的第二次检查', '0');
INSERT INTO `check` VALUES ('113', 'aa3', '0');
INSERT INTO `check` VALUES ('114', '第四次', '0');
INSERT INTO `check` VALUES ('115', '第四次检查2', '0');
INSERT INTO `check` VALUES ('116', 'aa6', '0');
INSERT INTO `check` VALUES ('117', 'zz检查7', '0');
INSERT INTO `check` VALUES ('118', '第8次检查', '0');
INSERT INTO `check` VALUES ('119', '第9次检查', '0');
INSERT INTO `check` VALUES ('120', 'zz检查10', '0');
INSERT INTO `check` VALUES ('121', 'zz检查11', '0');
INSERT INTO `check` VALUES ('122', 'zz检查12', '0');
INSERT INTO `check` VALUES ('123', 'zz检查13', '0');

-- ----------------------------
-- Table structure for proj
-- ----------------------------
DROP TABLE IF EXISTS `proj`;
CREATE TABLE `proj` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proj
-- ----------------------------

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `class1` int(2) DEFAULT NULL,
  `class2` int(2) DEFAULT NULL,
  `class3` int(2) DEFAULT NULL,
  `class4` int(2) DEFAULT NULL,
  `law` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `temp_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`c_id`) REFERENCES `check` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES ('1111', '111', null, null, null, null, null, 'aaa1', 'bbb', null);
INSERT INTO `result` VALUES ('1112', '111', null, null, null, null, null, 'bbbb', 'bbaa', null);
INSERT INTO `result` VALUES ('1117', '113', null, null, null, null, null, 'asd1231', 'xcv444', null);
INSERT INTO `result` VALUES ('1118', '114', null, null, null, null, null, null, null, null);
INSERT INTO `result` VALUES ('1119', '114', null, null, null, null, null, '124', '阿萨德', null);
INSERT INTO `result` VALUES ('1122', '119', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ua
-- ----------------------------
DROP TABLE IF EXISTS `ua`;
CREATE TABLE `ua` (
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ua
-- ----------------------------

-- ----------------------------
-- Table structure for uc
-- ----------------------------
DROP TABLE IF EXISTS `uc`;
CREATE TABLE `uc` (
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uc
-- ----------------------------

-- ----------------------------
-- Table structure for uploadimg
-- ----------------------------
DROP TABLE IF EXISTS `uploadimg`;
CREATE TABLE `uploadimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_name` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `e_id` (`e_id`),
  CONSTRAINT `e_id` FOREIGN KEY (`e_id`) REFERENCES `result` (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadimg
-- ----------------------------
INSERT INTO `uploadimg` VALUES ('20', '8fd091e3c1f0be1d1e680d8fddefde4e.jpg', '20170219\\8fd091e3c1f0be1d1e680d8fddefde4e.jpg', '1111', '1487506620');
INSERT INTO `uploadimg` VALUES ('21', '4f8ffb4997a9c6a0791d2650c08456bc.png', '20170219\\4f8ffb4997a9c6a0791d2650c08456bc.png', '1112', '1487506667');
INSERT INTO `uploadimg` VALUES ('22', 'ed44c1ad7373283dee96a6ccb040caa1.png', '20170219\\ed44c1ad7373283dee96a6ccb040caa1.png', '1111', '1487507919');
INSERT INTO `uploadimg` VALUES ('23', '9c800b7991ea7b47c157daaf21109b8a.png', '20170219\\9c800b7991ea7b47c157daaf21109b8a.png', '1111', '1487508032');
INSERT INTO `uploadimg` VALUES ('24', '95f64c8eefff06a261048ff5265db118.jpg', '20170219\\95f64c8eefff06a261048ff5265db118.jpg', '1112', '1487508137');
INSERT INTO `uploadimg` VALUES ('25', '0f6bb06c268ed1cd0af5845e11803ebb.jpg', '20170219\\0f6bb06c268ed1cd0af5845e11803ebb.jpg', '1112', '1487508169');
INSERT INTO `uploadimg` VALUES ('26', '4fc5df5d41a1c676477ce26eb6890425.jpg', '20170219\\4fc5df5d41a1c676477ce26eb6890425.jpg', '1112', '1487508467');
INSERT INTO `uploadimg` VALUES ('27', '85e067060ba5aacb06b160c79bcb4052.jpg', '20170219\\85e067060ba5aacb06b160c79bcb4052.jpg', '1112', '1487508533');
INSERT INTO `uploadimg` VALUES ('28', '2725b5d537455f45d804bee933a91b75.jpg', '20170219\\2725b5d537455f45d804bee933a91b75.jpg', '1112', '1487508563');
INSERT INTO `uploadimg` VALUES ('30', '95ef9db86a0978280754e268f647025a.jpg', '20170219\\95ef9db86a0978280754e268f647025a.jpg', '1111', '1487511062');
INSERT INTO `uploadimg` VALUES ('34', '5f545ab71412b72913921f75a371637f.jpg', '20170219\\5f545ab71412b72913921f75a371637f.jpg', '1111', '1487511249');
INSERT INTO `uploadimg` VALUES ('36', 'f706851cbcef616c2fbdb273811d7477.jpg', '20170219\\f706851cbcef616c2fbdb273811d7477.jpg', '1117', '1487512489');
INSERT INTO `uploadimg` VALUES ('37', 'fc538f868ed5da5c9868d71718466b0e.jpg', '20170220\\fc538f868ed5da5c9868d71718466b0e.jpg', '1119', '1487522417');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `permission` int(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('88', 'admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', '1');
