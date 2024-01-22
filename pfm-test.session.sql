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


/* constraints */

DROP TABLE users;


CREATE TABLE users(
    first_name varchar(256) NOT NULL CHECK (first_name != ''),
    last_name varchar(256) NOT NULL CHECK (last_name != ''),
    birthdate date CHECK (birthdate > '1900-01-01' AND birthdate < current_date),
    email varchar(300) NOT NULL UNIQUE CHECK (email != ''),
    password varchar(300) NOT NULL CHECK (password != ''),
    height numeric(3,2) CONSTRAINT normal_height CHECK (height BETWEEN 0 AND 5.0),
    is_subscribe bool NOT NULL,
    created_at timestamp DEFAULT current_timestamp
);
/* обмеження вказуються при визначенні стовпця або всієї таблиці */

INSERT INTO users (first_name, last_name, email, password, height, is_subscribe) VALUES 
('', '', 'fare@j.sdf', 'kjhf@#$ujhsdf', 8.0, FALSE);
/* Constraint "users_height_check"
У будь-якого обмеження (констрейнту) є ім'я, за яким ми можемо до нього доступитися
По дефолту, якщо не вказано іншого, ім'я формується за принципом:
ім'яТаблиці_ім'яСтовпця_типПеревірки

 */


 INSERT INTO users (first_name, last_name, email, birthdate, password, height, is_subscribe) VALUES 
('Nick', 'Doe', 'fare3we3@j.sdf', '2024-01-21', 'kjhf@#$ujhsdf', 3.0, FALSE),
('John', 'Doe', 'fare322@j.sdf', '2024-01-21', 'kjhf@#$ujhsdf', 3.0, FALSE); -- "users_email_key"


 INSERT INTO users (first_name, last_name, email, birthdate, password, height, is_subscribe) VALUES 
('Kick', 'Doe', 'fare123@j.sdf', '2024-01-21', 'kjhf@#$ujhsdf', 3.0, FALSE);

 INSERT INTO users (first_name, last_name, email, birthdate, password, height, is_subscribe) VALUES 
('Rohn', 'Doe', 'fare321@j.sdf', '2024-01-21', 'kjhf@#$ujhsdf', 3.0, FALSE);


/*
Створити таблицю для повідомлень (messages)
    body рядок тексту, не пустий, максимум 5000
    автор рядок тексту, не пустий, 256
    дата створення - таймштемп, по дефолту поточний
    чи прочитано - бул, по дефолту не прочитане


*/


CREATE TABLE messages(
    body varchar(5000) NOT NULL CHECK (body != ''),
    author varchar(256) NOT NULL CHECK (author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read bool DEFAULT FALSE
);

INSERT INTO messages (body, author) VALUES 
('Hello', 'John'), ('Hi', 'Jane');