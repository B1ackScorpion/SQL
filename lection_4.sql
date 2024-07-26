CREATE DATABASE lection_4;
USE lection_4;

CREATE TABLE customers
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    accountsum DECIMAL
);

CREATE TABLE employeers
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL
);

INSERT INTO customers(firstname, lastname, accountsum)

VALUES
('Tom', 'Smith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adams', 2500),
('Paul', 'Ins', 4200),
('John', 'Smith', 2800),
('Tim', 'Cook', 2800);

INSERT INTO employeers(firstname, lastname)
VALUES
('Homer', 'Simpson'),
('Tom', 'Smith'),
('Mark', 'Adams'),
('Nick', 'Svensson');

SELECT firstname, lastname
FROM customers
UNION SELECT firstname, lastname FROM employeers
ORDER BY firstname DESC;

SELECT firstname, lastname
FROM customers
UNION ALL SELECT firstname, lastname FROM employeers
ORDER BY firstname DESC;

SELECT firstname, lastname, accountsum * 1.1 AS TotalSum
FROM customers WHERE accountsum < 3000
UNION SELECT firstname, lastname, accountsum * 1.3 AS TotalSum
FROM customers WHERE accountsum >= 3000;

CREATE TABLE products
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(30) NOT NULL,
    manufacturer VARCHAR(20) NOT NULL,
    product_count INT DEFAULT 0,
    price DECIMAL NOT NULL
);

CREATE TABLE customers_new
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL
);

CREATE TABLE orders
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    created_at DATE NOT NULL,
    product_count INT DEFAULT 1,
    price DECIMAL NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers_new(id) ON DELETE CASCADE
);

SELECT orders.created_at, orders.product_count, products.product_name
FROM orders
JOIN products ON products.id = orders.product_id;

insert into products (product_name, manufacturer, product_count, price)
values
('iPhone X', 'Apple', 3, 71000),
('iPhone 8', 'Apple', 3, 56000),
('Galaxy S9', 'Samsung', 6, 56000),
('Galaxy S8', 'Samsung', 2, 46000),
('Honor 10', 'Huawei', 3, 28000);

CREATE TABLE test
(
	id INT,
    name VARCHAR(45)
);

INSERT INTO test
VALUES
(1, 'Bob'),
(2, 'Tom'),
(3, 'Tim');

SELECT * FROM test;

CREATE TABLE copy SELECT * FROM test;

SELECT * FROM copy;