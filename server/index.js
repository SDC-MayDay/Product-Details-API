const express = require('express');

const app = express();
const PORT = 3000;
const db = require('../database')

const controller = require('./controller/controller.js')
const bodyParser = require('body-parser')
const path = require('path')

app.use(bodyParser.urlencoded({extended: true}))

app.get('/products', (req, res) => {
  console.log('request recieved')
  controller.getProducts(req, res);
});

app.get('/products/:product_id', (req, res) => {
  //console.log(req.params)
  controller.getProduct(req, res);
});
app.get('/products/:product_id/styles', (req, res) => {
  controller.getProductStyles(req, res);
});
app.get('/products/:product_id/related', (req, res) => {
  controller.getProductRelated(req, res);
});

app.listen(PORT, () => {
  console.log(`listening on port ${PORT}`);
});
