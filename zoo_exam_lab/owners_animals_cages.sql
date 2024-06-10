SELECT 
	o.name || ' - ' || a.name as "owners - animals",
	o.phone_number,
	ac.cage_id
FROM 
	owners as o
		join animals as a
			on o.id = a.owner_id
				join animals_cages as ac
					on a.id = ac.animal_id
						join animal_types as at
							on a.animal_type_id = at.id
							
WHERE at.animal_type = 'Mammals'
ORDER BY 
	o.name, a.name DESC
