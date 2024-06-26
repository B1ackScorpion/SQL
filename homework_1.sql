create database homework_1;

use homework_1;

create table mobile_phones(
id int auto_increment primary key,
product_name varchar (45) not null,
manufacturer varchar (45) not null,
product_count int UNSIGNED ,
price int UNSIGNED );

insert into mobile_phones (product_name, manufacturer, product_count, price)
values
('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei	', 341, 36000);