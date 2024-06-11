DELETE FROM 
	clients
WHERE 
	LENGTH(full_name) > 3
		and
	id NOT IN (
		SELECT 
			client_id
		FROM 
			courses
	)
