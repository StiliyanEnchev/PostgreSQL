SELECT 
	b.id, b.name, b.release_year, c.name as category_name
FROM board_games as b
	join categories as c
		on b.category_id = c.id
WHERE 	
	c.name = 'Wargames'
		or
	c.name = 'Strategy Games'
	
order by 
	b.release_year DESC
