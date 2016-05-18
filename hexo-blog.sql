/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.22 : Database - hexo-blog
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hexo-blog` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `hexo-blog`;

/*Table structure for table `t_article` */

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `mdSource` text COLLATE utf8_unicode_ci,
  `readCount` int(11) NOT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_article` */

insert  into `t_article`(`id`,`content`,`mdSource`,`readCount`,`summary`,`time`,`title`,`url`) values (1,'###为什么要做这个博客网站\n从我接触互联网到现在，逛过各种个人博客网站，有做媒体资讯的，有做技术编程的，还有做音乐分享的...看到这些，我产生了一个念头：有一天，我也能拥有一个个人的博客网站，跟大家分享我感兴趣的东西。后来到实验室学习了Java、JQuery和Linux后，这种想法就愈发的强烈，于是我尝试做起了这个博客网站。\n###停下来回头看看\n学习了大概一年半的Java Web开发，先开始学习Java，入过很多的坑，接着学习JS/JQuery，学得似懂非懂的，后来和实验室的同学一起写了一个类似淘宝网站的小型demo，将各种学过的知识整合一下，期间遇到的bug让人十分蛋疼，不过收获颇丰。项目结束后，我对Python和Linux产生的兴趣，于是又学习了Python和Linux。渐渐地，在玩乐和学习当中，我获得了许多宝贵的东西。\n###继续学习\n万事开头难，有了第一篇博文，就会有第二篇，第三篇，第四篇...为了写这篇博文，我还专门熟悉了一边markdown的语法，感觉还不错，既能完成自己的目标，又能沉淀自己所学的知识。看到过这样一句话：\n> 我一直保持着初学者的心态！\n\n很喜欢这句话，不管自己的获得过多少成就，都要保持初学者的心态，学习是永无止尽的。也许我们没有必要抬头看着高出的那些大牛，只需要看好眼前，一步一步的向前迈进，说不定哪天停下脚步再回头看的时候，发现自己也已经有那么一群崇拜者了。\n','#category:随笔生活\n#tags:随笔 生活\n#summary:\n###为什么要做这个博客网站\n从我接触互联网到现在，逛过各种个人博客网站，有做媒体资讯的，有做技术编程的，还有做音乐分享的...看到这些，我产生了一个念头：有一天，我也能拥有一个个人的博客网站，跟大家分享我感兴趣的东西。后来到实验室学习了Java、JQuery和Linux后，这种想法就愈发的强烈，于是我尝试做起了这个博客网站。\n###停下来回头看看\n学习了大概一年半的Java Web开发，先开始学习Java，入过很多的坑，接着学习JS/JQuery，学得似懂非懂的，后来和实验室的同学一起写了一个类似淘宝网站的小型demo，将各种学过的知识整合一下，期间遇到的bug让人十分蛋疼，不过收获颇丰。项目结束后，我对Python和Linux产生的兴趣，于是又学习了Python和Linux。渐渐地，在玩乐和学习当中，我获得了许多宝贵的东西。\n###继续学习\n万事开头难，有了第一篇博文，就会有第二篇，第三篇，第四篇...为了写这篇博文，我还专门熟悉了一边markdown的语法，感觉还不错，既能完成自己的目标，又能沉淀自己所学的知识。看到过这样一句话：\n> 我一直保持着初学者的心态！\n\n很喜欢这句话，不管自己的获得过多少成就，都要保持初学者的心态，学习是永无止尽的。也许我们没有必要抬头看着高出的那些大牛，只需要看好眼前，一步一步的向前迈进，说不定哪天停下脚步再回头看的时候，发现自己也已经有那么一群崇拜者了。\n#more:\n',0,'###为什么要做这个博客网站\n从我接触互联网到现在，逛过各种个人博客网站，有做媒体资讯的，有做技术编程的，还有做音乐分享的...看到这些，我产生了一个念头：有一天，我也能拥有一个个人的博客网站，跟大家分享我感兴趣的东西。后来到实验室学习了Java、JQuery和Linux后，这种想法就愈发的强烈，于是我尝试做起了这个博客网站。\n###停下来回头看看\n学习了大概一年半的Java Web开发，先开始学习Java，入过很多的坑，接着学习JS/JQuery，学得似懂非懂的，后来和实验室的同学一起写了一个类似淘宝网站的小型demo，将各种学过的知识整合一下，期间遇到的bug让人十分蛋疼，不过收获颇丰。项目结束后，我对Python和Linux产生的兴趣，于是又学习了Python和Linux。渐渐地，在玩乐和学习当中，我获得了许多宝贵的东西。\n###继续学习\n万事开头难，有了第一篇博文，就会有第二篇，第三篇，第四篇...为了写这篇博文，我还专门熟悉了一边markdown的语法，感觉还不错，既能完成自己的目标，又能沉淀自己所学的知识。看到过这样一句话：\n> 我一直保持着初学者的心态！\n\n很喜欢这句话，不管自己的获得过多少成就，都要保持初学者的心态，学习是永无止尽的。也许我们没有必要抬头看着高出的那些大牛，只需要看好眼前，一步一步的向前迈进，说不定哪天停下脚步再回头看的时候，发现自己也已经有那么一群崇拜者了。','2016-05-18','第一篇博文','d657671795944a3f92e13fd92722d927');

/*Table structure for table `t_article_category` */

DROP TABLE IF EXISTS `t_article_category`;

CREATE TABLE `t_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_article_category` */

insert  into `t_article_category`(`id`,`aid`,`cid`) values (1,1,1);

/*Table structure for table `t_article_tag` */

DROP TABLE IF EXISTS `t_article_tag`;

CREATE TABLE `t_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_article_tag` */

insert  into `t_article_tag`(`id`,`aid`,`tid`) values (1,1,1),(2,1,2);

/*Table structure for table `t_category` */

DROP TABLE IF EXISTS `t_category`;

CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_category` */

insert  into `t_category`(`id`,`name`) values (1,'随笔生活');

/*Table structure for table `t_tag` */

DROP TABLE IF EXISTS `t_tag`;

CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fontSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_tag` */

insert  into `t_tag`(`id`,`color`,`fontSize`,`name`) values (1,NULL,NULL,'随笔'),(2,NULL,NULL,'生活');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
