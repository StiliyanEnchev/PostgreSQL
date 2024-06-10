SELECT 
	a.name as animal,
	extract(YEAR from a.birthdate) as birth_year,
	at.animal_type
FROM 
	animals as a 
		join animal_types as at
			on at.id = a.animal_type_id
WHERE
	at.animal_type <> 'Birds'
		and
	age('01/01/2022', a.birthdate) < '5 years'
		and
	a.owner_id is Null 
ORDER BY 
	a.name
