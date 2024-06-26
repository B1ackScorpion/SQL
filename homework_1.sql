create database homework_1;

use homework_1;

create table mobile_phones(
id int auto_increment primary key,
product_name varchar (45) not null,
manufacturer varchar (45) not null,
product_count int UNSIGNED ,
price int UNSIGNED );

/* Для PostgreSQL
CREATE TABLE mobile_phones (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(45) NOT NULL,
    manufacturer VARCHAR(45) NOT NULL,
    product_count INT CHECK (product_count >= 0),
    price INT CHECK (price >= 0)
);
*/

insert into mobile_phones (product_name, manufacturer, product_count, price)
values
('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei	', 341, 36000);