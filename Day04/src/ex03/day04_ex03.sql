
SELECT generated_date AS missing_date FROM v_generated_dates
LEFT JOIN
(SELECT pv.visit_date FROM person_visits AS pv) AS v ON (generated_date = v.visit_date)
WHERE 
      v.visit_date IS NULL
ORDER BY missing_date