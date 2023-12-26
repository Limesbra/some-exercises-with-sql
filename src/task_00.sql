SELECT pizza_name, price, pizzeria.name as pizzeria_name, visit_date
FROM person_visits
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE  (SELECT id FROM person WHERE name = 'Kate') = person_id 
        AND (menu.price BETWEEN 800 AND 1000) 
ORDER BY 1, 2, 3