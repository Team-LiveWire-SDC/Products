const { Pool } = require('pg');

const pool = new Pool({
  host: '13.52.163.0',
  user: 'CaseyEads',
  port: '5432',
  password: 'dcajk4543^&%$',
  database: 'overview'
})

module.exports = pool