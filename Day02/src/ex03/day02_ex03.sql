WITH
    cte_name AS (
        SELECT pv.visit_date
        FROM person_visits AS pv
        WHERE
            pv.person_id = 1
            OR pv.person_id = 2
    )
SELECT missing_date
FROM cte_name AS cn
    RIGHT JOIN (
        SELECT missing_date::date
        from generate_series(
                '2022-01-01', '2022-01-10', interval '1 day'
            ) as missing_date
    ) ON (missing_date = cn.visit_date)
WHERE
    cn.visit_date IS NULL