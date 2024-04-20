SELECT pz.name AS pizzeria_name FROM person AS p
JOIN person_visits AS pv ON p.id = pv.person_id
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
WHERE p.name = 'Andrey'
EXCEPT
SELECT pz.name FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE p.name = 'Andrey'
ORDER BY 1