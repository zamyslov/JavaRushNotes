DROP DATABASE IF EXISTS test;

CREATE DATABASE test;

USE test;

CREATE TABLE `notes`
(
	`id` INT(8) NOT NULL AUTO_INCREMENT,
	`text` VARCHAR(255) NOT NULL DEFAULT '0',
	`isDone` BIT(1) NOT NULL DEFAULT b'0',
	`createdDate` DATE NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci';
INSERT INTO `notes` (`id`,`text`,`isDone`,`createdDate`) VALUES (1,"Забрать обувь",b'0',"2017-10-08"),
(2,"Приготовить еду",b'0',"2017-10-08"),
(3,"Сходить в кино",b'0',"2017-10-07"),
(4,"Купить еду",b'0',"2017-10-07"),
(5,"Купить еду",b'0',"2017-10-07"),
(6,"Купить еду",b'0',"2017-10-07"),
(7,"Купить еду",b'0',"2017-10-07"),
(8,"Купить еду",b'0',"2017-10-07"),
(9,"Приготовить еду",b'0',"2017-10-08"),
(10,"Купить еду",b'0',"2017-10-07"),
(11,"Купить еду",b'0',"2017-10-07"),
(12,"Купить еду",b'0',"2017-10-07"),
(13,"Приготовить еду",b'0',"2017-10-08"),
(14,"Купить еду",b'1',"2017-09-09"),
(15,"Купить еду",b'0',"2017-10-07"),
(16,"Купить еду",b'0',"2017-09-25"),
(17,"Купить еду",b'0',"2017-10-07"),
(18,"Купить еду",b'1',"2017-10-10"),
(19,"Купить еду",b'0',"2017-10-07"),
(20,"Купить еду",b'0',"2017-10-12"),
(21,"Купить еду",b'0',"2017-10-07"),
(22,"Купить еду",b'0',"2017-10-07"),
(23,"Купить еду",b'0',"2017-10-14"),
(24,"Купить еду",b'0',"2017-10-07"),
(25,"Купить еду",b'0',"2017-10-07");
