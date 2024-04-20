CREATE VIEW v_price_with_discount AS (
    SELECT *, (tmp.price - tmp.price * 0.1)::INTEGER AS discount_price 
    FROM (SELECT p.name, m.pizza_name, m.price FROM person AS p
    JOIN person_order AS po ON po.person_id = p.id
    JOIN menu AS m ON m.id = po.menu_id) AS tmp
    ORDER BY 1, 2
)