/*
SQLyog Ultimate v12.08 (32 bit)
MySQL - 8.0.18 : Database - vhr
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `adjustsalary` */

DROP TABLE IF EXISTS `adjustsalary`;

CREATE TABLE `adjustsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `asDate` date DEFAULT NULL COMMENT 'adjust date',
  `beforeSalary` int(11) DEFAULT NULL COMMENT 'salary before adjust',
  `afterSalary` int(11) DEFAULT NULL COMMENT 'salary after adjust',
  `reason` varchar(255) DEFAULT NULL COMMENT 'adjust reason',
  `remark` varchar(255) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adjustsalary` */

/*Table structure for table `appraise` */

DROP TABLE IF EXISTS `appraise`;

CREATE TABLE `appraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `appDate` date DEFAULT NULL COMMENT 'appraise date',
  `appResult` varchar(32) DEFAULT NULL COMMENT 'appraise result',
  `appContent` varchar(255) DEFAULT NULL COMMENT 'appraise content',
  `remark` varchar(255) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `mail_send_log`;

CREATE TABLE `mail_send_log` (
  `msgId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0:sending...，1;success，2:fail',
  `routeKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `count` int(11) DEFAULT 0 COMMENT 'retry times',
  `tryTime` datetime DEFAULT NULL COMMENT 'first try time',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*Data for the table `appraise` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT 'department name',
  `parentId` int(11) DEFAULT NULL,
  `depPath` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `isParent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`parentId`,`depPath`,`enabled`,`isParent`) values (1,'shareholder',-1,'.1',1,1),(4,'director',1,'.1.4',1,1),(5,'general office',4,'.1.4.5',1,1),(8,'financial department',5,'.1.4.5.8',1,0),(78,'marketing department',5,'.1.4.5.78',1,1),(81,'northern marketing department',78,'.1.4.5.78.81',1,1),(82,'southern marketing department',78,'.1.4.5.78.82',1,0),(85,'ShiJiaZhuang marketing department',81,'.1.4.5.78.81.85',1,0),(86,'northwest marketing department',78,'.1.4.5.78.86',1,1),(87,'Xian marketing department',86,'.1.4.5.78.86.87',1,1),(89,'LianHu marketing department',87,'.1.4.5.78.86.87.89',1,0),(91,'tech department',5,'.1.4.5.91',1,0),(92,'Devops department',5,'.1.4.5.92',1,1),(93,'Devops1 department',92,'.1.4.5.92.93',1,0),(94,'Devops2 department',92,'.1.4.5.92.94',1,0),(96,'bbb',1,'.1.96',1,1),(104,'111',96,'.1.96.104',1,0);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'employee num',
  `name` varchar(10) DEFAULT NULL COMMENT 'employee name',
  `gender` char(4) DEFAULT NULL COMMENT 'employee gender',
  `birthday` date DEFAULT NULL COMMENT 'employee birthday',
  `idCard` char(18) DEFAULT NULL COMMENT 'employee id',
  `wedlock` enum('married','unmarried','divorced') DEFAULT NULL COMMENT 'marriage condition',
  `nationId` int(8) DEFAULT NULL COMMENT 'nation',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT 'nativePlace',
  `politicId` int(8) DEFAULT NULL COMMENT 'politic id',
  `email` varchar(20) DEFAULT NULL COMMENT 'email',
  `phone` varchar(11) DEFAULT NULL COMMENT 'phone',
  `address` varchar(64) DEFAULT NULL COMMENT 'address',
  `departmentId` int(11) DEFAULT NULL COMMENT 'department id',
  `jobLevelId` int(11) DEFAULT NULL COMMENT 'job level ID',
  `posId` int(11) DEFAULT NULL COMMENT 'position ID',
  `engageForm` varchar(18) DEFAULT NULL COMMENT 'engagement form',
  `tiptopDegree` enum('Phd','master','bachelor','junior college','senior','middle','primary','other') DEFAULT NULL COMMENT 'tip-top degree',
  `specialty` varchar(32) DEFAULT NULL COMMENT 'major',
  `school` varchar(32) DEFAULT NULL COMMENT 'school',
  `beginDate` date DEFAULT NULL COMMENT 'employment date',
  `workState` enum('work','resign') DEFAULT 'work' COMMENT 'work state',
  `workID` char(8) DEFAULT NULL COMMENT 'work ID',
  `contractTerm` double DEFAULT NULL COMMENT 'contract time',
  `conversionTime` date DEFAULT NULL COMMENT 'conversion time',
  `notWorkDate` date DEFAULT NULL COMMENT 'resign time',
  `beginContract` date DEFAULT NULL COMMENT 'contract begin date',
  `endContract` date DEFAULT NULL COMMENT 'contract end date',
  `workAge` int(11) DEFAULT NULL COMMENT 'years on the job',
  PRIMARY KEY (`id`),
  KEY `departmentId` (`departmentId`),
  KEY `jobId` (`jobLevelId`),
  KEY `dutyId` (`posId`),
  KEY `nationId` (`nationId`),
  KEY `politicId` (`politicId`),
  KEY `workID_key` (`workID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1942 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`gender`,`birthday`,`idCard`,`wedlock`,`nationId`,`nativePlace`,`politicId`,`email`,`phone`,`address`,`departmentId`,`jobLevelId`,`posId`,`engageForm`,`tiptopDegree`,`specialty`,`school`,`beginDate`,`workState`,`workID`,`contractTerm`,`conversionTime`,`notWorkDate`,`beginContract`,`endContract`,`workAge`) values (1,'JiangNan','male','1990-01-01','610122199001011256','married',1,'ShanXi Province',13,'laowang@qq.com','18565558897','ShenZhen',5,9,29,'labor contract','bachelor','information management and system','Shenzhen college','2018-01-01','work','00000001',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(2,'ChenJing','female','1989-02-01','421288198902011234','married',1,'Hainan',1,'chenjing@qq.com','18795556693','Hainan Province',91,12,29,'labor contract','junior','marketing','Wuhan college','2015-06-09','work','00000002',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL);

/*Table structure for table `employeeec` */

DROP TABLE IF EXISTS `employeeec`;

CREATE TABLE `employeeec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT 'employeeec num',
  `ecDate` date DEFAULT NULL COMMENT 'award date',
  `ecReason` varchar(255) DEFAULT NULL COMMENT 'award reason',
  `ecPoint` int(11) DEFAULT NULL COMMENT 'award point',
  `ecType` int(11) DEFAULT NULL COMMENT 'award type，0：award，1：punishment',
  `remark` varchar(255) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeeec` */

/*Table structure for table `employeeremove` */

DROP TABLE IF EXISTS `employeeremove`;

CREATE TABLE `employeeremove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `afterDepId` int(11) DEFAULT NULL COMMENT 'department after adjust',
  `afterJobId` int(11) DEFAULT NULL COMMENT 'position after adjust',
  `removeDate` date DEFAULT NULL COMMENT 'adjust date',
  `reason` varchar(255) DEFAULT NULL COMMENT 'adjust reason',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeeremove` */

/*Table structure for table `employeetrain` */

DROP TABLE IF EXISTS `employeetrain`;

CREATE TABLE `employeetrain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT 'employee id',
  `trainDate` date DEFAULT NULL COMMENT 'training date',
  `trainContent` varchar(255) DEFAULT NULL COMMENT 'training content',
  `remark` varchar(255) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeetrain` */

/*Table structure for table `empsalary` */

DROP TABLE IF EXISTS `empsalary`;

CREATE TABLE `empsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eid` (`eid`),
  KEY `empsalary_ibfk_2` (`sid`),
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `empsalary` */

insert  into `empsalary`(`id`,`eid`,`sid`) values (6,4,10),(10,5,9),(11,6,13),(12,7,13),(14,8,10),(15,9,10),(20,10,13),(21,11,9),(22,3,13),(24,2,9),(25,1,13),(26,33,10),(28,34,9),(29,44,10),(30,45,10),(31,43,10),(32,47,10),(33,52,13),(34,53,10),(35,54,10),(36,56,10),(38,21,9);

/*Table structure for table `hr` */

DROP TABLE IF EXISTS `hr`;

CREATE TABLE `hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT 'hr name',
  `phone` char(11) DEFAULT NULL COMMENT 'hr phone',
  `telephone` varchar(16) DEFAULT NULL COMMENT 'hr house phone',
  `address` varchar(64) DEFAULT NULL COMMENT 'hr address',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT 'hr username',
  `password` varchar(255) DEFAULT NULL COMMENT 'hr password',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `hr` */

insert  into `hr`(`id`,`name`,`phone`,`telephone`,`address`,`enabled`,`username`,`password`,`userface`,`remark`) values (3,'system operator','18568887789','029-82881234','ShenzhenNanShan',1,'admin','$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm','http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg',NULL),(5,'LiBai','18568123489','029-82123434','HaiKouMeiLan',1,'LiBai','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg',NULL),(10,'HanYu','18568123666','029-82111555','GuangZhouFanYu',1,'hanyu','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg',NULL),(11,'LiuZongYuan','18568123377','029-82111333','GuangZhouTianHe',1,'liuzongyuan','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg',NULL),(12,'ZengGong','18568128888','029-82111222','GuangZhouYueXiu',1,'zenggong','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg',NULL);

/*Table structure for table `hr_role` */

DROP TABLE IF EXISTS `hr_role`;

CREATE TABLE `hr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `hr_role_ibfk_1` (`hrid`),
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

/*Data for the table `hr_role` */

insert  into `hr_role`(`id`,`hrid`,`rid`) values (1,3,6),(35,12,4),(36,12,3),(37,12,2),(43,11,3),(44,11,2),(45,11,4),(46,11,5),(48,10,3),(49,10,4),(72,5,1),(73,5,2),(74,5,3);

/*Table structure for table `joblevel` */

DROP TABLE IF EXISTS `joblevel`;

CREATE TABLE `joblevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT 'job level name',
  `titleLevel` enum('senior level','deputy senior level','junior level','primary level','member level') DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `joblevel` */

insert  into `joblevel`(`id`,`name`,`titleLevel`,`createDate`,`enabled`) values (9,'professor','senior level','2020-11-11 00:00:00',1),(10,'deputy professor','deputy senior level','2020-01-11 21:19:20',1),(12,'TA','primary level','2020-11-11 21:35:39',1),(13,'teacher','junior level','2020-11-11 00:00:00',0),(14,'primary engineer','primary level','2020-11-14 00:00:00',1),(15,'junior engineer','junior level','2020-11-14 00:00:00',1),(16,'senior engineer','deputy senior level','2020-01-14 16:19:14',1),(17,'high level engineer','senior level','2020-01-14 16:19:24',1);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`url`,`path`,`component`,`name`,`iconCls`,`keepAlive`,`requireAuth`,`parentId`,`enabled`) values (1,'/',NULL,NULL,'all',NULL,NULL,NULL,NULL,1),(2,'/','/home','Home','employee data','fa fa-user-circle-o',NULL,1,1,1),(3,'/','/home','Home','hr management','fa fa-address-card-o',NULL,1,1,1),(4,'/','/home','Home','salary management','fa fa-money',NULL,1,1,1),(5,'/','/home','Home','statistics management','fa fa-bar-chart',NULL,1,1,1),(6,'/','/home','Home','system management','fa fa-windows',NULL,1,1,1),(7,'/employee/basic/**','/emp/basic','EmpBasic','basic information',NULL,NULL,1,2,1),(8,'/employee/advanced/**','/emp/adv','EmpAdv','high level data',NULL,NULL,1,2,1),(9,'/personnel/emp/**','/per/emp','PerEmp','employee data',NULL,NULL,1,3,1),(10,'/personnel/ec/**','/per/ec','PerEc','employee reward',NULL,NULL,1,3,1),(11,'/personnel/train/**','/per/train','PerTrain','employee training',NULL,NULL,1,3,1),(12,'/personnel/salary/**','/per/salary','PerSalary','employee salary',NULL,NULL,1,3,1),(13,'/personnel/remove/**','/per/mv','PerMv','employee adjustment',NULL,NULL,1,3,1),(14,'/salary/sob/**','/sal/sob','SalSob','salary sob management',NULL,NULL,1,4,1),(15,'/salary/sobcfg/**','/sal/sobcfg','SalSobCfg','employee account set',NULL,NULL,1,4,1),(16,'/salary/table/**','/sal/table','SalTable','salary management',NULL,NULL,1,4,1),(17,'/salary/month/**','/sal/month','SalMonth','handle at month end',NULL,NULL,1,4,1),(18,'/salary/search/**','/sal/search','SalSearch','salary check',NULL,NULL,1,4,1),(19,'/statistics/all/**','/sta/all','StaAll','synthetic statistic information',NULL,NULL,1,5,1),(20,'/statistics/score/**','/sta/score','StaScore','employee points statistics',NULL,NULL,1,5,1),(21,'/statistics/personnel/**','/sta/pers','StaPers','personnel information statistics',NULL,NULL,1,5,1),(22,'/statistics/recored/**','/sta/record','StaRecord','personnel record statistics',NULL,NULL,1,5,1),(23,'/system/basic/**','/sys/basic','SysBasic','basic info set',NULL,NULL,1,6,1),(24,'/system/cfg/**','/sys/cfg','SysCfg','system management',NULL,NULL,1,6,1),(25,'/system/log/**','/sys/log','SysLog','operation log management',NULL,NULL,1,6,1),(26,'/system/hr/**','/sys/hr','SysHr','operator management',NULL,NULL,1,6,1),(27,'/system/data/**','/sys/data','SysData','restore database',NULL,NULL,1,6,1),(28,'/system/init/**','/sys/init','SysInit','init database',NULL,NULL,1,6,1);

