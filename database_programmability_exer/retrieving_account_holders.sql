CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
	searched_balance numeric
)
AS
$$
DECLARE
	holder_info RECORD;
BEGIN
	FOR holder_info IN 
	SELECT 
		ah.first_name || ' ' || ah.last_name AS full_name,
		sum(balance) AS total_balance
	FROM
		account_holders as ah
			JOIN
		accounts as a
			ON
		a.account_holder_id = ah.id
	GROUP BY
		full_name
	HAVING sum(balance) > searched_balance
	ORDER BY
		full_name
	LOOP 
	RAISE NOTICE '% - %', holder_info.full_name, holder_info.total_balance;
	END LOOP;
	
END;
$$
LANGUAGE plpgsql
;
CALL sp_retrieving_holders_with_balance_higher_than(200000)
