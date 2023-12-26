WITH men_visits as (
    SELECT pizzeria.name as pizzeria_name, COUNT(*) as m_count
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.gender = 'male'
    GROUP BY pizzeria_name
),
women_visits as (
    SELECT pizzeria.name as pizzeria_name, COUNT(*) as w_count
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.gender = 'female'
    GROUP BY pizzeria_name
)
SELECT men_visits.pizzeria_name
FROM men_visits
JOIN women_visits ON men_visits.pizzeria_name = women_visits.pizzeria_name
WHERE men_visits.m_count <> women_visits.w_count
ORDER BY 1;