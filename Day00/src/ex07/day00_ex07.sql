SELECT p.id,
    p.name,
    p.age,
    CASE
        WHEN p.age >= 10
        AND p.age <= 20 THEN 'interval #1'
        WHEN p.age > 20
        AND p.age < 24 THEN 'interval #2'
        ELSE 'interval #3'
    END AS interval_info
FROM person AS p
ORDER BY interval_info;