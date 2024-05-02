CREATE OR REPLACE FUNCTION 
fnc_person_visits_and_eats_on_date
    (pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE(name varchar) AS $$
    BEGIN
    RETURN QUERY
    SELECT pz.name AS pizzeria_name
    FROM person_visits AS pv
    INNER JOIN person AS p ON pv.person_id = p.id
    INNER JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
    INNER JOIN menu AS m ON pz.id = m.pizzeria_id
    WHERE
        p.name = pperson
        AND pv.visit_date = pdate
        AND m.price < pprice;
    END;
$$ LANGUAGE PLPGSQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
