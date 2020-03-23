/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.100.34（本地程序运行测试）
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 172.16.100.34:3306
 Source Schema         : mall-gxl

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 23/03/2020 11:29:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增编号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `sid` bigint(20) NULL DEFAULT NULL COMMENT '卖家编号',
  `oid` bigint(32) NULL DEFAULT NULL COMMENT '订单编号',
  `post_fee` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '邮费',
  `total` decimal(20, 2) NULL DEFAULT NULL COMMENT '总价',
  `order_state` tinyint(1) NULL DEFAULT 0 COMMENT '订单状态，0->待支付，1->支付中，2->已付款待发货，3->已发货待收货，4->已收货，5->申请退款待退款，6->已退款，7->交易关闭',
  `create_time` bigint(12) NULL DEFAULT NULL COMMENT '下单时间',
  `update_time` bigint(12) NULL DEFAULT NULL COMMENT '支付或取消时间',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除，0->否，1->是',
  `return_index` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款订单索引，空为全部',
  `return_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款理由',
  `return_time` bigint(12) NULL DEFAULT NULL COMMENT '退款时间',
  `return_update_time` bigint(12) NULL DEFAULT NULL COMMENT '退款完成或取消时间',
  `v_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `return_state` tinyint(1) NULL DEFAULT NULL COMMENT '退款前状态',
  `uname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收人手机号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提货地址',
  `delivery_time` bigint(12) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` bigint(12) NULL DEFAULT NULL COMMENT '收货时间',
  `buyer_state` tinyint(1) NULL DEFAULT 0 COMMENT '买家评价状态，0->未评价，1->已评价，2->已追评',
  `seller_state` tinyint(1) NULL DEFAULT 0 COMMENT '卖家评价状态，0->未评价，1->已评价',
  `express_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司缩写',
  `express_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `oid`(`oid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户购物订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_order_detail`;
CREATE TABLE `user_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增编号',
  `oid` bigint(32) NULL DEFAULT NULL COMMENT '订单编号',
  `index` int(11) NULL DEFAULT 0 COMMENT '索引',
  `gid` bigint(32) NULL DEFAULT NULL COMMENT '商品编号',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '单价',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提货备注，不是直接提货的订单，备注为空',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户购物订单详情表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
