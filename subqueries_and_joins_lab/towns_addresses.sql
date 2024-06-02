SELECT 
	a.town_id,
	t.name,
	address_text
FROM 
	addresses as a
		join towns as t
			on t.town_id = a.town_id
WHERE t.name IN ('Sofia', 'Carnation', 'San Francisco')
ORDER BY a.town_id, a.address_id
