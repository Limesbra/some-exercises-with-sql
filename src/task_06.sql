WITH t1 as(
    SELECT menu.pizza_name, pizzeria.name as pizzeria_name_1, menu.price
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
),
t2 as(
    SELECT menu.pizza_name, pizzeria.name as pizzeria_name_2, menu.price
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
)
SELECT t1.pizza_name, pizzeria_name_1, pizzeria_name_2, t1.price
FROM t1
JOIN t2 ON t2.pizza_name = t1.pizza_name
WHERE t1.price = t2.price and pizzeria_name_1 < pizzeria_name_2
ORDER BY 1