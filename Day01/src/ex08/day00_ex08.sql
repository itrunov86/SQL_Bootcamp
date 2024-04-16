
SELECT  po.order_date, p.name || ' ' || '(age:' || p.age || ')' AS person_information
FROM (SELECT order_date, person_id AS id FROM person_order) po
NATURAL JOIN person AS p
ORDER BY po.order_date ASC, person_information ASC