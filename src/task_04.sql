WITH men_visits as (
    SELECT pizzeria.name as pizzeria_name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    WHERE person_order.person_id IN (
        SELECT person.id from person WHERE gender = 'male'
    )
),
women_visits as (
    SELECT pizzeria.name as pizzeria_name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    WHERE person_order.person_id IN (
        SELECT person.id from person WHERE gender = 'female'
    )
)
SELECT men_visits.pizzeria_name
FROM men_visits EXCEPT(SELECT women_visits.pizzeria_name FROM women_visits)
UNION
SELECT women_visits.pizzeria_name
FROM women_visits EXCEPT(SELECT men_visits.pizzeria_name FROM men_visits)
ORDER BY 1;