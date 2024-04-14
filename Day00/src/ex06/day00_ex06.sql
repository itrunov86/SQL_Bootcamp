SELECT tmp.action_date,
    p.name AS person_name
FROM person AS p
    LEFT JOIN (
        SELECT to_char(po.order_date, 'dd.mm.yyyy') AS action_date,
            po.person_id
        FROM person_order AS po
        INTERSECT
        SELECT to_char(pv.visit_date, 'dd.mm.yyyy') AS action_date,
            person_id
        FROM person_visits AS pv
    ) AS tmp ON p.id = tmp.person_id
ORDER BY action_date ASC,
    person_name DESC