/*Table structure for table `menu_role` */

DROP TABLE IF EXISTS `menu_role`;

CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `rid` (`rid`),
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;

/*Data for the table `menu_role` */

insert  into `menu_role`(`id`,`mid`,`rid`) values (161,7,3),(162,7,6),(163,9,6),(164,10,6),(165,11,6),(166,12,6),(167,13,6),(168,14,6),(169,15,6),(170,16,6),(171,17,6),(172,18,6),(173,19,6),(174,20,6),(175,21,6),(176,22,6),(177,23,6),(178,25,6),(179,26,6),(180,27,6),(181,28,6),(182,24,6),(247,7,4),(248,8,4),(249,11,4),(250,7,2),(251,8,2),(252,9,2),(253,10,2),(254,12,2),(255,13,2),(256,7,1),(257,8,1),(258,9,1),(259,10,1),(260,11,1),(261,12,1),(262,13,1),(263,14,1),(264,15,1),(265,16,1),(266,17,1),(267,18,1),(268,19,1),(269,20,1),(270,21,1),(271,22,1),(272,23,1),(273,24,1),(274,25,1),(275,26,1),(276,27,1),(277,28,1),(280,7,14),(281,8,14),(282,9,14);

/*Table structure for table `msgcontent` */

DROP TABLE IF EXISTS `msgcontent`;

