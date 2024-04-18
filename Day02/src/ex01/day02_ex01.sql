
SELECT missing_date::date
from generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date
LEFT JOIN
      (SELECT
             pv.visit_date
         FROM
             person_visits AS pv
        WHERE 
             pv.person_id = 1
             OR pv.person_id = 2
      ) AS v ON (missing_date = v.visit_date)
WHERE 
      v.visit_date IS NULL
ORDER BY missing_date