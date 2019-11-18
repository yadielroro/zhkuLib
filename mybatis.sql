/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.39 : Database - zklib
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zklib` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zklib`;

/*Table structure for table `amerce` */

DROP TABLE IF EXISTS `amerce`;

CREATE TABLE `amerce` (
  `amerce_id` varchar(25) NOT NULL,
  `borrow_id` varchar(25) DEFAULT NULL,
  `sid` varchar(25) DEFAULT NULL,
  `item` varchar(25) DEFAULT NULL,
  `money` varchar(25) DEFAULT NULL,
  `ispay` varchar(25) DEFAULT NULL,
  `paytime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`amerce_id`),
  KEY `borrow_id` (`borrow_id`),
  KEY `sid` (`sid`),
  CONSTRAINT `amerce_ibfk_1` FOREIGN KEY (`borrow_id`) REFERENCES `borrow` (`borrow_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `amerce_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `amerce` */

insert  into `amerce`(`amerce_id`,`borrow_id`,`sid`,`item`,`money`,`ispay`,`paytime`) values ('1','3','123','超期罚款','10','1','2019-05-12'),('2','4','123','丢书罚款','100','1','2019-05-13');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bid` varchar(25) NOT NULL,
  `bname` varchar(25) DEFAULT NULL,
  `author` varchar(25) DEFAULT NULL,
  `publishment` varchar(25) DEFAULT NULL,
  `isbn` varchar(25) DEFAULT NULL,
  `buytime` varchar(25) DEFAULT NULL,
  `price` varchar(25) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`bid`,`bname`,`author`,`publishment`,`isbn`,`buytime`,`price`,`status`) values ('01','Java基础','艾妮','清华大学出版社','978-99-1122','2018-12-12','89.9','0'),('02','Java框架','唐尼','机械工业出版社','972-66-8899','2019-01-23','109.9','1'),('03','言语理解与表达','老刘','燎原教育','22-333-Y20','2019-03-20','50','1'),('04','资料分析','老刘','燎原教育','22-333-Y21','2019-03-20','50','1'),('05','数量关系','老刘','燎原教育','22-333-Y22','2019-03-20','50','1'),('06','常识判断','阿福','燎原教育','22-333-Y23','2019-03-21','30','1'),('07','逻辑判断','阿福','燎原教育','22-333-Y24','2019-03-21','30','1'),('08','科学推理','寿局','燎原教育','22-333-Y25','2019-03-21','30','1'),('09','面试','寿局','燎原教育','22-333-Y26','2019-03-21','66','1'),('10','行政职业能力测试','粉笔','粉笔出版社','88-222-331','2019-05-02','20','1'),('11','申论','粉笔','粉笔出版社','88-222-332','2019-05-02','20','1'),('12','JavaWeb入门','程序员','清华大学出版社','978-99-1121','2018-12-02','30','1'),('13','JavaScript入门','程序员','清华大学出版社','978-99-1123','2018-12-03','30','1'),('14','HTML5+CSS3+JavaScript','程序员','清华大学出版社','978-99-1124','2018-12-04','30','1'),('15','Python入门','程序猿','人民教育出版社','878-22-1222','2019-05-02','122','1'),('16','JavaWeb+SSM基础','飞鱼','人民教育出版社','878-22-1221','2019-05-02','122','2'),('17','vueJS','scall','人民教育出版社','878-22-1224','2019-05-03','133','1'),('530','成其伟的黑色','成其伟','江门出版社','888888888','2019-05-30','222','1');

/*Table structure for table `borrow` */

DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `borrow_id` varchar(25) NOT NULL,
  `sid` varchar(25) DEFAULT NULL,
  `bid` varchar(25) DEFAULT NULL,
  `start` varchar(25) DEFAULT NULL,
  `end` varchar(25) DEFAULT NULL,
  `again` varchar(25) DEFAULT NULL,
  `deal` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `sid` (`sid`),
  KEY `bid` (`bid`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `borrow` */

insert  into `borrow`(`borrow_id`,`sid`,`bid`,`start`,`end`,`again`,`deal`) values ('1','123','01','2019-03-11','2019-03-29','0','0'),('10','125','06','2019-6-15','2019-7-15','0','0'),('2','123','02','2019-04-11','2019-04-20','0','1'),('201953034415','123','17','2019-5-30','2019-6-29','0','0'),('201953083945','123','10','2019-5-30','2019-6-29','0','0'),('3','125','15','2019-04-11','2019-05-10','0','1'),('4','123','03','2019-05-14','2019-06-13','0','1'),('5','123','17','2019-05-14','2019-06-13','0','0'),('6','125','08','2019-05-14','2019-06-13','0','0'),('7','123','04','2019-05-16','2019-06-15','0','0'),('9','123','16','2019-7-27','2019-8-26','1','1');

/*Table structure for table `fun` */

DROP TABLE IF EXISTS `fun`;

CREATE TABLE `fun` (
  `fid` varchar(25) NOT NULL,
  `mid` varchar(25) DEFAULT NULL,
  `fsum` varchar(25) DEFAULT NULL,
  `fdate` varchar(25) DEFAULT NULL,
  `fcontent` longtext,
  `fpic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `mid` (`mid`),
  CONSTRAINT `fun_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `manager` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fun` */

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `mid` varchar(25) NOT NULL,
  `mpwd` varchar(25) DEFAULT NULL,
  `level` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `manager` */

insert  into `manager`(`mid`,`mpwd`,`level`) values ('111','111','1'),('112','112','2'),('113','113','2'),('114','114','2'),('222','222','2'),('444','444','2'),('555','555','2'),('666','666','2'),('777','777','2'),('999','999','2');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `nid` varchar(25) NOT NULL,
  `mid` varchar(25) DEFAULT NULL,
  `nsum` varchar(25) DEFAULT NULL,
  `ndate` varchar(25) DEFAULT NULL,
  `ncontent` longtext,
  `npic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `mid` (`mid`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `manager` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`nid`,`mid`,`nsum`,`ndate`,`ncontent`,`npic`) values ('1','111','读书月|佳人茸居，沉香亭北，百花槛栏，自是天葩梓里','2019-04-10','经珠不动凝两眉，铅华销尽见无邪。<br/>解释春风无限恨，沈香亭北倚阑干。<br/>佳人葺居，沉香亭北，百花槛栏，自是天葩梓里。<br/>—肌妙肤，弱骨纤形。<br/>回眸一笑百魅生，六宫粉黛无颜色。<br/>风景怡人心舒畅。<br/>人面桃花，情致两饶。<br/>却嫌脂粉污颜色，淡扫蛾眉朝至尊。<br/>千朝回盼，万载流芳。<br/>翩若惊鸿，婉若游龙。<br/>莫道不销魂，帘卷西风，人比黄花瘦。<br/>明眸善睐，靥辅承权，瑰姿艳逸，仪静体闲。<br/>名花倾国两相欢，常得君王带笑看。<br/>面似芙蓉出水，腰如弱柳扶风。<br/>去年今日此门中，人面桃花相映红。<br/>人面不知何处去，桃花依旧笑春风。','D:/'),('2','111','读书月|经珠不动凝两眉，铅华销尽见吴邪','2019-04-17','《浣溪沙》<br/>闲弄筝弦懒系裙。铅华消尽见天真。眼波低处事还新。<br/>怅恨不逢如意酒。寻思难值有情人。可怜虚度琐窗春。<br/>《南歌子》<br/>缥缈云间质，轻盈波上身。瑶林玉树出风尘。不是野花凡草、等闲春。<br/>翠羽双垂珥，乌纱巧制巾。经珠不动两眉颦。须信铅华销尽、见天真。','D:/'),('3','111','读书月|渔得鱼心满意足，樵得樵眼笑眉舒','2019-04-24','《沉醉东风》<br/>渔得鱼心满意足，樵得樵眼笑眉舒。<br/>一个罢了钓竿，一个收了斤斧，林泉下偶然相遇，是两个不识字的渔樵士大夫。<br/>他两个笑加加的谈今论古。','D:/');

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `order_id` varchar(25) NOT NULL,
  `sid` varchar(25) DEFAULT NULL,
  `bid` varchar(25) DEFAULT NULL,
  `endtime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `sid` (`sid`),
  KEY `bid` (`bid`),
  CONSTRAINT `orderlist_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderlist_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderlist` */

insert  into `orderlist`(`order_id`,`sid`,`bid`,`endtime`) values ('1','123','11','2019-6-15'),('2','123','12','2019-6-15');

/*Table structure for table `source` */

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `souid` varchar(25) NOT NULL,
  `mid` varchar(25) DEFAULT NULL,
  `ssum` varchar(200) DEFAULT NULL,
  `saddress` varchar(200) DEFAULT NULL,
  `sformat` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`souid`),
  KEY `mid` (`mid`),
  CONSTRAINT `source_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `manager` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `source` */

insert  into `source`(`souid`,`mid`,`ssum`,`saddress`,`sformat`) values ('2019001','111','算法：时间复杂度、排序、查找、图论','1','jpg'),('2019002','111','公务员面试：自我认知、组织管理、应急应变、综合分析、漫画、情景模拟、演讲、排序','2','txt'),('2019003','111','中国近代史：晚清政府、北洋政府、国民政府','3','doc'),('2019004','111','中国古代战争：城濮之战、官渡之战、赤壁之战、夷陵之战、怛罗斯之战、郾城之战','4','m4a'),('2019005','111','郑奕鑫美食：糖醋里脊、椒盐猪骨、酥香猪舌、麻辣猪鞭、清蒸猪蹄','5','mp4'),('2019006','111','运动与健康：足球、排球、篮球、羽毛球、乒乓球','6','zip'),('2019007','111','数据报表--税务','7','xls'),('201905292000','111','PPT演示稿','PPT演示稿','ppt');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` varchar(25) NOT NULL,
  `spwd` varchar(25) DEFAULT NULL,
  `sname` varchar(25) DEFAULT NULL,
  `age` varchar(25) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `lesson` varchar(25) DEFAULT NULL,
  `department` varchar(25) DEFAULT NULL,
  `permitted` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sid`,`spwd`,`sname`,`age`,`gender`,`lesson`,`department`,`permitted`) values ('123','123','冲冲','21','男','信计153','计科','1'),('124','124','甜甜','24','女','英语112','外语','1'),('125','125','蔡徐珅','20','女','篮球168','体育','1'),('1605','1605','成其伟','21','女','足球152','体育','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
