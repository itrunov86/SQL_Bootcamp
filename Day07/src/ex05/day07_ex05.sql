
SELECT DISTINCT p.name
FROM person_order AS po
JOIN person AS p on p.id = po.person_id
ORDER BY 1;