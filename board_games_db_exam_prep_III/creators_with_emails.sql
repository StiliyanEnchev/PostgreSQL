SELECT 
	cr.first_name || ' ' || cr.last_name as full_name,
	cr.email,
	max(bg.rating)
FROM 
	creators as cr
		join creators_board_games as crbg
			on cr.id = crbg.creator_id
			  join board_games as bg
					on bg.id = crbg.board_game_id
WHERE 
	cr.email like '%.com'
GROUP BY 
	full_name, cr.email
ORDER BY 
	full_name
