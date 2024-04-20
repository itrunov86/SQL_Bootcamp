
SELECT m.pizza_name, pz.name AS pizzeria_name_1, pz.name AS pizzeria_name_2, m.price
FROM menu AS m
JOIN menu AS m1 ON m.price = m1.price AND m.pizza_name = m1.pizza_name 
AND m.pizzeria_id > m1.pizzeria_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
JOIN pizzeria AS pz1 ON pz1.id = m1.pizzeria_id
ORDER BY 1

