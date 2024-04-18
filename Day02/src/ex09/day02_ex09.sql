SELECT * FROM person AS p
JOIN 
person_order AS po ON p.id = po.person_id
JOIN
menu AS m ON po.menu_id = m.id
WHERE p.gender = 'female'

SELECT * FROM menu AS m
WHERE m.pizza_name = 'cheese pizza' OR m.pizza_name = 'pepperoni pizza'