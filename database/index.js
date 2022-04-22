const { Pool } = require('pg');

const pool = new Pool({
  host: 'localhost',
  user: 'CaseyEads',
  port: '5432',
  password: '',
  database: 'overview'
})

module.exports = pool