create database lection_2;
use lection_2;

create table Customers -- создает базу данных
(
	Id int primary key auto_increment,
    Age int,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    Phone varchar(20) not null unique
);

-- Это комментарий
# Это комментарий
/*
Многострочный комментарий
*/

create table Orders
(
		Id int primary key auto_increment,
        CustomerId int,
        CreatedAt date,
        foreign key (CustomerId) references Customers (Id)
);

select * from Customers;

select 3+5;
select 3-5;
select 3*5;

create table Products
(
	Id int auto_increment primary key,
    ProductName varchar(30) not null,
    Manufacturer varchar(20) not null,
    ProductCount int default 0,
    Price decimal
);

insert into Products (ProductName, Manufacturer, ProductCount, Price)
values
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 3, 76000),
('P20 Pro', 'Huawei', 5, 36000);

select * from Products;


update Products
set Price = Price + 3000;

delete from Products
where Manufacturer = 'Huawei';


select * from Products
where not Manufacturer in ("Apple", "Samsung");