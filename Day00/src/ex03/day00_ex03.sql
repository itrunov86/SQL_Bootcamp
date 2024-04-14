SELECT to_char(po.order_date, 'dd.mm.yyyy') AS action_date,
    po.person_id
FROM person_order AS po
INTERSECT
SELECT to_char(pv.visit_date, 'dd.mm.yyyy') AS action_date,
    person_id
FROM person_visits AS pv
ORDER BY action_date ASC,
    person_id DESC;