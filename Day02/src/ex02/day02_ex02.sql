SELECT COALESCE(tmp.person_name, '-') AS person_name,
        tmp.visit_date,
        COALESCE(tmp.name, '-') AS pizzeria_name
FROM
(SELECT p.name AS person_name, pv.visit_date, pz.name FROM person AS p
FULL JOIN
(SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv ON pv.person_id = p.id
FULL JOIN
pizzeria AS pz ON pv.pizzeria_id = pz.id) AS tmp
ORDER BY person_name, visit_date, pizzeria_name


