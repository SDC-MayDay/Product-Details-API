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

const getProductRelated = (product_id, callback) => {
  const q = `Select * FROM related WHERE id_products = ${product_id}`;
  db.query(q, (err, data) => {
    if (err) {
      callback(err);
    } else {
      callback(null, data);
    }
  })
}

const getProductStyle = (product_id, callback) => {
  const q = `SELECT styles.*, photos.*, skus.* FROM styles INNER JOIN photos ON photos.id_styles = styles.id INNER JOIN skus ON skus.id_styles = styles.id WHERE styles.id_products = ${product_id}`;
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
  getProduct,
  getProductRelated,
  getProductStyle
}

