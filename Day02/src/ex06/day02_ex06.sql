
WITH tmp AS (
    SELECT p.id FROM person AS p
    WHERE name = 'Anna' OR name = 'Denis'
)
SELECT m.pizza_name, pz.name AS pizzeria_name FROM tmp AS t 
JOIN
person_order AS po ON po.person_id = t.id
JOIN
menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
ORDER BY pizza_name, pizzeria_name