DROP DATABASE trip;
CREATE DATABASE trip;
USE trip;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`
(
    `id`   int(11)                              NOT NULL COMMENT '地区id',
    `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '地区名',
    `upId` int(11) DEFAULT NULL COMMENT '上级地区id',
    `type` int(11) DEFAULT NULL COMMENT '1、国内\n2、亚洲\n3、欧洲\n4、非洲\n5、北美洲\n6、大洋洲\n…',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci COMMENT ='地区表';

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` (`id`, `name`, `upId`, `type`)
VALUES (1, '北京市', 0, 1);
INSERT INTO `address` (`id`, `name`, `upId`, `type`)
VALUES (2, '湖南省', 0, 1);
INSERT INTO `address` (`id`, `name`, `upId`, `type`)
VALUES (3, '长沙市', 2, 1);
INSERT INTO `address` (`id`, `name`, `upId`, `type`)
VALUES (4, '马尔代夫', 0, 2);
INSERT INTO `address` (`id`, `name`, `upId`, `type`)
VALUES (5, '张家界', 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for remark
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `content`  text COMMENT '内容',
    `essence`  int(11) DEFAULT '0' COMMENT '是否加精（0为不加精，1为加精）',
    `markId`   int(11) DEFAULT NULL COMMENT '评论打分表外键',
    `status`   int(2)  DEFAULT NULL COMMENT '状态',
    `userid`   int(11) DEFAULT NULL COMMENT '用户id',
    `indentId` int(11) DEFAULT NULL COMMENT '订单id',
    `remId`    int(11) DEFAULT '0' COMMENT '子类id，（回复某评论）',
    PRIMARY KEY (`id`),
    KEY `markId` (`markId`),
    KEY `remark_userId` (`userId`),
    KEY `remark_indentId` (`indentId`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='评论表';

CREATE TABLE `remarkImg`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `path`     varchar(100) DEFAULT NULL COMMENT '图片路径',
    `remarkId` int(11)      DEFAULT NULL COMMENT '评论表外键',
    PRIMARY KEY (`id`),
    KEY `remarkId` (`remarkId`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='评论图片';

-- ----------------------------
-- Table structure for travel
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title`    varchar(20) DEFAULT NULL COMMENT '标题',
    `content`  text COMMENT '内容',
    `time`     date        DEFAULT NULL COMMENT '时间',
    `userId`   int(11)     DEFAULT NULL COMMENT '用户表外键',
    `scenicId` int(11)     DEFAULT NULL COMMENT '景点表id',
    `views`    int(11)     DEFAULT '0' COMMENT '浏览次数',
    `coverImg` text COMMENT '封面图片',
    `indentId` int(11)     DEFAULT NULL COMMENT '订单id',
    PRIMARY KEY (`id`),
    KEY `userId` (`userId`),
    KEY `indentId` (`indentId`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='游记表';

DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic`
(
    `id`            int                                                     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `scenicName`    varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NULL DEFAULT NULL COMMENT '景点名称',
    `address`       varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '景点地址',
    `province`      varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NULL DEFAULT NULL COMMENT '省',
    `city`          varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NULL DEFAULT NULL COMMENT '城市',
    `hintId`        int                                                     NULL DEFAULT NULL COMMENT '温馨提示表外键',
    `titleId`       int                                                     NULL DEFAULT NULL COMMENT '主题类型表外键',
    `introduce`     longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci     NULL COMMENT '景点描述',
    `floor_price`   int                                                     NULL DEFAULT 0 COMMENT '底价',
    `headline`      varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '景点标题',
    `coverImage`    varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '封面图片路径',
    `attractionsId` int                                                     NULL DEFAULT NULL COMMENT '景点分类id',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `hintId` (`hintId` ASC) USING BTREE,
    INDEX `titleId` (`titleId` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci COMMENT = '景点表'
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`
(
    `id`           int                                                    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`         varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '酒店名称',
    `address`      varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '地址',
    `iphone`       varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '酒店号码',
    `introduce`    text CHARACTER SET utf8 COLLATE utf8_unicode_ci        NULL COMMENT '酒店介绍',
    `hotelImageId` int                                                    NULL DEFAULT NULL COMMENT '酒店图片表外键',
    `roomId`       int                                                    NULL DEFAULT NULL COMMENT '酒店房间表外键',
    `floorPrice`   int                                                    NULL DEFAULT 0 COMMENT '底价',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `hotelImageId` (`hotelImageId` ASC) USING BTREE,
    INDEX `roomId` (`roomId` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci COMMENT = '酒店表'
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`
(
    `id`    int                                                    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '房间类型',
    `price` double                                                 NULL DEFAULT NULL COMMENT '价格',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci COMMENT = '房间类型表'
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `scenicWay`;
CREATE TABLE `scenicWay`
(
    `id`               int                                                     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `way`              varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '路线名称',
    `scenicDay`        int                                                     NULL DEFAULT NULL COMMENT '旅游天数',
    `description`      varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '路线描述',
    `endPath`          varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NULL DEFAULT NULL COMMENT '终点',
    `startPath`        varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NULL DEFAULT NULL COMMENT '起点',
    `status`           int                                                     NULL DEFAULT 0 COMMENT '线路状态',
    `floorPrice`       double                                                  NULL DEFAULT NULL COMMENT '底价',
    `titleId`          int                                                     NULL DEFAULT NULL COMMENT '主题表外键',
    `mealId`           int                                                     NULL DEFAULT NULL COMMENT '套餐表外键',
    `attractionsId`    int                                                     NULL DEFAULT NULL COMMENT '分类id',
    `scenicWayImage`   varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '路线封面图片',
    `minimumGroupSize` int                                                     NULL DEFAULT NULL COMMENT '最少成团人数',
    `introduce`        longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci     NULL COMMENT '路线介绍',
    `scenicId`         int                                                     NULL DEFAULT NULL COMMENT '景点表id',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `mealId` (`mealId` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci COMMENT = '线路表'
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `way`         varchar(200) DEFAULT NULL COMMENT '活动方式',
    `startTime`   date         DEFAULT NULL COMMENT '开始时间',
    `endTime`     date         DEFAULT NULL COMMENT '结束时间',
    `state`       int(11)      DEFAULT NULL COMMENT '状态0删除 1正常',
    `img`         varchar(200) DEFAULT NULL COMMENT '活动图',
    `scenicWayId` int          DEFAULT NULL COMMENT '旅游路线id',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT = '活动表(轮播图)';

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`       int                                                          NOT NULL AUTO_INCREMENT COMMENT '主键编号',
    `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
    `userPass` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
    `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
    `iphone`   varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci COMMENT = '用户信息表'
  ROW_FORMAT = Dynamic;