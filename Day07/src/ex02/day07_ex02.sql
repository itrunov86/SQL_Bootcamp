

(SELECT pz.name, count(*) AS count, 'visit' AS action_type 
FROM pizzeria AS pz
JOIN person_visits AS pv ON pv.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 2 DESC
LIMIT 3)
UNION
(SELECT pz.name, count(*) AS count, 'order' AS action_type 
FROM pizzeria AS pz
JOIN menu AS m ON m.pizzeria_id = pz.id
JOIN person_order AS po ON po.menu_id = m.id
GROUP BY pz.name
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3, 2 DESC;

