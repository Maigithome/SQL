CREATE DATABASE homework_sem_1;

USE homework_sem_1;

CREATE TABLE mobile_phones
(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(45) NOT NULL,
    manufacturer VARCHAR(45) NOT NULL,
	product_count INT NOT NULL,
	price INT NOT NULL
);

INSERT mobile_phones (product_name, manufacturer, product_count, price)
VALUES ("iPhone X", "Apple", 3, 76000);

INSERT mobile_phones (product_name, manufacturer, product_count, price)
VALUES ("iPhone 8", "Apple", 2, 51000);

INSERT mobile_phones (product_name, manufacturer, product_count, price)
VALUES ("Galaxy S9", "Samsung", 2, 56000);

INSERT mobile_phones (product_name, manufacturer, product_count, price)
VALUES ("Galaxy S8", "Samsung", 1, 41000);

INSERT mobile_phones (product_name, manufacturer, product_count, price)
VALUES ("P20 Pro", "Huawei", 5, 36000);

SELECT product_name, manufacturer, price
FROM mobile_phones WHERE product_count > 2;

SELECT product_name, manufacturer, product_count, price
FROM mobile_phones WHERE manufacturer = "Samsung";

SELECT product_name, manufacturer, product_count, price
FROM mobile_phones WHERE product_name LIKE "%iPhone%";

SELECT product_name, manufacturer, product_count, price
FROM mobile_phones WHERE manufacturer LIKE "%Samsung%";

SELECT product_name, manufacturer, product_count, price
FROM mobile_phones WHERE product_name LIKE "%8%";
