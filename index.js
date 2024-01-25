const {getUsers} = require('./api/getUsers');
const {User, client} = require('./models');

async function start() {

    // робимо підключення до БД

    await client.connect();


    // робимо роботу
    const userArray = await getUsers();
    // просимо модель зганяти запитом до БД
    const result  = await User.bulkCreate(userArray);

     console.log(result);


    // перед тим, як наш код закінчить роботу - маємо закрити коннешн
    await client.end()

}

start();