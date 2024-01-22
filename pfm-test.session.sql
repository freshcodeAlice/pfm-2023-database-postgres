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
    id serial PRIMARY KEY,
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
DROP TABLE messages;

CREATE TABLE messages(
    id serial NOT NULL UNIQUE,
    body varchar(5000) NOT NULL CHECK (body != ''),
    author varchar(256) NOT NULL CHECK (author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read bool DEFAULT FALSE
);

INSERT INTO messages (body, author) VALUES 
('Hello', 'John'), ('Hi', 'Jane');


INSERT INTO messages (body) VALUES 
('Hello');

INSERT INTO messages (body, author, id) VALUES 
('Hello', 'John', 7);


/*
Переробити таблицю машин

 Таска:
описати таблицю машин

Машина
    - бренд - рядок - обов'язковий, не пустий
    - модель - рядок - не пуста
    - рік випуску - дата з 01-01
    - літраж (об'єм бака) - 40 - ціле число від 0 до 1500
    - колір - рядок
    - об'єм двигуна (1600) - ціле число
    - тип кузова (седан, універсал) - рядок
    - тип пального - рядок
    - ідентифікатор


*/

DROP TABLE cars;


CREATE TABLE cars (
    id serial PRIMARY KEY,
    brand varchar(300) NOT NULL CHECK (brand != ''),
    model varchar(300)  CHECK (model != ''),
    year date,
    volume int CHECK (volume > 0 AND volume < 1500),
    color varchar(100),
    engine_volume int,
    body_type varchar(100),
    fuel_type varchar(100)
);

/*
NOT NULL + UNIQUE - це поєднання обмежень гарантує, що певне значення буде завжди + воно буде унікальним

Визначення стовпця (або сукупності стовпців) первинним ключем = NOT NULL + UNIQUE

Первинний ключ - значення, яке є унікальним, існуючим завжди і є таким, на яке ми можемо покладатися для однозначної ідентифікації об'єкта

*/
DROP TABLE d;

CREATE TABLE d (
    a varchar(2) NOT NULL,
    b varchar(2) NOT NULL,
    CONSTRAINT "unique_pair" PRIMARY KEY (a, b)
);

INSERT INTO d VALUES
('XX', 'YY');

INSERT INTO d VALUES
('YY', 'YY'),
('XX', 'XX');