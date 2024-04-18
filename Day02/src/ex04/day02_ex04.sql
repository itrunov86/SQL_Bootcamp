SELECT m.pizza_name, p.name AS pizzeria_name, m.price
FROM menu AS m
    JOIN pizzeria AS p ON m.pizzeria_id = p.id
WHERE
    pizza_name LIKE 'mushroom%'
    OR pizza_name LIKE 'pepperoni%'
ORDER BY pizza_name, pizzeria_name