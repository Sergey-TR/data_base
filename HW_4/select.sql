show create table users;

CREATE TABLE `hw_4` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `name` (`name`,`surname`)
);

insert hw_4 select * from users limit 25; -- ��������� 25 ����� �� ���� users � hw_4

insert hw_4 select * from users limit 30,25; -- ��������� ��� 25 ����� ������� � 31 �� ���� users � hw_4

-- �� ����� ��������� ��������, ���� ��������� � ������� utf8

-- INSERT INTO hw_4 (email,pass,name,surname,phone,gender,birthday,hometown,photo_id,created_at) VALUES 
-- ('qwe@asdf.qw','fdkjgsdflskdjfgsdfg142356214','������','�������','123123123','m','1983-03-21','��������',395,'2020-08-31 22:55:58.0');


-- ����� �� ������ �������� �������, 'name', 'surname', 'hometown' ��� �����������, � ��� �������?

INSERT INTO hw_4 (email,pass,name,surname,phone,gender,birthday,hometown,photo_id,created_at) VALUES 
('qwe@asdf.qw','fdkjgsdflskdjfgsdfg142356214','Sergey','Sergeev','123123123','m','1983-03-21','Odintsovo',395,'2020-08-31 22:55:58.0');

select name, surname, email from hw_4; -- ������� ������� 

select name, surname, email from hw_4 limit 10; -- ������� ������ 10 ������

select name, surname, email from hw_4 limit 15,5; -- ������� 15 ����� ������� ����� 5 

select concat(name,' ',surname) as client, email from hw_4; -- ��������� ������� name surname

select name, surname, email from hw_4 where name = 'Axel'; -- �����

select * from hw_4 where id > 10 and gender = 'f';

select * from hw_4 where id > 10 or gender = 'f';

select name, surname from hw_4 where name like 'H%';

select name, surname from users where name like 'A%';

select name from hw_4;

select name, gender from hw_4 where gender = 'm';

select name, surname, birthday from hw_4 where birthday like '%19%';

select distinct name from hw_4;

select hometown from hw_4 order by hometown;

select count(*) from hw_4 where gender = 'm';

-- select is null �� �����, �.� � ���� � ������� ��� ����������

select count(birthday) from hw_4;

select gender, count(*) from hw_4 group by gender;

delete from hw_4 where id > 10;

insert hw_4 (*) select * from users where id > 80; -- �.�. (*) �� ��������, ���� ��� ������?

insert hw_4 (email,pass,name,surname,phone,gender,birthday,hometown,photo_id)
select email,pass,name,surname,phone,gender,birthday,hometown,photo_id from users where id > 80;

truncate table hw_4; 

truncate table users; -- � ��� ��� �� ��������, ��� �� �������� ������� � ������� ���� ������ �� ������� �����
