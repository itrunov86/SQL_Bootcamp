
INSERT INTO person_order SELECT 
    tmp+(SELECT MAX(id) FROM person_order) AS id,
    p.id AS person_id,
    (SELECT m.id FROM menu AS m WHERE m.pizza_name = 'greek pizza') AS menu_id,
    '2022-02-25' AS order_date
FROM person AS p
JOIN
generate_series(1, (SELECT count(*) FROM person)) AS tmp ON tmp = p.id
