/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.22-log : Database - realest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`realest` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `realest`;

/*Table structure for table `real_estate` */

DROP TABLE IF EXISTS `real_estate`;

CREATE TABLE `real_estate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房产id',
  `cardId` varchar(18) NOT NULL COMMENT '产权人身 份证号',
  `projectName` varchar(50) NOT NULL COMMENT '项目名称',
  `address` varchar(200) NOT NULL COMMENT '具体位置',
  `houseType` varchar(20) NOT NULL DEFAULT '两室' COMMENT '房屋类型',
  `area` int(11) NOT NULL COMMENT '使用面积',
  `buildTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建造时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `real_estate` */

insert  into `real_estate`(`id`,`cardId`,`projectName`,`address`,`houseType`,`area`,`buildTime`) values (1,'101205196505283022','富锦花园','富锦','三室',128,'2003-02-19 00:00:00'),(2,'101205196505283022','富锦花园','富锦','三室',128,'2003-02-19 00:00:00'),(3,'101205196505283022','徜徉国际','徜徉','二室',89,'2004-03-21 00:00:00'),(4,'101205196505283022','大悦城','大悦城','三室',98,'2006-09-19 00:00:00'),(5,'101205196505283022','大悦城','大悦城','三室',98,'2006-09-19 00:00:00'),(6,'202205197809191036','海航国际','海航国际','一室',60,'2005-06-12 00:00:00'),(7,'101201198211214240','理想国际','理想国际','二室',84,'2005-12-08 00:00:00'),(8,'411258198505073014','风华锦厦','风华锦厦','三室',128,'2006-02-19 00:00:00'),(9,'101205196505283022','秀园','秀园','三室',98,'2008-03-17 00:00:00');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `cardId` varchar(50) NOT NULL COMMENT '身份证号',
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `gender` int(11) NOT NULL COMMENT '性别  1女0男',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态',
  PRIMARY KEY (`cardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`cardId`,`name`,`gender`,`createTime`,`password`,`status`) values ('101201198211214240','王亮',0,'2005-12-08 00:00:00','123456',1),('101205196505283022','李刚',0,'2003-02-19 00:00:00','123456',1),('202205197809191036','夏雨',0,'2020-04-23 09:14:12','123456',1),('411258198505073014','尚鸿运',0,'2006-02-19 00:00:00','123456',1),('521205196505283022','å¼ ä¸',0,'2020-04-23 13:53:55','123456',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
