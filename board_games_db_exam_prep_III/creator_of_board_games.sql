CREATE OR REPLACE FUNCTION fn_creator_with_board_games(
	searched_name VARCHAR(30)
) RETURNS int
AS
$$
	DECLARE 
		result int;
BEGIN 
	SELECT
	COUNT(*) into result
FROM 
	board_games as bg
		join creators_board_games as cbg
			on bg.id = cbg.board_game_id
WHERE 
	cbg.creator_id = (SELECT 
	cr.id
FROM 
	creators as cr
WHERE 
	cr.first_name = searched_name);
	RETURN result;
END;
$$
LANGUAGE plpgsql
;

SELECT fn_creator_with_board_games('Bruno') 
