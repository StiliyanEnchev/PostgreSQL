CREATE OR REPLACE PROCEDURE sp_customer_country_name(
	customer_full_name VARCHAR(50), OUT country_name VARCHAR(50)
)
AS 
$$
BEGIN 
	SELECT 
		cr.name into country_name
	FROM customers as cs
		join countries as cr
			on cs.country_id = cr.id
	WHERE cs.first_name || ' ' || cs.last_name = customer_full_name;
END;
$$
LANGUAGE plpgsql;

CALL sp_customer_country_name('Betty Wallace', '')
