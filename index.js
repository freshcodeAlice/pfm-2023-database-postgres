const {getUsers} = require('./api/getUsers');
const {User, client, Phone} = require('./models');
const {generatePhones} = require('./utils/generateProducts');

async function start() {

    // робимо підключення до БД

    await client.connect();


    // робимо роботу
//    const userArray = await getUsers();
    // просимо модель зганяти запитом до БД
 //   const result  = await User.bulkCreate(userArray);
    const phones = generatePhones(100);
    const result = await Phone.bulkCreate(phones);


    // перед тим, як наш код закінчить роботу - маємо закрити коннешн
    await client.end()

}

start();