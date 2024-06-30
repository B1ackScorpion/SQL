-- 1. Создание БД, snake_case (skill_manager)
CREATE DATABASE IF NOT EXISTS lesson_2; -- Создаем БД lesson_2, если она НЕ СУЩЕСТВУЕТ

-- 2. Подключение к БД
USE lesson_2;

-- 3. Таблица (все столбцы в большой таблице, без НОРМАЛИЗАЦИИ)
DROP TABLE IF EXISTS product;
CREATE TABLE product
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(45), -- Строка динам. длины на 45 символов
	category VARCHAR(100) DEFAULT 'Не определена'
);

-- 4. Просмотр структуры таблицы
DESCRIBE product; -- Посмотреть, какие стобцы лежат в таблице product

-- 5. Произаодим нормализацию
-- Выделяем отдельно таблицы: 'продукт' и 'категория'
-- Удаляем категорию из 'продукт'
ALTER TABLE product -- Модификация таблицы
DROP category;

DESCRIBE product;

-- 6. Создание таблицы 'Категория', все категории переносим туда
CREATE TABLE category
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(45)
);

-- 7. Заполним таблицу с продуктами
INSERT INTO product (title)
VALUES 
	('Intel Core i7-10700K'),
    ('Intel Core i9-11900K'),
    ('Intel Core i9-11600K'),
    ('Ryzen 5 5600x'),
    ('GTX-1060'),
    ('GTX-1070');
    
SELECT * FROM product;

-- 8. Добавим внешний ключ на таблицу 'Категории'
ALTER TABLE product
ADD category_id INT,
ADD FOREIGN KEY(category_id) -- product.category_id - FK
REFERENCES category(id) -- product.category_id ссылается на category.id
ON UPDATE CASCADE ON DELETE CASCADE; -- обновился/удалился перв. ключ - обновился/удалился внешний

-- 9. Заполняем категории
INSERT INTO category (category_name)
VALUES 
	('процессор'),
    ('видеокарта');
    
SELECT * FROM category;

-- 10. Заполняем столбец category_id из таблицы product
UPDATE product
SET category_id = CASE
	WHEN title LIKE 'Intel%' or title LIKE 'Ryzen%'
		THEN 1 -- categoty_id = 1mobile_phones
	ELSE 2 -- categoty_id = 2
END;

SELECT * from product;

SELECT
	p.title,
    p.category_id,
    c.id,
    c.category_name
FROM product p
JOIN category c
ON p.category_id = c.id;

SELECT title,
	CASE
		WHEN title LIKE 'Intel%' or title LIKE 'Ryzen%'
			THEN 'процессор'
		ELSE 'видеокарта'
	END AS 'Результат' -- псевдоним
FROM product;

SELECT title,
	IF(title LIKE 'Intel%' or title LIKE 'Ryzen%',
		'процессор',
		'видеокарта')
	AS Результат -- псевдоним
FROM product;