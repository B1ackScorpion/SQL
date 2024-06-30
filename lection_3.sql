create database lection_3;

use lection_3;

DROP TABLE mobile_phones;

create table mobile_phones(
id int auto_increment primary key,
product_name varchar (45) not null,
manufacturer varchar (45) not null,
product_count int UNSIGNED ,
price int UNSIGNED );

insert into mobile_phones (product_name, manufacturer, product_count, price)
values
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('iPhone 7', 'Apple', 5, 32000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 46000),
('Honor 10', 'Huawei', 5, 28000),
('Nokia 8', 'HMD Global', 6, 38000);

Select * FROM mobile_phones
ORDER BY price;

SELECT product_name, product_count * price AS TotalSum
FROM mobile_phones
ORDER BY TotalSum;

SELECT * FROM mobile_phones
LIMIT 3;

SELECT * FROM mobile_phones
LIMIT 2, 3;

SELECT DISTINCT manufacturer FROM mobile_phones;

SELECT DISTINCT manufacturer, product_count FROM mobile_phones;

SELECT manufacturer, COUNT(*) AS ModelCount
FROM mobile_phones
GROUP BY manufacturer;

SELECT AVG(price) AS Average_Price FROM mobile_phones;

SELECT AVG(price) AS Average_Price FROM mobile_phones
WHERE manufacturer='Apple';

SELECT COUNT(*) FROM mobile_phones;

SELECT MIN(price), MAX(price) FROM mobile_phones;

SELECT manufacturer, COUNT(*) AS ModelCounts
FROM mobile_phones
WHERE price * product_count > 80000
GROUP BY manufacturer
HAVING COUNT(*) > 1;

SELECT manufacturer, COUNT(*) AS Models, SUM(product_count) AS Units
FROM mobile_phones
WHERE price * product_count > 80000
GROUP BY manufacturer
HAVING SUM(product_count) > 2
ORDER BY Units DESC;
-- DESC - сортировка по убыванию