CREATE TABLE dogs (
    name varchar(300),
    breed varchar(300),
    color varchar(300)
);

INSERT INTO dogs (name, breed, color) VALUES 
('Bark', 'None', 'Red'), ('Doggi', 'Alabai', 'Black'), ('Bark', 'None', 'Red');

ALTER TABLE dogs
-- далі іде дія
ADD COLUMN id serial;


ALTER TABLE dogs
DROP COLUMN id;

ALTER TABLE dogs
ADD CONSTRAINT "dogs_pkey" PRIMARY KEY (id);


ALTER TABLE users 
ADD COLUMN gender varchar(100);

ALTER TABLE users
DROP COLUMN password;


DELETE FROM users WHERE id = 5;