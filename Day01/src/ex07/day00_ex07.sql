SELECT po.order_date, tmp.person_information
FROM person_order AS po
    JOIN (
        SELECT p.name || ' ' || '(age:' || p.age || ')' AS person_information, p.id
        FROM person AS p
    ) AS tmp ON po.person_id = tmp.id
ORDER BY po.order_date ASC, tmp.person_information ASC