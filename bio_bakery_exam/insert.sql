CREATE TABLE IF NOT EXISTS gift_recipients(
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50),
	country_id INT,
	gift_sent BOOL DEFAULT False
);

INSERT INTO gift_recipients ("name", country_id)
	SELECT 
		first_name || ' ' || last_name,  
		country_id
	from customers;

UPDATE gift_recipients
SET gift_sent = True
WHERE country_id in (7, 8, 14, 17, 26)

