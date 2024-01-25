const {Client} = require('pg');
const User = require('./User');
const Phone = require('./Phone');

const config = {
    user: 'postgres',
    password: '718',
    host: 'localhost',
    port: 5432,
    database: 'pfm_postgres_first'
}

const client = new Client(config);

User._client = client;
User._tableName = 'users';

Phone._client = client;
Phone._tableName = 'products';


module.exports = {
    User,
    Phone,
    client
}