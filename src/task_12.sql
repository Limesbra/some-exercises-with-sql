INSERT INTO person_order 
(id, person_id, menu_id, order_date)
(SELECT
    generate_series(
        (SELECT MAX(id)+1 FROM person_order),
        (SELECT MAX(id)+ COUNT(DISTINCT person_id) FROM person_order)), 
        generate_series((SELECT MIN(id) from Person), (SELECT MAX(id) from Person)),
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25')