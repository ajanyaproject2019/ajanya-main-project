/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.5.20-log : Database - dvcs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dvcs` /*!40100 DEFAULT CHARACTER SET latin1 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `admin_report` */

insert  into `admin_report`(`id`,`title`,`report`,`date`,`status`,`department`) values (1,'aahkdd','jkshdddddddjdkf','2019-04-02','qqq','cyber cell'),(2,'aahkdd','jkshdddddddjdkf','2019-04-02','replied','cyber cell'),(3,'fjgjkdjjfg','ghgkkkkkkkkkkkkkkkk','2019-04-02','pending','human rights'),(4,'affhh','njnkjmk','2019-04-02','pending','human rights'),(5,'fgf','img1475915812154.jpg','2019-04-20','pending','Human Right'),(6,'vnbbc','Pink_police_new.docx','2019-04-20','pending','Cyber Cell'),(7,'fgd','smrithi.docx','2019-04-20','replied','Human Right');

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

/*Table structure for table `law` */

DROP TABLE IF EXISTS `law`;

CREATE TABLE `law` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `description` varchar(54) DEFAULT NULL,
  `file` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `law` */

insert  into `law`(`id`,`cid`,`description`,`file`) values (1,3,'sdfsfsd','domestic.pdf'),(2,3,'ghdg','log.docx'),(6,7,'dguf','EXISTING_SYSTEM_indoor.docx');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`userid`,`password`,`type`) values (1,'hr','123','Human Right'),(2,'admin','admin','admin'),(3,'cc','abcdefg','Cyber Cell'),(6,'\"+userid+\"','\"+psd+\"','\"+department+\"'),(12,'kiio','123456','Human Right'),(14,'kiio','7777','Human Right'),(15,'hty@gmail.com','9078451234','public'),(16,'anu@gmail.com','123','Cyber Cell'),(17,'manu@gmail.com','890890','public'),(18,'ammu@gmail.com','123456','Human Right');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `post` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `post` */

insert  into `post`(`id`,`uid`,`post`,`date`) values (1,15,'hhhhhhhhhhhhhhhhhh','2019-04-16'),(2,12,'jhjgjhghj','2019-04-20');

/*Table structure for table `publicregistration` */

DROP TABLE IF EXISTS `publicregistration`;

CREATE TABLE `publicregistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(54) DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `publicregistration` */

insert  into `publicregistration`(`id`,`name`,`place`,`email`,`phone`) values (15,'sonu','Calicut','hty@gmail.com','9078451234'),(17,'manu','clt','manu@gmail.com','890890');

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

insert  into `reg`(`uid`,`userid`,`department`,`street`,`city`,`post`,`pin`,`district`,`email`,`phone`,`fax`,`chairperson`) values (0,'\" + userid + \"','\" + department + \"','\" + street + \"','\" + city + \"','\" + post + \"','\" + pin + \"','\" + district + \"','\" + email + \"',0,0,'\" + chairperson + \"'),(1,'aj@gmail.com','Human Right','hh','hh','hh','67688','hh','aj@gmail.com',67878978,3647689,'aj'),(18,'ammu@gmail.com','Human Right','jkjh','jfgh','hjh','678998','kozhikode','ammu@gmail.com',9078123456,0,'khk'),(16,'anu@gmail.com','Cyber Cell','calicut','calicut','kadalundi','673314','calicut','anu@gmail.com',9078123456,0,'jadksad'),(2,'hr@gmail.com','Human Right','pookkad','pookkad','pookkad','67688','calicut','hr@gmail.com',2222,222000,'ajanya s'),(14,'kiio','Human Right','uuuu','uuuu','788788','998877','jjjj','kiio',8888768788,0,'mk');

/*Table structure for table `reportreply` */

DROP TABLE IF EXISTS `reportreply`;

CREATE TABLE `reportreply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `file` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `reportreply` */

insert  into `reportreply`(`rid`,`report_id`,`title`,`file`,`date`) values (1,2,'jjj','tble_example.docx','2019-04-20'),(2,7,'mmm','Doc2.docx','2019-04-20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
