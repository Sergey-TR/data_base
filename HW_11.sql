
-- 1. �������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, 
-- catalogs � products � ������� logs ���������� ����� � ���� �������� ������, �������� �������,
-- ������������� ���������� ����� � ���������� ���� name.


DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	str_id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;


-- ������ �������� ��� ������

DROP TRIGGER IF EXISTS watchlog_users;
delimiter //
CREATE TRIGGER watchlog_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;


DROP TRIGGER IF EXISTS watchlog_catalogs;
delimiter //
CREATE TRIGGER watchlog_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;


drop trigger if exists watchlog_products;
delimiter //
CREATE TRIGGER watchlog_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

-- ��������� ������

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('������', '1900-01-01');

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('�����', '1901-01-01'),
		('�������', '2000-01-01'),
		('�������', '1989-01-01'),
		('�������', '2010-00-01');

SELECT * FROM users;
SELECT * FROM logs;


SELECT * FROM catalogs;
SELECT * FROM logs;

INSERT INTO catalogs (name)
VALUES ('�����������'),
		('�������'),
		('����������');

SELECT * FROM catalogs;
SELECT * FROM logs;


SELECT * FROM products;
SELECT * FROM logs;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('ZeepDeep', '�����������', 2000.00, 13),
		('Samsung S24F354FHI', '�������', 6990.00, 14),
		('������', '������ ��� ����', 150.00, 15);

SELECT * FROM products;
SELECT * FROM logs;



-- 2. (�� �������) �������� SQL-������, ������� �������� � ������� users ������� �������.

-- ��� �������� ������� ������ �������� ������� test_users

DROP TABLE IF EXISTS test_users; 
CREATE TABLE test_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP PROCEDURE IF EXISTS insert_into_users ;
delimiter //
CREATE PROCEDURE insert_into_users ()
BEGIN
	DECLARE i INT DEFAULT 100;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END //
delimiter ;


SELECT * FROM test_users;

CALL insert_into_users();

SELECT * FROM test_users LIMIT 10;