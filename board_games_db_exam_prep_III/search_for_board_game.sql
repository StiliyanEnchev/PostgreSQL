CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    release_year INT,
    rating FLOAT,
    category_name VARCHAR(50),
    publisher_name VARCHAR(50),
    min_players VARCHAR(50),
    max_players VARCHAR(50)
);


CREATE OR REPLACE PROCEDURE usp_search_by_category(
	category VARCHAR(50)
)
AS 
$$
BEGIN 
	TRUNCATE search_results;
	INSERT INTO search_results (name, release_year, rating, category_name, publisher_name, min_players, max_players)
		SELECT 
	bg.name,
	bg.release_year,
	bg.rating,
	ct.name,
	p.name,
	pr.min_players || ' people',
	pr.max_players || ' people'
FROM 
	categories as ct
		join board_games as bg
			on ct.id = bg.category_id
				join publishers as p
					on bg.publisher_id = p.id
						join players_ranges as pr
							on bg.players_range_id = pr.id
WHERE 
	ct.name = category
ORDER BY 
	p.name, bg.release_year DESC;
END;
$$
LANGUAGE plpgsql
