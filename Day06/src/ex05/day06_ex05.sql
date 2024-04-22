COMMENT ON TABLE 
       person_discounts IS
       'Таблица с указанием персональных скидок на человека в каждой пиццерии';

COMMENT ON COLUMN 
       person_discounts.id IS
       'Первичный ключ для этой таблицы';

COMMENT ON COLUMN
       person_discounts.person_id IS
       'Идентификатор человека';

COMMENT ON COLUMN
       person_discounts.pizzeria_id IS
       'Идентификатор пиццерии';

COMMENT ON COLUMN
       person_discounts.discount IS
       'Персональная скидка в конкретной пиццерии';
