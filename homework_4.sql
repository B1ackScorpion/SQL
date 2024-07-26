USE lesson_4;

-- Задача 1
-- Найдите общее количество лайков, которые получили пользователи женского пола.
SELECT
	COUNT(*)
FROM users u
JOIN profiles p ON u.id = p.user_id
JOIN media m ON u.id = m.user_id
JOIN likes l ON m.id = l.media_id
WHERE p.gender = 'f';

SELECT * FROM likes;

-- Задача 2
/*
Найдите количество лайков, которые поставили пользователи женского пола и мужского пола.
Выведите название пола (преобразовав значение атрибута f в женский, а значение ‘m` - мужской) 
и количество, поставленных лайков, применив к количеству лайков сортировку по убыванию.
*/
SELECT 
	CASE(p.gender)
		WHEN 'f' THEN 'женский'
		ELSE 'мужской'
	END AS gender,
    COUNT(*)
FROM profiles p
JOIN likes l ON l.user_id = p.user_id
GROUP BY p.gender
ORDER BY COUNT(*) DESC;

-- Задача 3
SELECT u.id
FROM users u
LEFT JOIN messages m ON m.from_user_id = u.id
WHERE m.to_user_id IS NULL;

-- Задача 4
/*
Друзья — это пользователи у которых имеется соответствующая запись (заявка) в сущности 
«заявки на дружбу» и в атрибуте status данной сущности указано значение 'approved'.

Найдите количество друзей у каждого пользователя. 
Выведите для каждого пользователя идентификатор пользователя, имя, фамилию и количество друзей cnt. 
Сортировка выводимых записей в порядке возрастания идентификатора пользователя.
*/
SELECT
	u.id,
    u.firstname,
    u.lastname,
    COUNT(f.status) AS cnt
FROM users u
LEFT JOIN friend_requests f ON (u.id = f.initiator_user_id OR u.id = f.target_user_id) AND f.status = 'approved'
GROUP BY u.id
ORDER BY u.id