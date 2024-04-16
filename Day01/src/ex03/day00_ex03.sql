SELECT po.order_date AS action_date,
    po.person_id
FROM person_order AS po
INTERSECT
SELECT pv.visit_date AS action_date,
    person_id
FROM person_visits AS pv
ORDER BY action_date ASC,
    person_id DESC;