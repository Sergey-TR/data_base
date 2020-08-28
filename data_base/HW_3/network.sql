create database network;

drop table if exists users;
create table users(
	id serial primary key, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	email varchar(150) unique,
	pass varchar(100),
	name varchar(50),
	surname varchar(50),
	phone varchar(20),
	gender char(1),
	birthday date,
	hometown varchar(100),
	photo_id bigint unsigned,
	created_at datetime default now(),
	key(phone),
	key(name, surname)	
);

drop table if exists settings;
create table settings(
	user_id serial primary key,
	can_see ENUM('all', 'friends_of_friends', 'friends'),
	can_comment ENUM('all', 'friends_of_friends', 'friends', 'nobody'),
	can_message ENUM('all', 'friends_of_friends', 'friends'),
	can_likes ENUM('all', 'friends_of_friends', 'friends', 'nobody'),
	foreign key (user_id) references users(id)
);

drop table if exists messages; -- soobcheiya
create table messages(
	id serial primary key, -- id soobcheniya
	from_user_id bigint unsigned not null, -- ot user iz table users
	to_user_id bigint unsigned not null,  -- to user iz table users, bigint unsigned not null - oznachaet dolzny byt
	body text,
	is_read bool default 0,
	created_at datetime default current_timestamp,
	foreign key (from_user_id) references users(id), -- vneshniy key 
	foreign key (to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests(
	initiator_user_id bigint unsigned not null,
	target_user_id  bigint unsigned not null,
	status ENUM('requested', 'approved', 'unfriended', 'declined') default 'requested', -- enum pozvolyet vybrat odin iz znacheniy, default-po umolchaniu
	requested_at datetime default now(),
	confirmed_at datetime, -- TODO выставлять время на UPDATE
	primary key (initiator_user_id, target_user_id),
	foreign key (initiator_user_id) references users(id),
	foreign key (target_user_id) references users(id),
	index(initiator_user_id),
	index(target_user_id)
);

drop table if exists communities;
create table communities(
	id serial,
	name varchar(255),
	primary key (id),
	index(name)
);

drop table if exists users_communities;
create table users_communities(
	user_id bigint unsigned not null,
	community_id bigint unsigned not null,
	is_admin bool default 0,
	primary key (user_id, community_id),
	foreign key (user_id) references users(id),
	foreign key (community_id) references communities(id)
);

drop table if exists posts;
create table posts(
	id serial primary key,
	user_id bigint unsigned not null,
	body text,
	created_at datetime default current_timestamp,
	updated_at datetime,
	foreign key (user_id) references users(id),
	index(user_id)
);

drop table if exists comments;
create table comments(
	id serial primary key,
	user_id bigint unsigned not null,
	post_id bigint unsigned not null,
	body text, 
	created_at datetime default current_timestamp,
	foreign key (user_id) references users(id),
	foreign key (post_id) references posts(id)
);

drop table if exists photos;
create table photos(
	id serial primary key,
	user_id bigint unsigned not null,
	description varchar(255),
	created_at datetime default current_timestamp,
	foreign key (user_id) references users(id),
	index(user_id)
);

drop table if exists media;
create table media(
	id serial primary key,
	user_id bigint unsigned not null,
	body text,                                    -- zdes navernoe nuzno drugoe
	created_at datetime default current_timestamp,
	updated_at datetime,
	foreign key (user_id) references users(id),
	index(user_id)
);

drop table if exists likes;
create table likes(
	user_id bigint unsigned not null,
	like_id bigint unsigned not null,
	status ENUM('like', 'unlike', 'clear') default 'clear',
	created_at datetime default current_timestamp,
	primary key (user_id, like_id),
	foreign key (user_id) references users(id),
	foreign key (like_id) references users(id),
	foreign key (like_id) references photos(id),
	foreign key (like_id) references posts(id),
	foreign key (like_id) references media(id),
	index(user_id),
	index(like_id)
);