UPDATE addresses
	SET country = CASE
		WHEN country like 'B%' 
	THEN'Blocked'
		WHEN country like 'T%' 
	THEN 'Test'
		WHEN country like 'P%' 
	THEN 'In Progress'
		ELSE country
	END;
