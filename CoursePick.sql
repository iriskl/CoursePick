/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : localhost:3306
 Source Schema         : coursepick

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 18/11/2024 12:06:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/download/1728310070781-avatar.png', 'ADMIN');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学院描述',
  `score` int NULL DEFAULT NULL COMMENT '最低学分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学院信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (2, '计算机学院', '华南师范大学计算机学院', 34);
INSERT INTO `college` VALUES (3, '马克思主义学院', '华南师范大学马克思主义学院', 32);
INSERT INTO `college` VALUES (4, '人工智能学院', '无', 32);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '课程介绍',
  `score` int NULL DEFAULT NULL COMMENT '课程学分',
  `teacher_id` int NULL DEFAULT NULL COMMENT '授课教师',
  `num` int NULL DEFAULT NULL COMMENT '开班人数',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时间',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课地点',
  `college_id` int NULL DEFAULT NULL COMMENT '所属学院',
  `already_num` int NULL DEFAULT NULL COMMENT '已选人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (2, '线性代数', '无', 3, 1, 1, '周一12节', '一课北203', 2, 1);
INSERT INTO `course` VALUES (3, '程序设计基础', 'C++', 3, 1, 32, '周一34节', '一课北502', 2, 2);
INSERT INTO `course` VALUES (4, '离散数学', NULL, 3, 2, 30, '周一56节', '一课南304', 2, 2);
INSERT INTO `course` VALUES (5, 'Java程序设计基础', 'Java', 3, 2, 35, '周二12节', '一课南505', 2, 2);
INSERT INTO `course` VALUES (7, '计算机组成原理', '计组', 4, 1, 40, '一课北406', '周二56节', 2, 2);
INSERT INTO `course` VALUES (9, '高等数学', NULL, 3, 4, 1, '周二34节', '北202', 2, 1);

-- ----------------------------
-- Table structure for course_selection
-- ----------------------------
DROP TABLE IF EXISTS `course_selection`;
CREATE TABLE `course_selection`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `teacher_id` int NULL DEFAULT NULL COMMENT '授课教师',
  `student_id` int NULL DEFAULT NULL COMMENT '选课学生',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `score` decimal(10, 2) NULL DEFAULT NULL COMMENT '学生成绩',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '选课/成绩信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_selection
-- ----------------------------
INSERT INTO `course_selection` VALUES (2, '程序设计基础', 1, 1, 3, 67.00);
INSERT INTO `course_selection` VALUES (3, '离散数学', 2, 1, 4, NULL);
INSERT INTO `course_selection` VALUES (4, 'Java程序设计基础', 2, 1, 5, NULL);
INSERT INTO `course_selection` VALUES (5, '计算机组成原理', 1, 1, 7, 57.00);
INSERT INTO `course_selection` VALUES (12, '线性代数', 1, 4, 2, NULL);
INSERT INTO `course_selection` VALUES (16, '程序设计基础', 1, 7, 3, NULL);
INSERT INTO `course_selection` VALUES (17, '离散数学', 2, 7, 4, NULL);
INSERT INTO `course_selection` VALUES (18, 'Java程序设计基础', 2, 7, 5, NULL);
INSERT INTO `course_selection` VALUES (19, '计算机组成原理', 1, 7, 7, NULL);
INSERT INTO `course_selection` VALUES (21, '高等数学', 4, 7, 9, NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '关于最新选课通知', '选课系统将在2024/10/30日12:00开放选课，请各位同学留意！', '2024-10-25 11:10:05');
INSERT INTO `notice` VALUES (2, '学校关于选课作弊的通告', '选课奔着公平公正原侧，大家切勿利用任何方式作弊一旦发现，记过处理！', '2024-10-25 11:11:17');
INSERT INTO `notice` VALUES (3, '最新选课管理系统已上线', '最新选课管理系统经过多轮内测后成功推送公测，在使用过程中如遇问题可联系开发团队反馈。', '2024-10-25 11:12:45');

-- ----------------------------
-- Table structure for speciality
-- ----------------------------
DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业名称',
  `college_id` int NULL DEFAULT NULL COMMENT '学院ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '专业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of speciality
-- ----------------------------
INSERT INTO `speciality` VALUES (1, '计算机科学与技术', 2);
INSERT INTO `speciality` VALUES (2, '网络工程', 2);
INSERT INTO `speciality` VALUES (3, '计算机科学与技术（师范）', 2);
INSERT INTO `speciality` VALUES (5, '人工智能', 4);
INSERT INTO `speciality` VALUES (6, '软件工程', 4);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学号',
  `speciality_id` int NULL DEFAULT NULL COMMENT '专业ID',
  `score` int NULL DEFAULT NULL COMMENT '学分',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'zhangsan', '123456', '张三', 'STUDENT', '男', '20232131060', 1, 0, 'http://localhost:9090/files/download/1728313771989-1724853088560(1).jpg');
INSERT INTO `student` VALUES (5, 'wangdong', '123456', '王东', 'STUDENT', '男', '20232131061', 2, 0, NULL);
INSERT INTO `student` VALUES (6, 'lisi', '123456', '李四', 'STUDENT', '男', '20232131062', 3, 0, NULL);
INSERT INTO `student` VALUES (7, 'test_student', '123456', '学生测试账号', 'STUDENT', '男', '20232131063', 5, 16, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称',
  `college_id` int NULL DEFAULT NULL COMMENT '学院ID',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教师信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'li', '123456', '李老师', '男', '讲师', 2, 'TEACHER', 'http://localhost:9090/files/download/1728310780518-离谱.png');
INSERT INTO `teacher` VALUES (2, 'zhang', '123456', '张老师', '男', '教授', 2, 'TEACHER', 'http://localhost:9090/files/download/1728311161211-08d50a7f364650cffa0e00a6f241e167.jpg');
INSERT INTO `teacher` VALUES (4, 'test_teacher', '123456', '教师测试账号', '男', '教授', 2, 'TEACHER', NULL);

SET FOREIGN_KEY_CHECKS = 1;
