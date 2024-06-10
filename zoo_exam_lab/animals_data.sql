SELECT name, at.animal_type, to_char(a.birthdate, 'DD.MM.YYYY') as birthdate
	FROM animals as a
		JOIN animal_types as at
			ON at.id = a.animal_type_id
ORDER BY 
	name
