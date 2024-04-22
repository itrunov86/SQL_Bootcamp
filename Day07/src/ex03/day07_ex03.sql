

SELECT tmp.name, SUM(count) AS total_count
FROM
(SELECT pz.name, count(*) AS count FROM pizzeria AS pz
JOIN person_visits AS pv ON pv.pizzeria_id = pz.id
GROUP BY pz.name
UNION ALL
SELECT pz.name, count(*) AS count FROM pizzeria AS pz
JOIN menu AS m ON m.pizzeria_id = pz.id
JOIN person_order AS po ON po.menu_id = m.id
GROUP BY pz.name) AS tmp
GROUP BY tmp.name
ORDER BY 2 DESC, 1;
