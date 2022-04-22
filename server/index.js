const pool = require('../database/index.js');
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.listen(3000, () => {
  console.log('server is listening');
})

pool.connect();

app.get('/products', (req, res) => {
  var page = req.params.page || 1;
  var count = req.params.count || 5;
  var offset = (page - 1) * count;

  pool.query(`SELECT * FROM product LIMIT ${count} OFFSET ${offset}`, (err, result) => {
    if(err) {
      console.log(err);
    } else {
      res.status(200).send(result.rows);
    }
  });
  pool.end;
})

app.get('/products/:product_id', (req, res) => {

  pool.query(`SELECT * FROM product LEFT JOIN features on product.id = ${req.params.product_id} WHERE features.product_id = ${req.params.product_id}`, (err, result) => {
    if(err) {
      console.log(err);
    } else {
      res.status(200).send(result.rows);
    }
  });
  pool.end;
})
