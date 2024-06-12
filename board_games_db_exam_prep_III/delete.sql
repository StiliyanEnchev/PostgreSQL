
DELETE FROM board_games 
	where publisher_id IN 
		(SELECT id 
		FROM publishers 
		WHERE address_id in (
		select id from addresses
		where town LIKE 'L%'
		));

DELETE FROM publishers 
	WHERE address_id in 
		(select id from addresses 
			where town like 'L%');

DELETE FROM addresses 
	where town like 'L%';
