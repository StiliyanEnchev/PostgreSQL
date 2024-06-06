CREATE OR REPLACE PROCEDURE sp_transfer_money(
	sender_id int,
	received_id int,
	amount numeric(4)
)
AS 
$$
DECLARE 
	current_balance numeric;
BEGIN 
	CALL sp_withdraw_money(sender_id, amount);
	CALL sp_deposit_money(received_id, amount);

	SELECT balance INTO current_balance FROM accounts WHERE id = sender_id;
	IF current_balance < 0 THEN 
		ROLLBACK;
	END IF;
		
END;
$$
LANGUAGE plpgsql;

CALL sp_transfer_money(1, 200);
SELECT * FROM accounts WHERE id = 1;
