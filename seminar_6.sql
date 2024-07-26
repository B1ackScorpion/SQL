USE lesson_3;

SELECT * FROM staff;

-- Процедуры - функция , которая не вернет, НЕТ RETURN-а
-- Функция - то, что вернет значение через RETURN

-- Создадим процедуру, которая будет выводить статус сотрудника по его ЗП 
-- От 0 до 49 999 вкл-но, то это "Средняя ЗП"
-- от 50 000 до 69 999 вкл-но, то это "ЗП выше средней"
-- > 70 000 , то "Высокая ЗП" 
-- Номер сотрудника (id), статус сотрудника сохраняем в переменную

DROP PROCEDURE IF EXISTS get_status;
DELIMITER $$ -- -- Начало процедуры для сервера, "$$" - символ-разд, как ";"
CREATE PROCEDURE get_status
(
	IN staff_number INT, -- id сотрудника, параметр, доступный только для чт.
    OUT staff_status VARCHAR(45)
)
BEGIN
	DECLARE staff_salary DOUBLE; -- NULL, пустая переменная
    
    SELECT salary INTO staff_salary -- ЗП будет 5 сотрудника 
    FROM staff
    WHERE id = staff_number; -- id = 5
    
    IF staff_salary BETWEEN 0 AND 49999
		THEN SET staff_status = 'Средняя ЗП';
	ELSEIF staff_salary BETWEEN 50000 AND 69999
		THEN SET staff_status = 'ЗП выше средней';
	ELSEIF staff_salary >= 70000
		THEN SET staff_status = 'Высокая ЗП';
	ELSE -- ЗП меньше 0р.
		SET staff_status = 'Error';
	END IF;
END ;

-- Вызов процедуры
CALL get_status(4, @res); -- NULL
SELECT @res;

-- Циклы 
-- Напечатаем числа от N до 1
DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER $$ -- -- Начало процедуры для сервера, "$$" - символ-разд, как ";"
CREATE PROCEDURE print_numbers
(
	IN input_numbers INT -- N
)
BEGIN
	DECLARE n INT DEFAULT input_numbers; -- NULL
    DECLARE result VARCHAR(45) DEFAULT ''; -- ''
    -- SET n = input_numbers; -- Копию можем изменять,а input_numbers - нет
    
    REPEAT
		SET result = CONCAT(result, n, ' '); -- "5, " + "4" + "," = "5,4,"
        SET n = n - 1;
        UNTIL n <= 0 -- Условие выхода их цикла: n - число отр. или равное 0
	END REPEAT;
    SELECT result; -- Печатаю красивую строчку с числами через ","
END ;

CALL print_numbers(9);