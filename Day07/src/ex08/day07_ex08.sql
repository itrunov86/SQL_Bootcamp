

SELECT 
    address, 
    p.name, 
    count(*) AS count_of_orders
FROM person_order 
JOIN menu AS m ON person_order.menu_id = m.id
JOIN pizzeria AS p ON m.pizzeria_id = p.id
JOIN person AS p1 ON p1.id = person_order.person_id
GROUP BY address, p.name
ORDER BY 1,2;