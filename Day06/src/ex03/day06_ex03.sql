CREATE UNIQUE INDEX
      idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan=OFF;

EXPLAIN ANALYZE
SELECT
      person_id,
      pizzeria_id
  FROM
      person_discounts;

INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
VALUES
      (16, 4, 5, 20);