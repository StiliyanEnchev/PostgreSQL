SELECT 
	p.id as photo_id,
	p.capture_date,
	p.description,
	COUNT(*) as comments_count
FROM 
	photos as "p"
		join "comments" as c
			on c.photo_id = p.id
WHERE 
	p.description is not NULL
GROUP BY 
	p.id
ORDER BY 
	comments_count DESC, photo_id
LIMIT 3
