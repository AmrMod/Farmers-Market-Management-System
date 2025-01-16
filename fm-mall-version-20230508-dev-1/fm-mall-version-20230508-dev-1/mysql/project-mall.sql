/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 80032
Source Host           : localhost:3306
Source Database       : project-mall

Target Server Type    : MYSQL
Target Server Version : 80032
File Encoding         : 65001

Date: 2023-05-07 20:13:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `productID` varchar(50) DEFAULT NULL COMMENT '商品id，取自goods表的id值',
  `ownerID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据所有者id，取自user表的id值',
  `count` int DEFAULT NULL COMMENT '数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `tradeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '商品名',
  `tradePictrue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品图片',
  `tradePrice` decimal(10,0) DEFAULT NULL COMMENT '商品价格',
  `tradeCreateTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '商品创建日期',
  `createorName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者名字',
  `creatorID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品id',
  `tradeSold` decimal(10,0) unsigned zerofill DEFAULT NULL COMMENT '已售数量',
  `tradeStock` decimal(10,0) DEFAULT NULL COMMENT '库存数量',
  `description` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  `statu` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL COMMENT '图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for goods_wish
-- ----------------------------
DROP TABLE IF EXISTS `goods_wish`;
CREATE TABLE `goods_wish` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品id，多个用户同时收藏会有重复',
  `ownerID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收藏者id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `ordergoods`;
CREATE TABLE `ordergoods` (
  `count` int DEFAULT NULL COMMENT '购入数量',
  `productID` varchar(50) DEFAULT NULL COMMENT '商品id',
  `tradeName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `tradePrice` varchar(50) DEFAULT NULL COMMENT '购入价格',
  `orderID` varchar(50) DEFAULT NULL COMMENT '所属订单id',
  `creatorID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品创建者id',
  `soldTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '售出时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单生成时将订单内全部商品进行保存，防止商品属性（价格等）发生变化';

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `orderID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单id',
  `createTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成时间',
  `farmerID` varchar(50) DEFAULT NULL COMMENT '商家id',
  `customerID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单所有者id',
  `orderStatu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单状态：进行中、已完成',
  `amount` varchar(50) DEFAULT NULL COMMENT '订单总金额',
  `customerName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '顾客姓名',
  `products` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单商品概览'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for registing
-- ----------------------------
DROP TABLE IF EXISTS `registing`;
CREATE TABLE `registing` (
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱地址',
  `code` varchar(6) DEFAULT NULL COMMENT '验证码',
  `begin` varchar(50) DEFAULT NULL COMMENT '验证码生效时间',
  `end` varchar(50) DEFAULT NULL COMMENT '验证码失效时间',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `label` varchar(20) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  `routes` varchar(255) DEFAULT NULL COMMENT '具备访问权的路由'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '账户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `registDate` varchar(50) DEFAULT NULL COMMENT '注册日期',
  `lastLoginDate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上次登录时间',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色',
  `loginErrorTimes` int DEFAULT NULL COMMENT '登录错误次数',
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `email_validate` varchar(10) DEFAULT NULL COMMENT '邮箱是否校验',
  `disabled` varchar(10) DEFAULT NULL COMMENT '账号禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
