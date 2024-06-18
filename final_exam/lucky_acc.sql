SELECT 
	a.id || ' ' || a.username as id_username,
	a.email
FROM 
	accounts as a
		join accounts_photos ap
			on a.id = ap.account_id
WHERE a.id = ap.photo_id
ORDER BY 
	a.id
