-- insert into currency values ( 100, 'EUR', 0.85, '2022-01-01 13:29' );

-- insert into currency values ( 100, 'EUR', 0.79, '2022-01-08 13:29' );

WITH
    b AS (
        SELECT
            b.user_id, b.money, (
                SELECT c.name
                FROM currency c
                WHERE
                    c.id = b.currency_id
                LIMIT 1
            ) AS currency_name, COALESCE(
                (
                    SELECT c.rate_to_usd
                    FROM currency c
                    WHERE
                        c.id = b.currency_id
                        AND c.updated <= b.updated
                    ORDER BY c.updated DESC
                    LIMIT 1
                ), (
                    SELECT c.rate_to_usd
                    FROM currency c
                    WHERE
                        c.id = b.currency_id
                        AND c.updated > b.updated
                    ORDER BY c.updated
                    LIMIT 1
                )
            ) AS rate_to_usd
        FROM balance b
    )

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.currency_name,
    (b.money * b.rate_to_usd)::float AS currency_in_usd
FROM "user" u
    FULL JOIN b ON u.id = b.user_id
WHERE
    b.rate_to_usd IS NOT NULL
ORDER BY name DESC, lastname ASC, b.currency_name ASC;