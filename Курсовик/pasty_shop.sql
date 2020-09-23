create database pasty_shop character set utf8 collate utf8_general_ci;

drop table if exists type_product;
create table type_product(
id serial primary key,
type_prod varchar(168)
);

insert into type_product values
(default, 'Конфеты шоколадные'),
(default, 'Конфеты желейные глянцованные'),
(default, 'Конфеты желейные глазированные'),
(default, 'Конфеты желейные взбивные'),
(default, 'Жевательный мармелад');

drop table if exists catalog;
create table catalog(
id serial primary key,
id_type_prod bigint unsigned not null,
id_name_prod bigint unsigned not null,
id_form_prod bigint unsigned not null,
id_taste_prod bigint unsigned not null,
id_weight_prod bigint unsigned not null,
id_base_unit bigint unsigned not null,
id_pack_prod bigint unsigned not null,
price decimal(10,2),
key (id),
key (id_name_prod),
foreign key (id_type_prod) references type_product(id)
);

insert into `catalog` (id_type_prod, id_name_prod, id_form_prod, id_taste_prod, id_weight_prod, id_base_unit, id_pack_prod, price)
values
(1, 1, 1, 1, 1, 2, 1, 210.2), (1, 1, 1, 2, 1, 2, 1, 210.2), (1, 1, 3, 1, 1, 2, 1, 220.5), (1, 1, 3, 2, 1, 2, 1, 220.5),
(1, 2, 2, 3, 1, 2, 1, 215.3), (1, 2, 2, 4, 1, 2, 1, 215.3), (1, 2, 2, 5, 1, 2, 1, 215.3), (1, 3, 1, 12, 1, 2, 1, 225.4),
(1, 3, 1, 13, 1, 2, 1, 225.4), (1, 4, 2, 6, 1, 2, 1, 230.5), (1, 4, 2, 10, 1, 2, 1, 230.5), (1, 5, 3, 11, 2, 1, 2, 125.4),
(1, 6, 3, 11, 2, 1, 2, 125.4), (1, 7, 3, 11, 3, 1, 2, 130.2), (1, 8, 3, 11, 3, 1, 2, 130.2), (1, 9, 3, 11, 3, 1, 2, 128.5),
(1, 10, 3, 11, 3, 1, 2, 128.5), (1, 11, 2, 7, 4, 1, 2, 80);

insert into `catalog` (id_type_prod, id_name_prod, id_form_prod, id_taste_prod, id_weight_prod, id_base_unit, id_pack_prod, price)
values
(1, 11, 2, 8, 4, 1, 2, 80), (1, 11, 2, 9, 4, 1, 2, 80), (1, 12, 2, 1, 3, 1, 2, 110), (1, 12, 2, 8, 3, 1, 2, 110), (1, 11, 2, 3, 1, 2, 1, 240.3),
(1, 11, 2, 8, 1, 2, 1, 240.3), (3, 13, 4, 3, 1, 2, 1, 125.4), (3, 13, 4, 6, 1, 2, 1, 125.4), (3, 13, 4, 4, 1, 2, 1, 125.4),
(2, 13, 4, 3, 1, 2, 1, 120.5), (2, 13, 4, 6, 1, 2, 1, 120.5), (2, 13, 4, 4, 1, 2, 1, 120.5), (3, 14, 4, 3, 4, 1, 2, 60.8),
(3, 14, 4, 4, 4, 1, 2, 60.8), (4, 16, 5, 11, 5, 1, 2, 152.6), (5, 15, 6, 11, 1, 1, 2, 135);

drop table if exists name_product;
create table name_product(
id_name serial primary key,
name varchar(255)
);

insert into name_product (name) values
('Себе любимой'),
('Декор'),
('Модерн'),
('Классик'),
('Красная роза'),
('Тюльпан'),
('Бабочка синяя'),
('Бабочка зеленая'),
('Ангел в розах'),
('Ангел в саду'),
('Трюфель'),
('Трюфель французский'),
('Желейная долька'),
('Сергиево-Посадские'),
('Гусеницы'),
('Десерт лаб');

drop table if exists form_product;
create table form_product(
id_form serial primary key,
form varchar(255)
);

insert into form_product (form) values
('шар'),
('купол'),
('пирамида'),
('долька'),
('цветочки'),
('червяки');

drop table if exists taste_product;
create table taste_product(
id_taste serial primary key,
taste varchar(255)
);

insert into taste_product (taste) values
('сливки'),
('трюфель классический'),
('апельсин'),
('клубника'),
('киви'),
('дюшес'),
('латте'),
('дробленый орех'),
('клубника со сливками'),
('малина'),
('ассорти'),
('кофе-крем'),
('карамель');

