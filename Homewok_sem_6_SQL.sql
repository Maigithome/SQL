DROP DATABASE IF EXISTS homework_sem_6;
CREATE DATABASE homework_sem_6;
USE homework_sem_6;
-- пользователи
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

INSERT INTO users (id, firstname, lastname, email) VALUES 
(1, 'Reuben', 'Nienow', 'arlo50@example.org'),
(2, 'Frederik', 'Upton', 'terrence.cartwright@example.org'),
(3, 'Unique', 'Windler', 'rupert55@example.org'),
(4, 'Norene', 'West', 'rebekah29@example.net'),
(5, 'Frederick', 'Effertz', 'von.bridget@example.net'),
(6, 'Victoria', 'Medhurst', 'sstehr@example.net'),
(7, 'Austyn', 'Braun', 'itzel.beahan@example.com'),
(8, 'Jaida', 'Kilback', 'johnathan.wisozk@example.com'),
(9, 'Mireya', 'Orn', 'missouri87@example.org'),
(10, 'Jordyn', 'Jerde', 'edach@example.com');


/*1. Создайте таблицу users_old, аналогичную таблице users. Создайте
процедуру, с помощью которой можно переместить любого (одного)
пользователя из таблицы users в таблицу users_old. (использование
транзакции с выбором commit или rollback – обязательно).*/

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(45), 
    lastname VARCHAR(45),  
    email VARCHAR(60)
);

DELIMITER $$
DROP PROCEDURE IF EXISTS relocate;
CREATE PROCEDURE  relocate (IN num1 INT) 
	DETERMINISTIC
BEGIN
INSERT INTO users_old (firstname, lastname, email) 
SELECT firstname, lastname, email 
	FROM users 
	WHERE users.id = num1;
DELETE FROM users 
	WHERE id = num1;
COMMIT;
END$$

DELIMITER ;

CALL relocate(1);

/*2. Создайте хранимую функцию hello(), которая будет возвращать
приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00
функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00
функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 —
"Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/

DELIMITER $$
CREATE FUNCTION hello() 
	RETURNS VARCHAR(25)
	DETERMINISTIC
BEGIN
DECLARE result VARCHAR(25);
SELECT CASE 
	WHEN CURRENT_TIME >= '06:00:00' AND CURRENT_TIME < '12:00:00' THEN 'Доброе утро'
    WHEN CURRENT_TIME >= '12:00:00' AND CURRENT_TIME < '18:00:00' THEN 'Добрый день'
    WHEN CURRENT_TIME >= '18:00:00' AND CURRENT_TIME < '00:00:00' THEN 'Добрый вечер'
	WHEN CURRENT_TIME >= '00:00:00' AND CURRENT_TIME < '06:00:00' THEN 'Доброй ночи'
END INTO result;
RETURN result;
END$$

DELIMITER ;

SELECT hello();
