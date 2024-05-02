CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(a INTEGER) AS $$
WITH RECURSIVE fb AS (
    SELECT 0 AS a, 1 as b
    UNION ALL
    SELECT b AS a, a + b AS b
    FROM fb
    WHERE b < pstop
)
SELECT a FROM fb;
$$ LANGUAGE sql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
