CREATE TABLE IF NOT EXISTS  notification_emails (
	id SERIAL PRIMARY KEY,
	recipient_id INT,
	subject VARCHAR(255),
	body TEXT
);

CREATE OR REPLACE FUNCTION 
	trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER
AS
$$
BEGIN
	INSERT INTO 
		notification_emails (recipient_id, subject, body)
	VALUES 
		(new.account_id, 
		'Balance change for account: ' || new.account_id,
		'On ' || DATE(now) || 'your balance was changed from ' || new.old_sum ||' to ' || new.new_sum
	);
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER
	tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW 
WHEN (old.new_sum <> new.new_sum)
	EXECUTE FUNCTION 
		trigger_fn_send_email_on_balance_change();
