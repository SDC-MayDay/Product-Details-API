const db = require('../../database')

const getProducts = (callback) => {
  const q = 'Select * FROM products';

   db.query(q, (err, data) => {
    if (err) {
      callback(err);
    } else {
      callback(null, data);
    }
  })
}

const getProduct = (product_id, callback) => {

  const q = `Select * FROM products WHERE id = ${product_id}`;

   db.query(q, (err, data) => {
    if (err) {
      callback(err);
    } else {
      callback(null, data);
    }
  })
}

module.exports = {
  getProducts,
  getProduct
}