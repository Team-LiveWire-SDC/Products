const { Pool } = require('pg');
const config = require('../config.js');

const pool = new Pool({
  host: config.HOST,
  user: config.USER,
  port: config.PORT,
  password: config.PASSWORD,
  database: config.DATABASE
})

module.exports = pool
