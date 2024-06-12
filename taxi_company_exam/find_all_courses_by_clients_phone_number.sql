CREATE OR REPLACE FUNCTION fn_courses_by_client(
	phone_num VARCHAR(20)
) RETURNS int 
as 
$$
	DECLARE result int;
BEGIN
	SELECT
		COUNT(*) INTO result
			FROM clients as cl
			JOIN courses as cr
				on cl.id = cr.client_id
		WHERE phone_number = phone_num;
	return result;
END;
$$
LANGUAGE plpgsql;
