
CREATE OR REPLACE FUNCTION fn_count_employees_by_town
	(town_name varchar(20))
RETURNS INT AS
	
$$
	DECLARE 
		town_count int;
	BEGIN
		SELECT
	COUNT(*) into town_count
FROM employees as e
	JOIN addresses as a
		USING (address_id)
			JOIN towns as t
				USING (town_id)
WHERE t.name = town_name;
	RETURN town_count;
	END;
$$
LANGUAGE plpgsql ;

SELECT fn_count_employees_by_town('Sofia');
