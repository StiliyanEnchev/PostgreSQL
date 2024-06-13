SELECT 
	cr.last_name,
	CEIL(avg(bg.rating)) as average_rating,
	p.name as publisher_name
FROM 
	creators as cr
		join creators_board_games as crbg
			on crbg.creator_id = cr.id
				join board_games as bg
					on bg.id = crbg.board_game_id
						join publishers as p
							on p.id = bg.publisher_id
WHERE 
	p.name = 'Stonemaier Games'
GROUP BY 
	cr.last_name, publisher_name
ORDER BY 
	average_rating DESC
