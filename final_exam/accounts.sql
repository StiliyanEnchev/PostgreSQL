SELECT 
	username,
	gender,
	age
FROM 
	accounts as ac
WHERE age >= 18 
	and
	length(username) > 9
ORDER BY 
	age DESC, username
