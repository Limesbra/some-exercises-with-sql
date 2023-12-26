UPDATE menu
SET price = CAST ((SELECT price FROM menu WHERE pizza_name = 'greek pizza' ) * 0.9 AS INTEGER)
WHERE pizza_name = 'greek pizza'