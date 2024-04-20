
INSERT INTO person_visits VALUES ( 
    (SELECT MAX(id)+1 FROM person_visits),
    (SELECT id FROM v_persons_male WHERE name = 'Dmitriy'),
    (SELECT pz.id FROM menu AS m
    JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
    WHERE m.price < '800' AND pz.name NOT IN (
        SELECT * FROM mv_dmitriy_visits_and_eats
    )
    LIMIT 1),
    '2022-01-08')


REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats





SELECT person.name, pizzeria.name, person_visits.visit_date FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.name = 'Dmitriy'

SELECT pz.id FROM menu AS m
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE m.price < '800' AND pz.name NOT IN (
    SELECT * FROM mv_dmitriy_visits_and_eats
)
LIMIT 1


