CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	username VARCHAR(30) NOT NULL UNIQUE,
	"password" VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL,
	gender CHAR(1) NOT NULL CHECK (gender = 'M' or gender = 'F'),
	age INT NOT NULL,
	job_title VARCHAR(40) NOT NULL,
	ip VARCHAR(30) NOT NULL
);

CREATE TABLE addresses (
	id SERIAL PRIMARY KEY,
	street VARCHAR(30) NOT NULL,
	town VARCHAR(30) NOT NULL,
	country VARCHAR(30) NOT NULL,
	account_id INT REFERENCES accounts ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	description TEXT,
	capture_date TIMESTAMP NOT NULL,
	"views" INT DEFAULT 0 NOT NULL CHECK ("views" >= 0)
);

CREATE TABLE "comments" (
	id SERIAL PRIMARY KEY,
	"content" VARCHAR(255) NOT NULL,
	published_on TIMESTAMP NOT NULL,
	photo_id INT REFERENCES photos ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE accounts_photos (
	account_id INT REFERENCES accounts ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	photo_id INT REFERENCES photos ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	PRIMARY KEY (account_id, photo_id)
);

CREATE TABLE likes (
	id SERIAL PRIMARY KEY,
	photo_id INT REFERENCES photos ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	account_id INT REFERENCES accounts ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);








