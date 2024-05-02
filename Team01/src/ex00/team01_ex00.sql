WITH
    b AS (
        SELECT
            user_id, type, currency_id, SUM(money) AS volume
        FROM balance
        GROUP BY
            user_id, type, currency_id
    ),

bc AS (
    SELECT DISTINCT
        b.user_id, b.type, b.currency_id, b.volume, c.name AS currency_name, (
            SELECT rate_to_usd
            FROM currency ct
            WHERE
                b.currency_id = ct.id
            ORDER BY updated DESC
            LIMIT 1
        ) AS last_rate_to_usd
    FROM b
        LEFT JOIN currency c ON b.currency_id = c.id
)

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    bc.type,
    bc.volume,
    COALESCE(
        bc.currency_name, 'not defined'
    ) AS currency_name,
    COALESCE(bc.last_rate_to_usd, 1) AS last_rate_to_usd,
    (
        bc.volume * COALESCE(bc.last_rate_to_usd, 1)
    )::float AS total_volume_in_usd
FROM "user" u
    FULL JOIN bc ON u.id = bc.user_id
ORDER BY name DESC, lastname ASC, bc.type ASC;