CREATE TABLE `msgcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `msgcontent` */

insert  into `msgcontent`(`id`,`title`,`message`,`createDate`) values (14,'2222222222','11111111111111111','2020-11-20 20:46:19'),(15,'22222222','3333333333333333333333','2020-11-22 21:45:57'),(16,'notification title1','notification content1','2020-11-23 11:41:39'),(17,'notification title2','notification content2','2020-11-23 11:52:37'),(18,'notification title3','notification content3','2020-11-23 12:19:41');

/*Table structure for table `nation` */

DROP TABLE IF EXISTS `nation`;

CREATE TABLE `nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

/*Data for the table `nation` */

insert  into `nation`(`id`,`name`) values (1,'HanZu'),(2,'MengGuzu'),(3,'HuiZu'),(4,'ZangZu'),(5,'WeiWoErZu'),(6,'MiaoZu'),(7,'YiZu'),(8,'ZhuangZu'),(9,'BuYiZu'),(10,'ChaoXianZu'),(11,'ManZu'),(12,'DongZu'),(13,'YaoZu'),(14,'BaiZu'),(15,'TuJiaZu'),(16,'HaNiZu'),(17,'HaSaKeZu'),(18,'DaiZu'),(19,'LiZu'),(20,'LiSuZu'),(21,'WaZu'),(22,'SheZu'),(23,'GaoShanZu'),(24,'LaGuZu'),(25,'ShuiZu'),(26,'DongXiangZu'),(27,'NaXiZu'),(28,'JingPoZu'),(29,'KeErKeZiZu'),(30,'TuZu'),(31,'DaWoErZu'),(32,'MuLaoZu'),(33,'QiangZu'),(34,'BuLangZu'),(35,'SaLaZu'),(36,'MaoNanZu'),(37,'GeLaoZu'),(38,'XiBoZu'),(39,'AChangZu'),(40,'PuMiZu'),(41,'TaJiKeZu'),(42,'NuZu'),(43,'WuZiBieKeZu'),(44,'ELuoSiZu'),(45,'EWenKeZu'),(46,'BengLongZu'),(47,'BaoAnZu'),(48,'YuGuZu'),(49,'JingZu'),(50,'TaTaErZu'),(51,'DuLongZu'),(52,'ELunChunZu'),(53,'HeZheZu'),(54,'MenBaZu'),(55,'LuoBaZu'),(56,'JiNuoZu');

