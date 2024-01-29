SELECT * FROM users;

SELECT *, concat(first_name, ' ', last_name) AS "full_name"
FROM users;


/* SELECT повертає таблицю (табличний вираз) 
Табличний вираз - представлення даних в вигляді таблиці, навіть якщо фізично такої таблиці немає

*/


SELECT max(height) FROM users;

/*
Агрегаційна функція - функція, яка приймає множину значень і вираховує певне єдине значення (результат) для групи вхідних даних


- max - максимальне значення
- min - мінімальне значення з вхідних даних
- avg - середнє арифметичне
- count - кількість (кількість рядків, які отримала)
- sum - сума по всіх вхідних значеннях

*/


SELECT count(id) FROM users;


-- Таска - знайти середній зріст користувачів


SELECT avg(height) FROM users;

/* Агрегаційна функція може отримати результат по кожній групі значень. Для цього потрібно розбити всі значення по групам (згрупувати за певним критерієм) */

SELECT avg(height), gender
FROM users
GROUP BY gender;


-- Таска: максимальний зріст чоловіків та жінок

SELECT max(height), gender
FROM users
GROUP BY gender;


-- Задача: порахувати кількість чоловіків та жінок, які народились після 2000

SELECT count(id), gender
FROM users
WHERE extract(years from birthdate) > 2000
GROUP BY gender;


/*
Таски:

1. Середня вага всіх користувачів

2. Середня вага всіх жінок і чоловіків окремо

3. Мінімальна та максимальна вага по кожному гендеру

4. Кількість юзерів, які народились пізніше 1987р

5. Кількість юзерів з певним ім'ям 

6. Кількість юзерів віком від 20 до 30


*/


--1
SELECT avg(weight) FROM users;

--2
SELECT avg(weight), gender
 FROM users
 GROUP BY gender;

 --3
SELECT min(weight), max(weight), gender
 FROM users
 GROUP BY gender;

 --4
SELECT count(*)
 FROM users
WHERE extract(years from birthdate) > 1987;


--5
SELECT count(*)
 FROM users
WHERE first_name = 'Jane';

--6
SELECT count(*)
 FROM users
WHERE extract(years from age(birthdate)) BETWEEN 20 AND 30;



---- Скільки екземплярів по кожному бренду лежить на складі

SELECT sum(quantity), brand
FROM products
GROUP BY brand;


-- Скільки окремих сутностей (моделей) лежить на складі?

SELECT count(*), brand
FROM products
GROUP BY brand;


-- Таска: середня ціна всіх телефонів на складі
SELECT avg(price)
FROM products;


-- Таска середня ціна кожного бренду
SELECT avg(price), brand
FROM products 
GROUP BY brand;


--- Бренд, в якого найменша середня ціна по всіх телефонах 
SELECT min(pwa.average)
FROM (
    SELECT avg(price) AS average, brand
    FROM products 
    GROUP BY brand
) AS pwa;

-- ДОРОБИТИ ЦЮ ТАСКУ з WITH



--- Кількість замовлень кожного користувача, який робив замовлення
 
SELECT count(*), customer_id 
FROM orders
GROUP BY customer_id;

-- Середню кількість замовлень по всіх юзерах

SELECT avg(owq.quantity)
FROM (SELECT count(*) AS quantity, customer_id 
FROM orders
GROUP BY customer_id) AS owq;


--- Середня вартість телефонів в діапазоні цін від 1к до 2к

SELECT avg(price)
FROM products
WHERE price BETWEEN 1000 AND 2000;


---- Вартість всього складу

SELECT sum(price * quantity)
FROM products;
