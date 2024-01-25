const {Client} = require('pg');

const config = {
    user: 'postgres',
    password: '718',
    host: 'localhost',
    port: 5432,
    database: 'pfm_postgres_first'
}

async function start() {

    // робимо підключення до БД
    const client = new Client(config);

    await client.connect();

    const user = {
        id: 1,
        first_name: 'Nick',
        last_name: 'Row',
        birthdate: '1990-01-01',
        email: 'fdsfdfd@sf',
        password: 'fsdafsdaf',
        height: 3.10,
        is_subscribe: false
      };

    // робимо роботу
        // Таска: написати insert-запит на вставку юзера в БД
        const query = `INSERT INTO users (first_name, last_name, birthdate, email, password, height, is_subscribe) VALUES ('${user.first_name}', '${user.last_name}', '${user.birthdate}', '${user.email}', '${user.password}', ${user.height}, ${user.is_subscribe});`
    const result = await client.query(query);

    console.log(result);


    // перед тим, як наш код закінчить роботу - маємо закрити коннешн
    await client.end()

}

start();