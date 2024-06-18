CREATE OR REPLACE FUNCTION udf_accounts_photos_count(
	account_username VARCHAR(30)
	) RETURNS int
AS
$$
	DECLARE result int;
BEGIN 
	SELECT 
		COUNT(*) into result
			FROM 
				accounts as ac
					join accounts_photos as ap
						on ac.id = ap.account_id
							join photos as p
								on ap.photo_id = p.id
			WHERE 
				ac.username = account_username;
		RETURN result;
END;
$$
LANGUAGE plpgsql;

SELECT udf_accounts_photos_count('ssantryd') AS photos_count;
