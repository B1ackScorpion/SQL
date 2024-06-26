-- CREATE DATABASE lesson_1;   -- Создаю базу данных
USE lesson_1; -- Обращающь к бд
CREATE TABLE students ( -- Создаю таблицу
ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- Даю первичный ключ с автоматической нумерацией
Name VARCHAR (45),
Course_name VARCHAR (45), -- Указали поле + тип данных формат текст
DR DATE NOT NULL,
Email VARCHAR (55),
Phone_number BIGINT NOT NULL);

INSERT INTO students (Name, Course_name, DR, Email, Phone_number)
VALUES
-- ('Андрей', 'SQL', '1976-11-20', 'blabla@gmail.com', 89162759439),
('Алекс', 'info', '2015-09-13', 'tetet@gmail.com', 89139639439),
('Сергей', 'Math', '1974-10-14', 'adasd@gmail.com', 88262639439),
('Саша', 'Psiho', '1988-05-29', 'dfda@gmail.com', 82541339439),
('Гоша', 'Data', '1966-03-15', 'wesf@gmail.com', 89162639439);

CREATE TABLE teachers (
ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
Name VARCHAR (45),
Course_name VARCHAR (45),
Post VARCHAR (45));

INSERT INTO teachers (Name, Course_name, Post)
VALUES
('Martin', 'SQL', 'Doctor'),
('Stefan', 'info', 'Proffesor'),
('Alex', 'Math', 'Dekan'),
('Kelvin', 'Psiho', 'Docent'),
('Daniel', 'Data', 'Laborant');

CREATE TABLE course (
ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
Course_name VARCHAR (45),
Student_name VARCHAR (45),
Teacher_name VARCHAR (45));

INSERT INTO course (Course_name, Student_name, Teacher_name)
VALUES
('SQL', 'Андрей', 'Martin'),
('info', 'Алекс', 'Stefan'),
('Math', 'Сергей', 'Alex'),
('Psiho', 'Саша', 'Kelvin'),
('Data', 'Гоша', 'Daniel');

-- 1.Получить список с информацией обо всех студентах
SELECT * FROM students;

-- 2. Получить список всех студентов с именем “Алекс”(или любого существующего студента)
SELECT * FROM students WHERE Name = 'Алекс';

-- 3. Вывести имя и название курса из таблички "Студент"
SELECT Name, Course_name FROM students;

-- 4*. Выбрать студентов, фамилии которых начинаются с буквы «А». */
SELECT * FROM students WHERE Name LIKE 'А%';

SELECT * FROM students WHERE Course_name = 'SQL';