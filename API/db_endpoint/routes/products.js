require('mysql/sql_conn.js');

var express = require('express');
var router = express.Router();


connection.connect();

connection.query('SELECT * FROM City', function (error, results, fields) {
  if (error) throw error;
  console.log(results);
  router.get('/products', function(req, res, next) {
  res.render('products', { title: result });
  module.exports = router;
 });
});

connection.end();




