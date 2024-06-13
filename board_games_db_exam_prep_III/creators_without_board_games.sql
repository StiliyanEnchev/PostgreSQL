SELECT 
	cr.id,
	cr.first_name || ' ' || cr.last_name as creator_name,
	cr.email
FROM 
	creators as cr
		left join creators_board_games as cbg 
			on cr.id = cbg.creator_id

WHERE cr.id not in (select creator_id from creators_board_games)
GROUP BY 
	cr.id
ORDER BY 
	creator_name
