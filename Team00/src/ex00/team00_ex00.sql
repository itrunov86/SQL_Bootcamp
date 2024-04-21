CREATE TABLE nodes (
    point1 VARCHAR,
    point2 VARCHAR,
    cost NUMERIC
);

INSERT INTO nodes (point1, point2, cost)
VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30),
('b', 'c', 35),
('c', 'b', 35);

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
WHERE total_cost = (SELECT min(total_cost) FROM tours)
ORDER BY total_cost, tour;
