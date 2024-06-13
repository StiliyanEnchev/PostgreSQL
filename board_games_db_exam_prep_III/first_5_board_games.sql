SELECT 
	bg.name,
	bg.rating,
	c.name
FROM 
	board_games as bg
		left join categories as c
			on bg.category_id = c.id
				left join players_ranges as pr
					on bg.players_range_id = pr.id
WHERE 
	(bg.rating > 7 and bg.name ilike '%a%')
		or
	(bg.rating > 7.50 
		and pr.min_players >= 2 
		and pr.max_players <= 5)
ORDER BY 
	bg.name, bg.rating DESC
LIMIT 5
