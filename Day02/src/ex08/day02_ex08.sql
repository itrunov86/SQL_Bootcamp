SELECT * FROM person AS p
WHERE (p.address = 'Moscow' OR p.address = 'Samara') AND p.gender = 'male'

SELECT * FROM menu AS m
JOIN
person_order AS po ON m.id = po.menu_id

WITH tmp AS (
    SELECT * FROM menu AS m
    JOIN
    person_order AS po ON m.id = po.menu_id
)
SELECT name FROM tmp AS t
JOIN
person AS p ON t.person_id = p.id
WHERE (p.address = 'Moscow' OR p.address = 'Samara') AND p.gender = 'male'
AND (pizza_name LIKE '%mushroom%' OR pizza_name LIKE '%pepperoni%')
ORDER BY name DESC