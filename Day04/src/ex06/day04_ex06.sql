CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
(WITH tmp AS (
SELECT p.id, p.name, pz.name AS pizzeria, pz.id AS pz_id FROM person AS p
JOIN
person_visits AS pv ON pv.person_id = p.id
JOIN
pizzeria AS pz ON pz.id = pv.pizzeria_id
WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
)
SELECT pizzeria AS pizzeria_name FROM tmp AS t
JOIN
menu AS m ON m.pizzeria_id = t.pz_id
WHERE m.price < '800')