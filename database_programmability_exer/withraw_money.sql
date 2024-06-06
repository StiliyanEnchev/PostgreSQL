CREATE OR REPLACE PROCEDURE sp_withdraw_money(
	account_id int,
	money_amount numeric(4)
)
AS 
$$
DECLARE 
	current_balance numeric;
BEGIN 
	current_balance := (SELECT balance FROM accounts WHERE id = account_id);

	if money_amount <= current_balance THEN 
		UPDATE accounts 
		SET balance = balance - money_amount
		WHERE id = account_id;
	ELSE
		RAISE NOTICE 'Insufficient balance to wirhdraw %', money_amount;
	END IF;
END;
$$
LANGUAGE plpgsql;
