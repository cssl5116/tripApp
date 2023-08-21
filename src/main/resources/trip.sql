/*
 Navicat Premium Data Transfer

 Source Server         : sjxt
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : trip

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 21/08/2023 11:54:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `way` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动方式',
  `startTime` date NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` date NULL DEFAULT NULL COMMENT '结束时间',
  `state` int NULL DEFAULT NULL COMMENT '状态0删除 1正常',
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '活动图',
  `scenicWayId` int NULL DEFAULT NULL COMMENT '旅游路线id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '活动表(轮播图)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, '暑期特惠', '2023-07-01', '2023-08-31', 1, 'summer_discount.jpg', 1);
INSERT INTO `activity` VALUES (2, '冬季狂欢', '2023-12-01', '2024-01-15', 1, 'winter_carnival.jpg', 2);
INSERT INTO `activity` VALUES (3, '春节特惠', '2024-01-20', '2024-02-10', 1, 'spring_festival_discount.jpg', 3);

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '地区名',
  `upId` int NULL DEFAULT NULL COMMENT '上级地区id',
  `type` int NULL DEFAULT NULL COMMENT '1、国内\n2、亚洲\n3、欧洲\n4、非洲\n5、北美洲\n6、大洋洲\n 7、东南亚',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '北京市', 0, 1);
INSERT INTO `address` VALUES (2, '湖南省', 0, 1);
INSERT INTO `address` VALUES (3, '长沙市', 2, 1);
INSERT INTO `address` VALUES (4, '马尔代夫', 0, 2);
INSERT INTO `address` VALUES (5, '张家界', 2, 1);
INSERT INTO `address` VALUES (6, '上海市', 0, 1);
INSERT INTO `address` VALUES (7, '泰国', 0, 7);
INSERT INTO `address` VALUES (8, '柬埔寨', 0, 7);
INSERT INTO `address` VALUES (9, '缅甸', 0, 7);
INSERT INTO `address` VALUES (10, '日本', 0, 2);
INSERT INTO `address` VALUES (11, '韩国', 0, 2);
INSERT INTO `address` VALUES (12, '越南', 0, 7);
INSERT INTO `address` VALUES (13, '安徽省', 0, 1);
INSERT INTO `address` VALUES (14, '张家界市', 2, 1);
INSERT INTO `address` VALUES (15, '四川省', 0, 1);
INSERT INTO `address` VALUES (16, '阿坝藏族羌族自治州', 15, 1);
INSERT INTO `address` VALUES (17, '浙江省', 0, 1);
INSERT INTO `address` VALUES (18, '杭州市', 17, 1);

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '酒店名称',
  `address` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `iphone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '酒店号码',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT '酒店介绍',
  `hotelImageId` int NULL DEFAULT NULL COMMENT '酒店图片表外键',
  `roomId` int NULL DEFAULT NULL COMMENT '酒店房间表外键',
  `floorPrice` int NULL DEFAULT 0 COMMENT '底价',
  `addressId` int NULL DEFAULT NULL COMMENT '地址表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hotelImageId`(`hotelImageId` ASC) USING BTREE,
  INDEX `roomId`(`roomId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '酒店表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '北京大酒店', '北京市朝阳区建国路1号', '12345678', '北京大酒店位于市中心，提供高品质的服务和豪华的住宿体验。', 1, 1, 200, 1);
INSERT INTO `hotel` VALUES (2, '上海豪华酒店', '上海市浦东新区陆家嘴环路1号', '23456789', '上海豪华酒店拥有现代化的设施和宽敞舒适的客房，为宾客提供独特的入住体验。', 2, 2, 300, 6);
INSERT INTO `hotel` VALUES (3, '广州城市酒店', '广州市天河区中山大道1号', '34567890', '广州城市酒店位于繁华地段，周边交通便利，设有各类房间供客人选择。', 3, 3, 250, 17);
INSERT INTO `hotel` VALUES (4, '成都高级酒店', '四川省成都市锦江区红星路1号', '45678901', '成都高级酒店提供温馨舒适的住宿环境，设有餐厅、健身房等便利设施。', 4, 4, 180, 15);
INSERT INTO `hotel` VALUES (5, '纽约皇宫酒店', '美国纽约市麦迪逊大道455号', '7890', '纽约皇宫酒店是位于曼哈顿中心的豪华酒店，提供豪华住宿和一流的服务。', 5, 5, 500, 7);
INSERT INTO `hotel` VALUES (6, '巴黎里维埃拉酒店', '法国巴黎香榭丽舍大道25号', '456789', '巴黎里维埃拉酒店是一家时尚精品酒店，位于著名的香榭丽舍大道，提供优雅的客房和迷人的氛围。', 6, 6, 400, 8);
INSERT INTO `hotel` VALUES (7, '伦敦大酒店', '英国伦敦唐宁街10号', '12345678', '伦敦大酒店是一家著名的酒店，靠近标志性的唐宁街，提供豪华住宿和无可挑剔的服务。', 7, 7, 550, 11);
INSERT INTO `hotel` VALUES (8, '东京天空度假村', '日本东京市墨田区押上1丁目1-2号', '12345678', '东京天空度假村是一家现代化的度假酒店，享有城市天际线的壮丽景色，提供舒适的客房和出色的设施。', 8, 8, 600, 10);

-- ----------------------------
-- Table structure for remark
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容',
  `essence` int NULL DEFAULT 0 COMMENT '是否加精（0为不加精，1为加精）',
  `markId` int NULL DEFAULT NULL COMMENT '评论打分表外键',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `userid` int NULL DEFAULT NULL COMMENT '用户id',
  `indentId` int NULL DEFAULT NULL COMMENT '订单id',
  `remId` int NULL DEFAULT 0 COMMENT '子类id，（回复某评论）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `markId`(`markId` ASC) USING BTREE,
  INDEX `remark_userId`(`userid` ASC) USING BTREE,
  INDEX `remark_indentId`(`indentId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remark
-- ----------------------------

-- ----------------------------
-- Table structure for remarkimg
-- ----------------------------
DROP TABLE IF EXISTS `remarkimg`;
CREATE TABLE `remarkimg`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `remarkId` int NULL DEFAULT NULL COMMENT '评论表外键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `remarkId`(`remarkId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评论图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remarkimg
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '房间类型',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '房间类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '标准单人间', 100);
INSERT INTO `room` VALUES (2, '标准双人间', 150);
INSERT INTO `room` VALUES (3, '豪华单人间', 200);
INSERT INTO `room` VALUES (4, '豪华双人间', 250);
INSERT INTO `room` VALUES (5, '套房', 350);

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `scenicName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '景点名称',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '景点地址',
  `province` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `hintId` int NULL DEFAULT NULL COMMENT '温馨提示表外键',
  `titleId` int NULL DEFAULT NULL COMMENT '主题类型表外键',
  `introduce` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT '景点描述',
  `floor_price` int NULL DEFAULT 0 COMMENT '底价',
  `headline` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '景点标题',
  `coverImage` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '封面图片路径',
  `addressId` int NULL DEFAULT NULL COMMENT '地址表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hintId`(`hintId` ASC) USING BTREE,
  INDEX `titleId`(`titleId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '景点表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES (1, '上海科技馆', '上海市浦东新区世纪大道2000号', '', '上海市', NULL, NULL, '感受科技的力量', 100, '上海科技馆', NULL, 6);
INSERT INTO `scenic` VALUES (2, '黄山', '安徽省黄山市', '安徽', '黄山市', 1, 1, '黄山是中国著名的风景名胜区，以奇松、怪石、云海、温泉等自然景观著名。', 200, '黄山风景区', 'huangshan.jpg', 13);
INSERT INTO `scenic` VALUES (3, '张家界', '湖南省张家界市', '湖南', '张家界市', 2, 2, '张家界以奇峰异石、溶洞幽谷、森林覆盖而闻名，被誉为“神秘的山水画廊、地球的原始森林”。', 300, '张家界国家森林公园', 'zhangjiajie.jpg', 2);
INSERT INTO `scenic` VALUES (4, '九寨沟', '四川省阿坝藏族羌族自治州', '四川', '阿坝藏族羌族自治州', 3, 3, '九寨沟以其原始、神秘、浪漫和独特的自然风光而闻名，是世界自然遗产和国家级自然保护区。', 400, '九寨沟风景名胜区', 'jiuzhaigou.jpg', 15);
INSERT INTO `scenic` VALUES (5, '故宫', '北京市东城区景山前街4号', '北京', '北京市', 4, 4, '故宫是中国明清两代的皇宫，也是世界上规模最大、保存最完整的木质结构古建筑之一。', 120, '故宫博物院', 'gugong.jpg', 6);
INSERT INTO `scenic` VALUES (6, '西湖', '浙江省杭州市西湖区', '浙江', '杭州市', 5, 5, '西湖是中国最具诗意和浪漫的湖泊之一，以其美丽的自然风景和悠久的历史文化而闻名。', 150, '西湖风景名胜区', 'xihu.jpg', 18);
INSERT INTO `scenic` VALUES (7, '普吉岛', '泰国', '泰国', '普吉岛', 6, 6, '普吉岛是泰国最大的岛，最小的府。普吉岛以其迷人的热带风光和丰富的旅游资源被称为\"安达曼海上的一颗明珠。', 180, '泰国', 'pujidao.jpg', 7);
INSERT INTO `scenic` VALUES (8, '吴哥窟', '柬埔寨', '柬埔寨', '柬埔寨', 7, 7, '吴哥窟(意思是“城市寺”)是柬埔寨最宏伟、最大型的吴哥窟寺庙和旅游景点，建于12世纪上半叶的苏耶跋摩二世，神庙的平衡，构图和美丽使它成为世界上最好的纪念碑之一，一个巨大的长方形水库围绕着吴哥窟', 100, '柬埔寨', 'jianpuzhai.jpg', 8);
INSERT INTO `scenic` VALUES (9, '仰光大金塔', '缅甸', '缅甸', '缅甸', NULL, NULL, '仰光大金塔位于圣丁固达拉山上，是仰光的最高处，也是缅甸佛教信仰的中心。尖锥形的主塔近百米高，塔身被金箔包裹，周围悬挂着上千个金银铃，塔冠上镶嵌着数不清的宝石，塔尖还有一颗76克拉的巨钻', 200, '缅甸', 'ygdjt.jpg', 9);
INSERT INTO `scenic` VALUES (10, '下龙湾', '越南', '越南', '越南', NULL, NULL, '下龙湾的喀斯特石灰岩山峰和隐蔽的波光粼粼的海洋令人惊叹地结合在一起，是越南最受欢迎的旅游景点之一，但是拥有2000多个不同的岛屿，周围有许多绝妙的风景', 300, '越南', 'yuenan.jpg', 12);

-- ----------------------------
-- Table structure for scenicway
-- ----------------------------
DROP TABLE IF EXISTS `scenicway`;
CREATE TABLE `scenicway`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `way` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '路线名称',
  `scenicDay` int NULL DEFAULT NULL COMMENT '旅游天数',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '路线描述',
  `endPath` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '终点',
  `startPath` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '起点',
  `status` int NULL DEFAULT 0 COMMENT '线路状态',
  `floorPrice` double NULL DEFAULT NULL COMMENT '底价',
  `titleId` int NULL DEFAULT NULL COMMENT '主题表外键',
  `mealId` int NULL DEFAULT NULL COMMENT '套餐表外键',
  `attractionsId` int NULL DEFAULT NULL COMMENT '分类id',
  `scenicWayImage` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '路线封面图片',
  `minimumGroupSize` int NULL DEFAULT NULL COMMENT '最少成团人数',
  `introduce` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL COMMENT '路线介绍',
  `scenicId` int NULL DEFAULT NULL COMMENT '景点表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mealId`(`mealId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '线路表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scenicway
-- ----------------------------
INSERT INTO `scenicway` VALUES (1, '北京一日游', 1, '北京市区一日游线路，游览故宫、天安门、颐和园等著名景点。', '北京', '北京', 0, 200, 1, 1, 1, 'beijing.jpg', 2, '北京一日游线路是畅游北京市区的最佳选择，您将有机会参观故宫、天安门广场、颐和园等著名景点。', 1);
INSERT INTO `scenicway` VALUES (2, '巴黎浪漫之旅', 3, '巴黎浪漫之旅线路，游览埃菲尔铁塔、卢浮宫、巴黎圣母院等著名景点。', '巴黎', '巴黎', 0, 500, 2, 2, 2, 'paris.jpg', 4, '巴黎浪漫之旅线路带您领略浪漫的巴黎风情，您将游览埃菲尔铁塔、卢浮宫、巴黎圣母院等著名景点。', 2);
INSERT INTO `scenicway` VALUES (3, '东京文化之旅', 5, '东京文化之旅线路，体验传统日本文化，游览淺草寺、东京塔、上野公园等著名景点。', '东京', '东京', 0, 800, 3, 3, 3, 'tokyo.jpg', 6, '东京文化之旅线路带您领略日本的传统文化，您将游览淺草寺、东京塔、上野公园等著名景点。', 3);
INSERT INTO `scenicway` VALUES (4, '纽约自由之旅', 4, '纽约自由之旅线路，探索自由女神像、时代广场、中央公园等纽约标志性景点。', '纽约', '纽约', 0, 600, 4, 4, 4, 'new_york.jpg', 3, '纽约自由之旅线路带您畅游纽约的精华景点，您将探索自由女神像、时代广场、中央公园等纽约标志性景点。', 4);
INSERT INTO `scenicway` VALUES (5, '伦敦历史遗迹之旅', 3, '伦敦历史遗迹之旅线路，游览大本钟、伦敦塔、温莎城堡等著名历史遗迹。', '伦敦', '伦敦', 0, 550, 5, 5, 5, 'london.jpg', 4, '伦敦历史遗迹之旅线路带您穿越伦敦的悠久历史，您将游览大本钟、伦敦塔、温莎城堡等著名历史遗迹。', 5);
INSERT INTO `scenicway` VALUES (6, '悉尼海滨度假之旅', 7, '悉尼海滨度假之旅线路，尽情享受悉尼海滩、悉尼歌剧院、海港大桥等美丽景点。', '悉尼', '悉尼', 0, 900, 6, 6, 6, 'sydney.jpg', 6, '悉尼海滨度假之旅线路带您畅玩悉尼的海滩风情，您将尽情享受悉尼海滩、悉尼歌剧院、海港大桥等美丽景点。', 6);

-- ----------------------------
-- Table structure for travel
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容',
  `time` date NULL DEFAULT NULL COMMENT '时间',
  `userId` int NULL DEFAULT NULL COMMENT '用户表外键',
  `scenicId` int NULL DEFAULT NULL COMMENT '景点表id',
  `views` int NULL DEFAULT 0 COMMENT '浏览次数',
  `coverImg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '封面图片',
  `indentId` int NULL DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `indentId`(`indentId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '游记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travel
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `userPass` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `realName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `iphone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
