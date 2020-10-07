CREATE DATABASE hospital;

USE hostpital;

set sql_mode=(select replace(@@sql_mode,'NO_ZERO_IN_DATE,NO_ZERO_DATE',''));

CREATE TABLE `doctor` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `dep` varchar(45) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authorize` varchar(45) default 'Pending',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Outpatient',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `bill` (
   `id` int(10) unsigned NOT NULL auto_increment,
   `puname` varchar(45) NOT NULL,
   `pname` varchar(45) NOT NULL,
   `duname` varchar(45) NOT NULL,
   `dname` varchar(45) NOT NULL,
   `dep` varchar(45) NOT NULL,
   `description` varchar(500) NOT NULL,
   `bill` double(10,2) DEFAULT 0,
   `status` varchar(45) DEFAULT 'Not Paid',
   `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
   `pay_time` datetime NULL DEFAULT '0000-00-00 00:00:00',
   PRIMARY KEY  (`id`)
);

