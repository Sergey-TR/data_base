

-- ÇÀÄÀÍÈÅ ¹ 1

create table hw_5 (
id serial primary key,
name varchar(255), 
birsday_at date, 
created_at datetime,
updated_at datetime
);

insert into hw_5 (name, birsday_at, created_at, updated_at) values
('Sergey', '1972-06-13', null, null),
('Dmitriy', '1978-04-21', null, null),
('Olga', '1983-01-14', null, null),
('Roman', '1988-10-07', null, null),
('Evgeniya', '1992-08-15', null, null),
('Tatyana', '1999-11-14', null, null);

update hw_5 set created_at = now(), updated_at = now();  

-- ÇÀÄÀÍÈÅ ¹ 2
drop table if exists hw_5;
create table hw_5 (
id serial primary key,
name varchar(255), 
birsday_at date, 
created_at varchar(255),
updated_at varchar(255)
);

insert into hw_5 (name, birsday_at, created_at, updated_at) values
('Sergey', '1972-06-13', '01.08.2020 8:10', '02.08.2020 9:11'),
('Dmitriy', '1978-04-21', '03.08.2020 9:55', '04.08.2020 10:41'),
('Olga', '1983-01-14', '05.08.2020 12:13', '06.08.2020 13:10'),
('Roman', '1988-10-07', '07.08.2020 20:45', '08.08.2020 21:20'),
('Evgeniya', '1992-08-15', '09.08.2020 19:14', '10.08.2020 18:05'),
('Tatyana', '1999-11-14', '11.08.2020 22:23', '12.08.2020 23:22');


update hw_5 set created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');

alter table hw_5 change created_at created_at datetime default current_timestamp;

alter table hw_5 change updated_at updated_at datetime default current_timestamp on update current_timestamp;

-- ÇÀÄÀÍÒÅ ¹4

drop table if exists hw_5;
create table hw_5(
id serial primary key,
storehouse_id int unsigned,
product_id int unsigned,
value int unsigned,
create_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp
);

insert into hw_5 (storehouse_id, product_id, value) values 
(1, 543, 0),
(1, 789, 2500),
(1, 3432, 0),
(1, 826, 30),
(1, 719, 500),
(1, 638, 1);

select * from hw_5 order by if(value > 0, 0, 1), value;

-- ÇÀÄÀÍÈÅ ¹ 4 (ÁÓÄÓ ÈÇÂËÅÊÀÒÜ ÈŞÍÜ È ÀÂÃÓÑÒ)

drop table if exists hw_5;
create table hw_5 (
id serial primary key,
name varchar(255), 
birsday_at date, 
created_at datetime default now(),
updated_at datetime default now()
);

insert into hw_5 (name, birsday_at) values
('Sergey', '1972-06-13'),
('Dmitriy', '1978-04-21'),
('Olga', '1983-01-14'),
('Roman', '1988-10-07'),
('Evgeniya', '1992-08-15'),
('Tatyana', '1999-11-18');

select name from hw_5 where date_format(birsday_at, '%M') in ('august', 'june');

-- ÀÃĞÅÃÀÖÈß ÄÀÍÍÛÕ ÇÀÄÀÍÈÅ ¹ 1

select avg(timestampdiff(year, birsday_at, now())) as age from hw_5;

-- ÀÃĞÅÃÀÖÈß ÄÀÍÍÛÕ ÇÀÄÀÍÈÅ ¹ 2

select date_format(date(concat_ws('-', year(now()), month(birsday_at), day(birsday_at))), '%W') as day,
count(*) as total from hw_5 group by day order by total;

drop table hw_4, hw_5, hw_5_2;
