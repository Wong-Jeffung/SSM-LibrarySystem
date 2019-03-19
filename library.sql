/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.21-log : Database - library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `library`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` bigint(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(8) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`) values (1,'1111','1111');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` bigint(4) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `number` varchar(8) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `press` varchar(20) DEFAULT NULL,
  `publicationdate` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `pagecount` int(4) DEFAULT NULL,
  `keyword` varchar(8) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `isborrow` int(4) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`type`,`name`,`number`,`author`,`press`,`publicationdate`,`price`,`pagecount`,`keyword`,`createtime`,`isborrow`,`remark`) values (14,'bt009','大雪中的山庄','b001','东野圭吾 ','北京十月文艺出版社','2018-06-17','36.00',200,NULL,NULL,0,NULL),(15,'bt007','三生三世 十里桃花','b002','唐七公子 ','沈阳出版社','2007-04-03','15.00',250,NULL,NULL,0,NULL),(16,'bt009','特工皇妃','b004','潇湘冬儿','江苏文艺出版社','2011-05-05','74.80',333,NULL,NULL,0,NULL),(17,'bt011','人类简史','b005','[以色列] 尤瓦尔·赫拉利 ','中信出版社','2014-11-01','68.00',100,NULL,NULL,0,NULL),(18,'bt011','明朝那些事儿（1-9）','b006','当年明月 ','中国海关出版社','2009-04-06','358.20',500,NULL,NULL,0,NULL),(19,'bt006','经济学原理（上下）','b007','[美] 曼昆 ','机械工业出版社','2003-08-05','88.00',156,NULL,NULL,0,NULL),(20,'bt009','方向','b008','马克-安托万·马修 ','后浪丨北京联合出版公司','2017-04-01','99.80',186,NULL,NULL,0,NULL),(21,'bt009','画的秘密','b009','马克-安托万·马修 ','北京联合出版公司·后浪出版公司','2016-01-01','60.00',556,NULL,NULL,0,NULL),(22,'bt009','造彩虹的人','b010','东野圭吾 ','北京十月文艺出版社','2017-06-01','39.50',775,NULL,NULL,0,NULL),(23,'bt009','控方证人','b011','阿加莎·克里斯蒂 ','新星出版社','2017-05-01','35.00',195,NULL,NULL,0,NULL),(24,'bt009','少有人走的路','b012','M·斯科特·派克 ','吉林文史出版社','2007-01-01','26.00',300,NULL,NULL,0,NULL),(25,'bt009','追寻生命的意义','b013','[奥] 维克多·弗兰克 ','新华出版社','2003-01-01','12.00',250,NULL,NULL,0,NULL),(26,'bt009','秘密花园','b014','乔汉娜·贝斯福 ','北京联合出版公司','2015-06-01','42.00',450,NULL,NULL,0,NULL);

/*Table structure for table `booktype` */

DROP TABLE IF EXISTS `booktype`;

CREATE TABLE `booktype` (
  `id` bigint(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(8) DEFAULT NULL,
  `name` varchar(8) DEFAULT NULL,
  `keyword` varchar(8) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `booktype` */

insert  into `booktype`(`id`,`number`,`name`,`keyword`,`remark`,`createtime`) values (1,'bt001','马克思主义',NULL,'马克思主义',NULL),(2,'bt002','哲学',NULL,NULL,NULL),(3,'bt003','社会科学总论',NULL,NULL,NULL),(4,'bt004','政治法律',NULL,NULL,NULL),(5,'bt005','军事',NULL,NULL,NULL),(6,'bt006','经济',NULL,NULL,NULL),(7,'bt007','文化',NULL,NULL,NULL),(8,'bt008','语言',NULL,NULL,NULL),(9,'bt009','文学',NULL,NULL,NULL),(10,'bt010','艺术',NULL,NULL,NULL),(11,'bt011','历史地理',NULL,NULL,NULL),(12,'bt012','自然科学总论',NULL,NULL,NULL),(13,'bt013',' 数理科学和化学',NULL,NULL,NULL),(14,'bt014','天文学、地球科学',NULL,NULL,NULL),(15,'bt015','生物科学',NULL,NULL,NULL),(16,'bt016','医药、卫生',NULL,NULL,NULL),(17,'bt017','农业科学',NULL,NULL,NULL),(18,'bt018','工业技术',NULL,NULL,NULL),(19,'bt019','交通运输',NULL,NULL,NULL),(20,'bt020','航空、航天',NULL,NULL,NULL),(21,'bt021','环境科学',NULL,NULL,NULL),(22,'bt022','综合',NULL,NULL,NULL);

/*Table structure for table `reader` */

DROP TABLE IF EXISTS `reader`;

CREATE TABLE `reader` (
  `id` bigint(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `workunit` varchar(30) DEFAULT NULL,
  `homeaddress` varchar(30) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `reader` */

insert  into `reader`(`id`,`number`,`name`,`type`,`sex`,`workunit`,`homeaddress`,`tel`,`email`,`createtime`,`remark`) values (1,'r001','张三','rt002','女','广州','广州','15626277129','913772015@qq.com',NULL,NULL),(2,'r002','李四','rt001','男',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `reader_account` */

DROP TABLE IF EXISTS `reader_account`;

CREATE TABLE `reader_account` (
  `id` bigint(4) NOT NULL,
  `username` varchar(8) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reader_account` */

insert  into `reader_account`(`id`,`username`,`password`) values (1,'r111',NULL);

/*Table structure for table `readertype` */

DROP TABLE IF EXISTS `readertype`;

CREATE TABLE `readertype` (
  `id` bigint(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(8) DEFAULT NULL,
  `name` varchar(8) DEFAULT NULL,
  `borrownumber` varchar(10) DEFAULT NULL COMMENT '借书数量',
  `borrowterm` varchar(10) DEFAULT NULL COMMENT '借书期限',
  `remark` varchar(50) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `readertype` */

insert  into `readertype`(`id`,`number`,`name`,`borrownumber`,`borrowterm`,`remark`,`createtime`) values (1,'rt001','一级读者','8','30',NULL,NULL),(2,'rt002','二级读者','10','60',NULL,NULL);

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `id` bigint(4) NOT NULL AUTO_INCREMENT,
  `readernumber` varchar(8) DEFAULT NULL,
  `booknumber` varchar(8) DEFAULT NULL,
  `borrowdate` date DEFAULT NULL,
  `returndate` date DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reader` (`readernumber`),
  KEY `book` (`booknumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `record` */

insert  into `record`(`id`,`readernumber`,`booknumber`,`borrowdate`,`returndate`,`remark`) values (2,'dasdsad','b014','2018-06-25','2018-06-25',NULL),(4,'adasd','b006','2018-06-26','2018-06-26',NULL),(5,'dasdd','b001','2018-06-27','2018-06-27',NULL),(6,'sadas',NULL,'2018-06-27',NULL,NULL),(7,'dasd',NULL,'2018-06-27',NULL,NULL),(8,'r002','b001','2018-06-27','2018-06-27',NULL),(9,'r001','b001','2018-06-27','2018-06-27',NULL),(10,'r001','b001','2018-06-27','2018-06-27',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
