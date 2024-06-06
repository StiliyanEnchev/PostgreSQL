CREATE OR REPLACE FUNCTION fn_is_game_over (
	is_game_over BOOL
) RETURNS TABLE (
	name VARCHAR(50),
	game_type_id INT,
	is_finished boolean
) AS 
$$
	BEGIN
		RETURN QUERY
		SELECT 
	g.name,
	g.game_type_id, 
	g.is_finished
FROM 
	games as g
WHERE 
	g.is_finished = is_game_over;
	END;
$$
LANGUAGE plpgsql
;

SELECT * FROM fn_is_game_over(true)
