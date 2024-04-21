WITH RECURSIVE recurs AS (
    SELECT
        point2,
        cost AS total_cost,
        1 AS step,
        point1 || ',' || point2 AS tour
    FROM nodes
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        n.point2,
        n.cost + recurs.total_cost AS total_cost,
        recurs.step + 1 AS step,
        recurs.tour || ',' || n.point2 AS tour
    FROM recurs
    INNER JOIN
        nodes AS n
        ON
            recurs.point2 = n.point1
    WHERE recurs.tour NOT LIKE '%' || n.point2 || '%'
),

tours AS (
    SELECT
        n.cost + recurs.total_cost AS total_cost,
        recurs.tour || ',' || n.point2 AS tour
    FROM recurs
    INNER JOIN nodes AS n ON recurs.point2 = n.point1 AND n.point2 = 'a'
    WHERE recurs.step = (SELECT max(recurs.step) FROM recurs)
    ORDER BY total_cost
)

SELECT
    total_cost,
    '{' || tour || '}' AS tour
FROM tours
WHERE
    total_cost = (SELECT min(total_cost) FROM tours)
    OR total_cost = (SELECT max(total_cost) FROM tours)
ORDER BY total_cost, tour;
