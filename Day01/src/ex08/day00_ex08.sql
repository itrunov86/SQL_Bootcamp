SELECT po.order_date, p.name || ' ' || '(age:' || p.age || ')' AS person_information
FROM person_order AS po
    NATURAL JOIN person AS p
ORDER BY po.order_date ASC, person_information ASC