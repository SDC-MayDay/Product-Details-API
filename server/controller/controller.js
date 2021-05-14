const model = require('../models/model.js');

const getProducts = (req, res) => {
  model.getProducts((err, data) => {
    if (err) {
      //console.log('this is an error')
      res.status(400).send(err);
    } else {
      //console.log('this is a success', data)
      res.status(200).send(data);
    }
  })
}

const getProduct = (req, res) => {

  const { product_id } = req.params;

  model.getProduct(product_id, (err, data) => {
    if (err) {

      res.status(400).send(err);
    } else {

      res.status(200).send(data);
    }
  })
}

const getProductRelated = (req, res) => {
  const { product_id } = req.params;

  model.getProductRelated(product_id, (err, data) => {
    if (err) {

      res.status(400).send(err);
    } else {

      res.status(200).send(data);
    }
  })
}

module.exports = {
  getProducts,
  getProduct,
  getProductRelated
}