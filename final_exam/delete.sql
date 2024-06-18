DELETE FROM addresses 
WHERE id % 2 = 0
		and
		street ilike '%r%'
