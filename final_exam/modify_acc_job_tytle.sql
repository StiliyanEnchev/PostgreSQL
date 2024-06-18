CREATE OR REPLACE PROCEDURE udp_modify_account(
	address_street VARCHAR(30), address_town VARCHAR(30)
	) 
AS 
$$
BEGIN
	IF EXISTS 
		(SELECT 1 
			FROM 
			addresses as ad
				join accounts as ac
					on ad.account_id = ac.id
			WHERE ad.street = address_street
					and
				ad.town = address_town)
	THEN 
		UPDATE accounts as ac
	set job_title = '(Remote) ' || job_title
	FROM addresses AS ad
        WHERE ac.id = ad.account_id
          AND ad.street = address_street
          AND ad.town = address_town; 
	END IF;
END;
$$
LANGUAGE plpgsql;

CALL udp_modify_account('97 Valley Edge Parkway', 'Divinópolis');
SELECT a.username, a.gender, a.job_title FROM accounts AS a
WHERE a.job_title ILIKE '(Remote)%';

