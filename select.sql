/* SELECT - запит на вибірку даних - DQL - Data Query Language */

-- SELECT (що саме вибрати) FROM (табличний вираз)

SELECT * FROM users;

SELECT first_name, last_name FROM users;


SELECT email FROM users;  -- результат повернення команди - таблиця

-- обмеження результатів (вибірка даних)

/* SELECT * FROM users
WHERE (умова, яка повертає true для рядків, які підходять) */


SELECT * FROM users
WHERE gender = 'female';


SELECT * FROM users
WHERE gender = 'female' AND is_subscribe = TRUE;

/*
Таска: отримати всіх юзерів, в який id парний


*/

SELECT * FROM users
WHERE id % 2 = 0;

-- Таска 2: отримати всіх юзерів, які підписані на новини і при цьому їхній зріст > 1.5


SELECT * FROM users 
WHERE is_subscribe = TRUE AND height > 1.5;



-----

SELECT * FROM users
WHERE first_name IN ('John', 'Jane', 'William');

SELECT * FROM users
WHERE id IN (101, 120, 150);


SELECT * FROM users
WHERE id BETWEEN 100 AND 110;

--- Таска: вибрати юзерів зростом від 1.5 до 1.9


SELECT * FROM users
WHERE height >= 1.5 AND height <= 1.9;

SELECT * FROM users
WHERE height BETWEEN 1.5 AND 1.9;



----


SELECT * FROM users 
WHERE first_name LIKE 'K%';


/*
% - будь-яка кількість будь-яких символів
_ - 1 будь-який символ

*/

SELECT * FROM users
WHERE first_name LIKE '___';

-- Таска: знайти юзерів, імена яких закінчуються на літеру "а"

-- ILIKE - реєстро-незалежна форма

SELECT * FROM users
WHERE first_name LIKE '%a';

ALTER TABLE users
ADD COLUMN weight int CHECK (weight > 0);


--- Оновлення даних

UPDATE users 
SET weight = 60 
WHERE height > 1.5;


-- Таска:оновити вагу користувачів, в яких довжина імені - 5 літер - встановити 90кг

UPDATE users
SET weight = 90
WHERE first_name LIKE '_____';

UPDATE users
SET weight = 80
WHERE id % 2 = 1
RETURNING *;

DELETE FROM users
WHERE id = 505
RETURNING *;


--- Співробітники: збільшити зп на 20%

UPDATE employees
SET salary = salary * 1.2
WHERE working_hours > 150;


-----

SELECT * FROM users
WHERE birthdate > '1990-01-01';


SELECT * FROM users
WHERE extract(month from birthdate) = 9;


SELECT * FROM users
WHERE extract(days from birthdate) = 1;


-- всі юзери, яким більше ніж 20 років:


SELECT * FROM users
WHERE extract(years from age(birthdate)) > 20;


/*
Таски:

1. Отримати всіх повнолітніх користувачів чоловічого роду

2. Отримати всіх користувачів жіночого роду, ім'я яких починається на "А"

3. Отримати користувачів віком від 20 до 40 років (включно)

4. Отримати всіх, хто народився в січні

5. Всім користувачам, які народились 1 листопада змінити підписку на TRUE

6. Всім користучам чоловічого роду зростом від 1.7 до 1.9 змінити вагу на 95кг.


*/


--1

SELECT * FROM users
WHERE gender = 'male' AND extract(years from age(birthdate)) > 18;


--2

SELECT * FROM users
WHERE gender = 'female' AND first_name ILIKE 'A%';

--3

SELECT * FROM users
WHERE extract(years from age(birthdate)) BETWEEN 20 AND 40;


--4

SELECT * FROM users
WHERE extract(month from birthdate) = 1;

--5 

UPDATE users
SET is_subscribe = TRUE
WHERE extract(month from birthdate) = 11 AND extract(days from birthdate) = 1;


--6

UPDATE users
SET weight = 95
WHERE height BETWEEN 1.7 AND 1.9;