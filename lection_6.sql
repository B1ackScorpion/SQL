DROP DATABASE IF EXISTS lection_6;
CREATE DATABASE lection_6;

USE lection_6;

-- Удаление таблиц
CREATE TABLE demo2 (dt date, cnt int);

DROP TABLE IF EXISTS demo2;

/* Для MSSQL
IF OBJECT_ID('demo2') IS NOT NULL
BEGIN
DROP TABLE demo2
END;
*/


-- Удаление записей
DELETE FROM demo2 WHERE id = 2 LIMIT 1;

DELETE FROM demo2 WHERE id >= 5;

DELETE FROM demo2;


-- TRUNCATE vs DELETE
TRUNCATE TABLE demo2;


-- Изменение данных
UPDATE demo2 SET name = Мышь WHERE id = 3 LIMIT 1;

UPDATE demo2 SET name = Мышь, food = Сыр WHERE id = 3 LIMIT 1;


-- Создание таблиц
CREATE TABLE table_name (
column_name1 data_type(size),
column_name2 data_type(size),
column_name3 data_type(size),
...);

CREATE TABLE Planets (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
PlanetName VARCHAR(10) NOT NULL,
Radius FLOAT,
SunSeason FLOAT,
OpenYear INT,
HavingRings bit,
Opener VARCHAR(30)
);


-- Создание представлений
CREATE VIEW view_name AS
SELECT column_1, column_2, ...
FROM table_name
WHERE comdition;


-- Создание процедур
CREATE PROCEDURE proc_name (parametr) AS
	BEGIN
		операторы
	END;

CREATE PROCEDURE S_S @TN VARCHAR(50), @N INT = 10 -- simple select
AS
BEGIN
	DECLARE @query VARCHAR(1000)
SET @query = 'SELECT TOP(' + CAST(@N AS VARCHAR(10) + ') * FROM' + @TN
EXEC(@query)
END;

S_S @TN = Planets, @N = 2;