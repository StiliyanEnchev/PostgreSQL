CREATE TABLE mountains(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	mountain_id int,
	constraint fk_peaks_mountains
		foreign key (mountain_id)
			REFERENCES mountains(id)
)
