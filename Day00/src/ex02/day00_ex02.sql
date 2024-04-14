SELECT m.pizza_name AS pizaa_name
FROM menu AS m
UNION
SELECT m.pizza_name AS pizaa_name
FROM menu AS m
ORDER BY pizaa_name DESC;