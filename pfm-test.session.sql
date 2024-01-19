CREATE TABLE my_first_table(
    first_column int,
    second_column varchar(64),
    third_column timestamp
);

DROP TABLE my_first_table;

/*
Юзери
    - ім'я - максимум 256 символів
    - прізвище - максимум 256
    - дата народження - точність 1 день
    - емейл - максимум 300 символів
    - пароль - максимум 300 символів
    - підписку - або так, або ні

*/
DROP TABLE users;

CREATE TABLE users(
    first_name varchar(256),
    last_name varchar(256),
    birthdate date,
    email varchar(300),
    password varchar(300),
    height numeric(3,2),
    is_subscribe bool
);

INSERT INTO users VALUES 
('John', 'Doe', '1990-09-01', 'fare@j.sdf', 'kjhf@#$ujhsdf');


INSERT INTO users VALUES
('Jane', 'Doe', '2010-09-12', 'kjf@kjsd', 'kjhfkd', 5.3, TRUE),
('Rick', 'Snow', '1999-01-01', ' kjhfdkskjdhf', 'kjhk34j', 3.1, FALSE);

INSERT INTO users VALUES
('', 'kjhfds', '2800-01-02', 'kh2342', 'kjshfdkjfh', 8.1, FALSE);


/* Вказання порядку вставки */

INSERT INTO users (last_name, first_name, email, birthdate, is_subscribe) VALUES
('Snow', 'Kick', 'kjhfds', '1990-01-01', TRUE),
('Rnow', 'Lick', 'khfds', '2000-01-01', FALSE),
('Dnow', 'Snick', 'kjsher', '1220-10-10', FALSE);

---------

DROP TABLE second_table;

CREATE TABLE second_table(
    col numeric(3,2)
);

INSERT INTO second_table VALUES 
(5);
/* Якщо ціле число записувати до стовпця з дісними числами - доповниться нулями після крапки, якщо навпаки - вріжеться до цілої частини */


/* Таска:
описати таблицю машин

Машина
    - бренд
    - модель
    - рік випуску
    - літраж (об'єм бака) - 40
    - колір
    - об'єм двигуна (1600)
    - тип кузова (седан, універсал)
    - тип пального

*/


CREATE TABLE cars (
    brand varchar(300),
    model varchar(300),
    year date,
    volume int,
    color varchar(100),
    engine_volume int,
    body_type varchar(100),
    fuel_type varchar(100)
);