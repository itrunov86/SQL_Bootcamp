CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

EXPLAIN
ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE
    pizza_name = 'cheese pizza';

INSERT INTO
    menu (
        id, pizzeria_id, pizza_name, price
    )
VALUES (19, 2, 'sicilian pizza', 950);