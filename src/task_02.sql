WITH pname AS (SELECT id, name FROM pizzeria )
SELECT pizza_name, price, pname.name AS pizzeria_name 
FROM menu
JOIN pname ON menu.pizzeria_id = pname.id
WHERE menu.id NOT IN (
    SELECT menu_id FROM person_order)
ORDER BY 1, 2