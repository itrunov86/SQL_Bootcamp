
SELECT m1.pizza_name, m1.price, pz.name AS pizzeria_name FROM (
SELECT m.id FROM menu AS m
EXCEPT
SELECT po.menu_id FROM person_order AS po) AS tmp
JOIN menu AS m1 ON tmp.id = m1.id
JOIN pizzeria AS pz ON pz.id = m1.pizzeria_id
ORDER BY 1, 2