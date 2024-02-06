/* Умовні конструкції */

/*
Синтаксис 1:

CASE
    WHEN (умова1) THEN результат1
    WHEN (умова2) THEN результат2
    WHEN (умова3) THEN результат3
    ELSE
        результат 4
END

CASE (умова)
    WHEN (значення1) THEN результат1
    WHEN (значення2) THEN результат2
    WHEN (значення3) THEN результат3
    ELSE результат4    
END

*/

-- Витягти всіх юзерів з їхньою кількістю замовлень


SELECT u.*, count(*) AS order_count 
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id;


-- Якщо у юзера > 3 замовлень, то він "постійний клієнт", якщо від 1 до 3 - клієнт, якщо 0 - новий клієнт


SELECT u.id, u.email, (
    CASE 
        WHEN count(o.id) > 3 THEN 'regular client'
        WHEN count(o.id) BETWEEN 1 AND 3 THEN 'client'
        ELSE 'new client'
    END
) AS "client_status"
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id
ORDER BY count(o.id) ASC;


--- Вивести всі телефони з їхньою вартістю. Зробити новий стовбець "бюджет" - якщо телефон дорожче ніж середня вартість телефонів на складі - вивести "дорогий", якщо дешевше - вивести "дешевий"

SELECT  id, model, brand, price
FROM products;

-- середня вартість

SELECT avg(price)
FROM products; --5246



WITH avg_price AS (
    SELECT avg(price) AS ap
    FROM products
)
SELECT  id, model, brand, price, (
    CASE
        WHEN price > avg_price.ap THEN 'high'
        ELSE 'low'
    END
) AS budget
FROM products, avg_price;


/*
WITH temporaryTable(averageValue) as (
  SELECT avg(price) FROM products
)
SELECT products.price, (CASE
WHEN products.price>temporaryTable.averageValue THEN 'expensive'
ELSE 'chip'
END) as budget
FROM products, temporaryTable

*/


---- Кастомні типи даних ----

--- Задача: переробити стовбець "статус" таблиці orders з boolean на перераховувану множину
'new', 'processing', 'delivery', 'done'
-- ENUM - enumerable, перераховувана множина

DROP TYPE status;
DROP TABLE c;

CREATE TYPE order_status AS ENUM ('new', 'processing', 'delivery', 'done'); 


CREATE TABLE c (
    id serial PRIMARY KEY,
    info status
);


ALTER TABLE orders
ALTER COLUMN status TYPE order_status USING (
        CASE status
            WHEN false THEN 'new'
            WHEN true THEN 'done'
            ELSE 'processing'
        END
)::order_status; --- стається помилка через те, що дефолтне значення стовпця неможна автоматично конвертувати


--- Рішення:
-- дропнути дефолт
-- змінити таблицю (кастувати автоматично по ходу)
-- створити нове дефолтне правило для таблиці

ALTER TABLE orders
ALTER COLUMN status DROP DEFAULT;



INSERT INTO orders (customer_id, status)
VALUES (2,
    'delivery');

ALTER TABLE orders
ALTER COLUMN status SET DEFAULT 'new';