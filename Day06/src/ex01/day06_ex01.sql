INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() OVER () AS id,
    person_id,
    pizzeria_id,
    CASE
        WHEN amount_of_orders = 1 THEN 10.5
        WHEN amount_of_orders = 2 THEN 22
        ELSE 30
    END AS discount
FROM (
    SELECT
        person_id,
        pizzeria_id,
        COUNT(*) AS amount_of_orders
    FROM
        person_order
    JOIN menu AS m on m.id = person_order.menu_id
    GROUP BY
        person_id, pizzeria_id
) AS order_counts;


