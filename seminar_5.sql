USE lesson_3;

SELECT *
FROM staff;

SELECT
	post,
	MAX(salary)
FROM staff
GROUP BY post;

-- Ранжирование 
-- Вывести список всех сотрудников, указав место по ЗП в общем списке
SELECT
	post,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS res
FROM staff;

-- Вывести список всех сотрудников и указать место по ЗП 
-- Для каждой занимаемой должности
SELECT
	post,
    salary,
    DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS `dense_rank`
FROM staff;

-- ФНС, ищем самых выс-х сотрудников по должности 
-- dense_rank = 1
-- salary AS s "=" salary s
SELECT *
FROM (SELECT
		post,
		salary,
		DENSE_RANK() OVER (PARTITION BY post ORDER BY salary DESC) AS `dense_rank`
	FROM staff) rank_staff
WHERE `dense_rank` = 1;

-- Агрегация
-- Для каждой занимаемой должности найдем:
-- 1) ср. ЗП
-- 2) суммар. ЗП по дожностям
-- 3) суммар. ЗП по заводу
-- 4) процентное соотношение отдельно взятой ЗП внутри должности к сумм. ЗП по долж.
-- 5) процентное соотношение отдельно взятой ЗП внутри должности к сумм. по всему заводу
SELECT
	post,
    salary,
    ROUND(AVG(salary) OVER (PARTITION BY post), 2) AS avg_salary,
    SUM(salary) OVER (PARTITION BY post) AS sum_salary,
    SUM(salary) OVER () AS total_salary,
    ROUND(salary * 100 / SUM(salary) OVER (PARTITION BY post), 2) AS persent_sum,
    ROUND(salary * 100 / SUM(salary) OVER (), 2) AS persent_total
FROM staff;

SELECT
	post,
    salary,
    ROUND(AVG(salary) OVER w, 2) AS avg_salary,
    SUM(salary) OVER w AS sum_salary,
    SUM(salary) OVER w1 AS total_salary,
    ROUND(salary * 100 / SUM(salary) OVER w, 2) AS persent_sum,
    ROUND(salary * 100 / SUM(salary) OVER (), 2) AS persent_total
FROM staff
WINDOW w AS (PARTITION BY post),
w1 AS ();