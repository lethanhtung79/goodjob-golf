
CREATE TABLE `TB_SMS_LOG` (
  `idx` INT NOT NULL AUTO_INCREMENT,
  `mem_id` VARBINARY(100),
  `message` VARBINARY(255) NOT NULL,
  `rtel` VARBINARY(13) NOT NULL,
  `stel` VARBINARY(13) NOT NULL,
  `rdate` VARBINARY(10),
  `rtime` VARBINARY(10),
  `reg_dt` datetime ,
  PRIMARY KEY(idx)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;