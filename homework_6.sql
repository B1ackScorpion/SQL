-- 1. Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
DROP PROCEDURE IF EXISTS format_into_date;
DELIMITER $$
CREATE PROCEDURE format_into_date
(
	IN input_sec INT
)
BEGIN
	DECLARE `day` INT;
    DECLARE `hour` INT;
    DECLARE `minute` INT;
    DECLARE sec INT;
    DECLARE result VARCHAR(45) DEFAULT '';
    
    SET `day` = TRUNCATE(input_sec / 86400, 0);
    SET `hour` = TRUNCATE(input_sec % 86400 / 3600, 0);
    SET `minute` = TRUNCATE(input_sec % 86400 % 3600 / 60, 0);
	SET `sec` = TRUNCATE(input_sec % 86400 % 3600 % 60, 0);
    
    SET result = CONCAT(result, `day`, ' days ', `hour`, ' hours ', `minute`, ' minutes ', `sec`, ' seconds');
    SELECT result;
END  ;


CALL format_into_date(123456);

-- 2. Выведите только чётные числа от 1 до 10, используя процедуру.
DROP PROCEDURE IF EXISTS even;
CREATE PROCEDURE even()
BEGIN
	DECLARE n INT DEFAULT 2;
    DECLARE result VARCHAR(45) DEFAULT '';
    REPEAT
		SET result = CONCAT(result, n, ' ');
		SET n = n + 2;
		UNTIL n > 10
	END REPEAT;
	SELECT result;
END ;

CALL even();