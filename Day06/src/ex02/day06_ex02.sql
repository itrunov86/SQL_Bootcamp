SELECT 
    p.name, 
    m.pizza_name, 
    m.price, 
    (m.price - (m.price * pd.discount / 100))::INTEGER AS discount_price, 
    pz.name AS pizzeria_name 
FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
JOIN person_discounts AS pd ON pd.person_id = p.id
ORDER BY 1, 2;