drop table if exists weight_product;
create table weight_product(
id_weight serial primary key,
weight int
);

insert into weight_product (weight) values
(1000), (240), (210), (150), (900), (1300);

drop table if exists unit_product;
create table unit_product(
id_unit serial primary key,
unit varchar(255)
);

insert into unit_product (unit) values
('штука'), ('грамм');

drop table if exists pack_product;
create table pack_product(
id_pack serial primary key,
pack varchar(255)
);

insert into pack_product (pack) values
('пакет'), ('коробка');

drop table if exists users;
create table users(
id serial primary key,
email varchar(150) unique,
pass varchar(100),
name varchar(50) not null,
surname varchar(50),
phone varchar(20) not null,
birthday date,
hometown varchar(100) not null,
created_at datetime default now(),
key(phone),
key(name, surname)	
);

insert into users (email, pass, name, surname, phone, birthday, hometown, created_at) values
('qwe@asdf.qw','fdkjgsdflskdjfgsdfg142356214','Сергей','Сергеев','123123123', '1983-03-21', 'Одинцово', '2020-08-31 22:55:58.0')
,('ejaslem1@typepad.com','c2ca3c61fe024e49a9c758a109611c65aac31a15','Вера','Клюквина','804-926-3977', '1987-03-15','Сатка', '2020-08-31 22:55:58.0')
,('cattack2@unc.edu','5f91ea663688cc873be65a6cc107f07da84664ae','Ирина','Кийко','213-952-7247', '1986-05-22','Зубцов', '2020-08-31 22:55:58.0')
,('scasotti3@usgs.gov','f93c320ee2275544eb1b42d8278133c343fa5030','Виктория','Водопьянова','418-701-1526', '1984-04-06','Костерево','2020-08-31 22:55:58.0')
,('segginton4@cam.ac.uk','e6ab5f555555fb26c7c60ddd23c8118307804330','Дмитрий','Тимашов','451-335-9033', '1984-06-19','Горячий Ключ', '2020-08-31 22:55:58.0')
,('aswaddle5@altervista.org','b25e49362b83833eece7d225717f2e285213bf25','Владислав','Авраменко','187-446-2339', '1987-07-07','Павловское', '2020-08-31 22:55:58.0')
,('fleahey6@ftc.gov','07521436ef4b4ad464ed04cdceb99f422bbbd9c5','Алексей','Величко','295-179-8252', '1984-11-27','Кедровый', '2020-08-31 22:55:58.0')
,('rcasley7@exblog.jp','5aac7b105729d4ad431db6a4e73604ecec132fa8','Артем','Филипцов','323-732-2265', '1984-08-04','Можайск', '2020-08-31 22:55:58.0')
,('rlantry8@pen.io','ba6c51c3064c20f9de84d4ed69733d9dd408e504','Елена','Колдаева','373-114-4657', '1989-08-07','Усолье-Сибирское', '2020-08-31 22:55:58.0')
,('egoatcher9@behance.net','16f4e6ac1aedd2d9707b56d767f452f3246e67f7','Андрей','Антипов','877-485-8608', '1984-09-04','Яхрома', '2020-08-31 22:55:58.0')
;

