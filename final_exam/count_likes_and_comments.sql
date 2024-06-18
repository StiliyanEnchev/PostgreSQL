SELECT 
	p.id as photo_id,
	COUNT (DISTINCT l.account_id) as likes_count,
	COUNT (DISTINCT c."content") as comments_count
FROM 
	photos as p
		left join likes as l
			on l.photo_id = p.id
				left join comments as c
					on c.photo_id = p.id
GROUP BY
	p.id
ORDER BY
	likes_count DESC, comments_count DESC, photo_id
;
