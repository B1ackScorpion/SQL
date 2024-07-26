CREATE DATABASE IF NOT EXISTS lesson_3;
USE lesson_3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	-- имя, тип, ограничение
    -- DECIMAL(x,z) x - общее кол-во знаков, z - кол-во знаков после запятой
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45) NOT NULL,
    seniority INT,
    salary DECIMAL(8, 2),
    age INT
);

TRUNCATE staff; -- Очистка таблицы от данных  
INSERT staff (first_name, last_name, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 70000, 60),
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT *
FROM staff;

-- Топ 5 самых высокооплачеваемых сотрудников
SELECT id, salary, CONCAT(first_name,' ', last_name) AS fullname
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Сортировка по 2 полям
SELECT
	id,
    salary,
    first_name,
    last_name
FROM staff
ORDER BY last_name DESC, first_name DESC, salary DESC;

-- Группировка - group by, сортировка - order by
-- Для каждой занимаемой должности найти:
-- Мин и макс ЗП, среднюю ЗП, разницу между макс и мин ЗП сотрудников 
-- Количество сотрудников

SELECT
	post,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    ROUND(AVG(salary), 2) AS avg_salary,
    MAX(salary) - MIN(salary) AS diff,
    COUNT(salary) AS count_staff
FROM staff
WHERE post != 'Уборщик'-- Работаем со всем, кроме агрегатных функций 
GROUP BY post
HAVING avg_salary > 25000;

-- DISTINCT - уникальные значения