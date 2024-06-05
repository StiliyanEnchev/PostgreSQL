CREATE OR REPLACE FUNCTION fn_full_name(
	first_name varchar(50),
	last_name varchar(50) 
) RETURNS VARCHAR(101)
AS
$$
	DECLARE 
		full_name varchar(101);
	BEGIN 
		full_name := INITCAP(first_name) || ' ' || INITCAP(last_name);	
		RETURN full_name;
	END;
$$

LANGUAGE plpgsql
