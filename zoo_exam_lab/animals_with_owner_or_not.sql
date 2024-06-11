CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
	IN animal_name varchar(30),
	OUT result varchar(30)
)
AS 
$$
BEGIN
	SELECT 
		o.name INTO result
		FROM owners as o
 			join animals as a
				on o.id = a.owner_id
	WHERE a.name = animal_name;

	if result is NULL
		THEN result = 'For adoption';
	END IF;
END;
$$
LANGUAGE plpgsql;
