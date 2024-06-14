UPDATE coaches
	SET salary = salary * coach_level
WHERE
	first_name like 'C%'
		and
	(
SELECT count (*)
		from players_coaches as pc
			join coaches as c
				on c.id = pc.coach_id
	) >= 1;