/*Table structure for table `oplog` */

DROP TABLE IF EXISTS `oplog`;

CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date DEFAULT NULL COMMENT 'add date',
  `operate` varchar(255) DEFAULT NULL COMMENT 'operation content',
  `hrid` int(11) DEFAULT NULL COMMENT 'operator ID',
  PRIMARY KEY (`id`),
  KEY `hrid` (`hrid`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oplog` */

/*Table structure for table `politicsstatus` */

DROP TABLE IF EXISTS `politicsstatus`;

CREATE TABLE `politicsstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `politicsstatus` */

insert  into `politicsstatus`(`id`,`name`) values (1,'party member'),(2,'pre party member'),(3,'league member'),(4,'national revolutionary member'),(5,'national league member'),(6,'national build member'),(7,'national progress member'),(8,'farming party member'),(9,'public party member'),(10,'JiuSan member'),(11,'TaiWan member'),(12,'democrat member'),(13,'ordinary');

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT 'position',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `position` */

insert  into `position`(`id`,`name`,`createDate`,`enabled`) values (29,'tech director','2020-11-11 21:13:42',1),(30,'devops director','2020-11-11 21:13:48',1),(31,'marketing director','2020-01-11 00:00:00',1),(33,'developing engineer','2020-11-14 00:00:00',0),(34,'devops engineer','2020-11-14 16:11:41',1),(36,'Java developing engineer','2019-10-01 00:00:00',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT 'role name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`nameZh`) values (1,'ROLE_manager','department manager'),(2,'ROLE_personnel','hr'),(3,'ROLE_recruiter','hr manager'),(4,'ROLE_train','training manager'),(5,'ROLE_performance','salary manager'),(6,'ROLE_admin','system manager'),(13,'ROLE_test2','test role2'),(14,'ROLE_test1','test role1'),(17,'ROLE_test3','test role3'),(18,'ROLE_test4','test role4'),(19,'ROLE_test4','test role4'),(20,'ROLE_test5','test role5'),(21,'ROLE_test6','test role6');

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basicSalary` int(11) DEFAULT NULL COMMENT 'basic salary',
  `bonus` int(11) DEFAULT NULL COMMENT 'bonus',
  `lunchSalary` int(11) DEFAULT NULL COMMENT 'lunch allowance',
  `trafficSalary` int(11) DEFAULT NULL COMMENT 'traffic allowance',
  `allSalary` int(11) DEFAULT NULL COMMENT 'salary',
  `pensionBase` int(11) DEFAULT NULL COMMENT 'pension base',
  `pensionPer` float DEFAULT NULL COMMENT 'pension rate',
  `createDate` timestamp NULL DEFAULT NULL COMMENT 'create date',
  `medicalBase` int(11) DEFAULT NULL COMMENT 'medical base',
  `medicalPer` float DEFAULT NULL COMMENT 'medical rate',
  `accumulationFundBase` int(11) DEFAULT NULL COMMENT 'accumulationFund base',
  `accumulationFundPer` float DEFAULT NULL COMMENT 'accumulationFund rate',
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `salary` */

insert  into `salary`(`id`,`basicSalary`,`bonus`,`lunchSalary`,`trafficSalary`,`allSalary`,`pensionBase`,`pensionPer`,`createDate`,`medicalBase`,`medicalPer`,`accumulationFundBase`,`accumulationFundPer`,`name`) values (9,9000,4000,800,500,NULL,2000,0.07,'2020-11-24 00:00:00',2000,0.07,2000,0.07,'marketing salary ledger'),(10,2000,2000,400,1000,NULL,2000,0.07,'2020-11-11 00:00:00',2000,0.07,2000,0.07,'hr salary ledger'),(13,20000,3000,500,500,NULL,4000,0.07,'2020-11-25 00:00:00',4000,0.07,4000,0.07,'devops salary ledger');

/*Table structure for table `sysmsg` */

DROP TABLE IF EXISTS `sysmsg`;

CREATE TABLE `sysmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT 'message id',
  `type` int(11) DEFAULT '0' COMMENT '0: group message',
  `hrid` int(11) DEFAULT NULL COMMENT 'message giver',
  `state` int(11) DEFAULT '0' COMMENT '0 unread 1 read',
  PRIMARY KEY (`id`),
  KEY `hrid` (`hrid`),
  KEY `sysmsg_ibfk_1` (`mid`),
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`),
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

/*Data for the table `sysmsg` */

insert  into `sysmsg`(`id`,`mid`,`type`,`hrid`,`state`) values (57,14,0,3,1),(58,14,0,5,1),(59,14,0,10,1),(60,14,0,11,0),(61,14,0,12,0),(62,15,0,3,1),(63,15,0,5,1),(64,15,0,10,1),(65,15,0,11,0),(66,15,0,12,0),(67,16,0,3,1),(68,16,0,5,1),(69,16,0,10,1),(70,16,0,11,0),(71,16,0,12,0),(72,17,0,3,1),(73,17,0,5,1),(74,17,0,10,1),(75,17,0,11,0),(76,17,0,12,0),(77,18,0,3,1),(78,18,0,5,0),(79,18,0,10,0),(80,18,0,11,0),(81,18,0,12,0);

/* Procedure structure for procedure `addDep` */

/*!50003 DROP PROCEDURE IF EXISTS  `addDep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from department where id=parentId;
  update department set depPath=concat(pDepPath,'.',did) where id=did;
  update department set isParent=true where id=parentId;
end */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDep` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDep`(in did int,out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  declare a int;
  select count(*) into a from department where id=did and isParent=false;
  if a=0 then set result=-2;
  else
  select count(*) into ecount from employee where departmentId=did;
  if ecount>0 then set result=-1;
  else
  select parentId into pid from department where id=did;
  delete from department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from department where parentId=pid;
  if pcount=0 then update department set isParent=false where id=pid;
  end if;
  end if;
  end if;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
