(SELECT pz.name FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE p.gender = 'female'
EXCEPT
SELECT pz.name FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE p.gender = 'male')
UNION
(SELECT pz.name FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE p.gender = 'male'
EXCEPT
SELECT pz.name FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE p.gender = 'female')
ORDER BY 1