insert into users (email, pass, name, surname, phone, birthday, hometown, created_at) values
('dcolquita@ucla.edu','1487c1cf7c24df739fc97460a2c791a2432df062','Евгений','Грачев','974-490-6651','1987-11-26','Боровое','2020-08-31 22:55:58.0')
,('rthomazinb@ox.ac.uk','32afa0b02c8399d1960509c3fbd4cc75ab4dcce2','Дарья','Попова','815-155-7164','1984-11-28','Новокуйбышевск','2020-08-31 22:55:58.0')
,('gambridgec@sakura.ne.jp','afd3e457d3b9f6f880623163ea8f72889777a58b','Ирина','Гончарова','290-726-6453','1984-08-24','Навашино','2020-08-31 22:55:58.0')
,('mantosikd@tinypic.com','9154186410a62369bdf4fd2bd632ca3511b270a7','Марина','Закусилова','594-909-1863','1981-04-16','Старый Оскол','2020-08-31 22:55:58.0')
,('rtabere@admin.ch','9bc443a6e52541784d52b69acc39343526886b11','Елена','Нагина','696-647-1579','1988-08-10','Вытегра','2020-08-31 22:55:58.0')
,('ckendellf@bloglines.com','229aedb0a417bccab3ee0cbd89a4b1afaa080c51','Валерия','Платошкина','107-890-2682','1980-01-07','Котлас','2020-08-31 22:55:58.0')
,('amckeandg@behance.net','584b9241b06cfe87131bfdba7b53e877ec3bd940','Станислав','Светляков','964-292-2963','1984-05-19','Островной','2020-08-31 22:55:58.0')
,('csantryh@mit.edu','129797dcb95127ce0541faa8d91d8f1969da0f45','Ирина','Черникова','311-847-3791','1982-10-20','Опочка','2020-08-31 22:55:58.0')
,('dharcasei@dailymotion.com','ea63b484704b7a8316da4025260b864453adb948','Алиса','Зайцева','456-819-8247','1989-04-03','Магадан','2020-08-31 22:55:58.0')
,('drouthamj@senate.gov','9b1f31426e9caf75d46b9b4a7c58c1941daa33f0','Ольга','Застрожнова','925-942-8337','1983-05-07','Сосенский','2020-08-31 22:55:58.0')
,('eshetliff0@virginia.edu','9d0f9f7cdbe467af211a5d5bc91e2e16da891521','Ирина','Сушкова','944-287-5153','1984-12-19','Константиновск','2020-08-31 22:55:58.0')
,('ldeguara1@bing.com','3866567f83079af02f517913d98a34e8a5514111','Анна','Бавыкина','677-482-0315','1982-04-19','Уфа','2020-08-31 22:55:58.0')
,('cdominick2@cnn.com','37cda6f77b46bb92ebfea535bdd89d6a145ee28a','Марина','Киреева','405-608-8011','1984-04-26','Лысково','2020-08-31 22:55:58.0')
,('dbydaway3@hugedomains.com','340287d956987900a051e920136b2c1c17351321','Елена','Михайлова','215-916-8663','1980-02-08','Шуя','2020-08-31 22:55:58.0')
,('hpullin4@state.gov','d4a54226f86124d38f463d60c3658a32be191e0e','Любовь','Чиликова','261-961-7364','1983-11-22','Агидель','2020-08-31 22:55:58.0')
,('lhulme5@tamu.edu','4cbd30f625fd3440804baf6f509246e8ff81d46b','Елена','Селиванова','131-548-9478','1982-03-27','Жуковка','2020-08-31 22:55:58.0')
,('ngrzesiak6@blogspot.com','89d65795895ed1c2f48114474ef37c92e1796dee','Сергей','Лисовой','125-346-2931','1988-08-03','Урюпинск','2020-08-31 22:55:58.0')
,('ewathall7@slate.com','011af674acb2a19440bb6a013d33dd9a231d53a4','Михаил','Назарьев','869-603-9405','1984-06-06','Богданович','2020-08-31 22:55:58.0')
,('epindar8@oracle.com','e3e589b0cc498fb982ed1cbae5d20d3766e97b36','Алексей','Метлицкий','298-133-9919','1980-04-24','Шахты','2020-08-31 22:55:58.0')
,('jdelacoste9@chicagotribune.com','2def62b6a77064a15b157222f1b43bb538a0293e','Эльвира','Белоусова','405-102-3201','1987-12-19','Краснознаменск','2020-08-31 22:55:58.0')
;

drop table if exists orders;
create table orders(
id serial primary key,
user_name varchar(50) not null,
user_phone varchar(20) not null,
user_email varchar(150) not null,
create_at datetime default now(),
update_at datetime
);

alter table orders add user_id bigint unsigned not null;

insert into orders (user_name, user_phone, user_email, create_at, update_at) values
('Алексей','295-179-8252','fleahey6@ftc.gov',now(), '2020-08-31 22:55:58.0')
,('Артем','323-732-2265','rcasley7@exblog.jp',now(),'2020-08-31 22:55:58.0')
,('Елена','373-114-4657','rlantry8@pen.io',now(),'2020-08-31 22:55:58.0')
,('Андрей','877-485-8608','egoatcher9@behance.net',now(),'2020-08-31 22:55:58.0')
;

drop table if exists order_prod;
create table order_prod(
order_id bigint unsigned NOT NULL,
catalog_id bigint unsigned NOT NULL,
total bigint NOT NULL,
PRIMARY KEY (order_id, catalog_id),
FOREIGN KEY (order_id) REFERENCES orders (id),
FOREIGN KEY (catalog_id) REFERENCES `catalog` (id)
);

insert into order_prod (order_id, catalog_id, total) values
(1, 3, 1), (1, 5, 2), (3, 2, 3), (3, 5, 1), (2, 7, 4);
