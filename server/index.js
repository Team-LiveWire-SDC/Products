const pool = require('../database/index.js');
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.listen(3000, () => {
  console.log('server is listening');
})

pool.connect();

console.time('get products');
app.get('/products', (req, res) => {
  var page = req.query.page || 1;
  var count = req.query.count || 5;
  var offset = (page - 1) * count;

  pool.query(`EXPLAIN ANALYZE SELECT * FROM product LIMIT ${count} OFFSET ${offset}`, (err, result) => {
    if(err) {
      console.log(err);
    } else {
      res.status(200).send(result.rows);
    }
  });
  pool.end;
})
console.timeEnd('get products');

console.time('get product info');
app.get('/products/:product_id', (req, res) => {

  var sqlQuery = `EXPLAIN ANALYZE SELECT *, (SELECT json_agg(json_build_object(
    'feature', features.feature,
    'value', features.value
    ))
    FROM features WHERE features.product_id = ${req.params.product_id}
    )
    AS features
    FROM product
    WHERE product.id = ${req.params.product_id}`

  pool.query(sqlQuery, (err, result) => {
    if(err) {
      console.log(err);
    } else {
      res.status(200).send(result.rows);
    }
  });
  pool.end;
})
console.timeEnd('get product info');

console.time('get product styles');

app.get('/products/:product_id/styles', (req, res) => {

  var sqlQuery = `EXPLAIN ANALYZE SELECT id AS product_id,
    (SELECT json_agg(json_build_object(
        'style_id', styles.id,
        'name', styles.name,
        'original_price', styles.original_price,
        'sale_price', styles.default_style,
        'default?', styles.default_style,
        'photos', (SELECT json_agg(json_build_object(
          'thumbnail_url', photos.thumbnail_url,
          'url', photos.url
        )
        )
        FROM photos
        WHERE photos.styleId = styles.id
        ),
        'skus', (SELECT json_object_agg(skus.id, json_build_object(
          'quantity', skus.quantity,
          'size', skus.size
        )
      )
        FROM skus
        WHERE skus.styleId = styles.id
    )
    )
    )
    FROM styles
    WHERE styles.productId = ${req.params.product_id}
    )
  AS results
  FROM product
  WHERE id = ${req.params.product_id}`;

  pool.query(sqlQuery, (err, result) => {
    if(err) {
      console.log(err);
      res.end;
    } else {
      res.status(200).send(result.rows);
    }
  });
  pool.end;
})

console.timeEnd('get product styles');

console.time('get product related');
app.get('/products/:product_id/related', (req, res) => {

  pool.query(`EXPLAIN ANALYZE SELECT json_agg(related.related_product_id) FROM related WHERE related.current_product_id = ${req.params.product_id}`, (err, result) => {
    if(err) {
      console.log(err);
    } else {
      res.status(200).send(result.rows[0].json_agg);
    }
  });
  pool.end;
})

console.timeEnd('get product related');
