
WITH v as (
    SELECT pizzeria.name as pizzeria_name
    FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    WHERE person_visits.person_id IN (SELECT person.id FROM person WHERE name = 'Andrey')
),
o as (
    SELECT pizzeria.name as pizzeria_name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    WHERE person_order.person_id IN (SELECT person.id FROM person WHERE name = 'Andrey')
)
SELECT pizzeria_name
FROM v
EXCEPT
SELECT pizzeria_name
FROM o
ORDER BY 1
