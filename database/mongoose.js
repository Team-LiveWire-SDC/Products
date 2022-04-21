const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/fetcher', {useNewUrkParser: true});

let product = new mongoose.schema({
  id: 'number',
  name: 'string',
  slogan: 'string',
  description: 'string',
  category: 'string',
  default_price: 'number',
  features: [
              {
                feature: 'string',
                value: 'number'
                },
            ],
  styles: [
            {
              product_id: 'number',
              results: [
                         {
                            style_id: 'number',
                            name: 'string',
                            original_price: 'number',
                            sale_price: 'number',
                            default: 'string'
                            photos: [
                                      {
                                        thumbnail_url: 'string',
                                        url: 'string'
                                       }
                                    ],
                            skus: {
                                    37: {
                                      quantity: 'number',
                                      size: 'string'
                                    }
                                  }
                          }
                        ],
             },
          ],
  related: [num, num, num, num]
})