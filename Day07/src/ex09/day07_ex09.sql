

SELECT 
    address,
    ROUND(max(age)::NUMERIC - (min(age)::NUMERIC/max(age)), 2) AS formula,
    ROUND(avg(age)::NUMERIC, 2) AS average,
    ROUND(max(age)::NUMERIC - (min(age)::NUMERIC/max(age)), 2) > ROUND(avg(age)::NUMERIC, 2)
    AS comparison
FROM person
GROUP BY address
ORDER BY 1;