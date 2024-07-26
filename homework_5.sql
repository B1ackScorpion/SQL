USE lesson_4;

/*
Задача 1.
Найти количество сообщений, отправленных каждым пользователей.
В зависимости от количества отправленных сообщений рассчитать ранг пользователей, 
первое место присвоив пользователю(ям) с наибольшим количеством отправленных сообщений.
Вывести полученный ранг, имя, фамилия, пользователя и кол-во отправленных сообщений. Выводимый список необходимо отсортировать в порядке возрастания ранга.
*/
SELECT
	DENSE_RANK() OVER (ORDER BY COUNT(m.id) DESC) AS `rank`,
	u.firstname,
	u.lastname,
	COUNT(m.id) AS cnt
FROM users u
LEFT JOIN messages m ON u.id = m.from_user_id
GROUP BY u.id
ORDER BY `rank`;


/*
Задача 2.
Получите список сообщений, отсортированных по возрастанию даты отправки.
Вычислите разность между соседними значениями дат отправки. Разности выразите в минутах.
Выведите идентификатор сообщения, дату отправки, дату отправки следующего сообщения и разницу даты отправки соседних сообщений.
*/
SELECT
	id,
    created_at,
    lead(created_at) OVER (ORDER BY created_at) AS next_time,
    TIMESTAMPDIFF(minute, created_at, lead(created_at) OVER (ORDER BY created_at)) AS time_diff
FROM messages