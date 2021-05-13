const mongoose = require('mongoose');

const productsSchema = new mongoose.Schema({
  id: Number,
  name: String,
  slogan: String,
  description: String,
  category: String,
  default_price: Number,
  features: [{
    feature: String,
    value: String
    }]
});


const productStyles = new mongoose.Schema({
  id: Number,
  results: [{
      id: Number,
      name: String,
      original_price: Number,
      sales_price: Number,
      "default?": Boolean,
      photos: [{
          thumbnail_url: String,
          url: String
        }],
      skus: {
                 number: "37": {
                            "quantity": 8,
                            "size": "XS"
                    },
                    "38": {
                            "quantity": 16,
                            "size": "S"
                    },
                    "39": {
                            "quantity": 17,
                            "size": "M"
                    },
            //...
                }
    }
})

const relatedProduct = new mongoose.Schema({
  id: Number,
  related: [Number]
})