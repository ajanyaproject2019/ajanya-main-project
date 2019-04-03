/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.1.32-community : Database - dvcs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dvcs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dvcs`;

/*Table structure for table `admin_report` */

DROP TABLE IF EXISTS `admin_report`;

CREATE TABLE `admin_report` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `report` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(29) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `admin_report` */

insert  into `admin_report`(`id`,`title`,`report`,`date`,`status`,`department`) values (1,'aahkdd','jkshdddddddjdkf','2019-04-02','pending','cyber cell'),(2,'aahkdd','jkshdddddddjdkf','2019-04-02','pending','cyber cell'),(3,'fjgjkdjjfg','ghgkkkkkkkkkkkkkkkk','2019-04-02','pending','human rights'),(4,'affhh','njnkjmk','2019-04-02','pending','human rights');

/*Table structure for table `collect_tweet` */

DROP TABLE IF EXISTS `collect_tweet`;

CREATE TABLE `collect_tweet` (
  `id` varchar(20) NOT NULL,
  `tweet` varchar(200) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `collect_tweet` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) DEFAULT NULL,
  `userid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`userid`,`password`,`type`) values (2,'admin','admin','admin'),(3,'cc','111','cyber cell'),(1,'hr','123','Human Right');

/*Table structure for table `reg` */

DROP TABLE IF EXISTS `reg`;

CREATE TABLE `reg` (
  `uid` int(11) DEFAULT NULL,
  `userid` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `post` varchar(20) NOT NULL,
  `pin` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `fax` bigint(20) NOT NULL,
  `chairperson` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reg` */

insert  into `reg`(`uid`,`userid`,`department`,`street`,`city`,`post`,`pin`,`district`,`email`,`phone`,`fax`,`chairperson`) values (1,'aj@gmail.com','Human Right','hh','hh','hh','67688','hh','aj@gmail.com',67878978,3647689,'aj'),(2,'hr@gmail.com','Human Right','pookkad','pookkad','pookkad','67688','calicut','hr@gmail.com',2222,222000,'ajanya s');

/*Table structure for table `report_reply` */

DROP TABLE IF EXISTS `report_reply`;

CREATE TABLE `report_reply` (
  `id` varchar(20) NOT NULL,
  `report_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `file` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `report_reply` */

insert  into `report_reply`(`id`,`report_id`,`title`,`file`,`date`) values ('1',0,'report','domestic.pdf','2019-03-26'),('2',3,'log','log.docx','2019-03-28');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
