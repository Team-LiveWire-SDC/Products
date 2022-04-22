DROP TABLE IF EXISTS product CASCADE;

-- I used this to load my data into my DB
-- COPY question
-- FROM 'absolute path to csv file'
-- DELIMITER ',' CSV HEADER;
-- in Server/index.js you'll find the start of my "t" with query attempts

CREATE TABLE product (
  id INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  slogan VARCHAR(300) NOT NULL,
  description VARCHAR(500) NOT NULL,
  category VARCHAR(300) NOT NULL,
  default_price INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS features;

CREATE TABLE features (
  id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  feature VARCHAR(100) NOT NULL,
  value VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS styles CASCADE;

CREATE TABLE styles (
  id INTEGER UNIQUE NOT NULL,
  productId INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  sale_price VARCHAR(5),
  original_price INTEGER NOT NULL,
  default_style INTEGER NOT NULL,
  PRIMARY KEY (id, productId)
);

DROP TABLE IF EXISTS skus;

CREATE TABLE skus (
  id INTEGER NOT NULL,
  styleId INTEGER NOT NULL,
  size VARCHAR(15) NOT NULL,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id INTEGER NOT NULL,
  styleId INTEGER NOT NULL,
  url VARCHAR(200) NOT NULL,
  thumbnail_url VARCHAR(200) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS related;

CREATE TABLE related (
  id INTEGER NOT NULL,
  current_product_id INTEGER NOT NULL,
  related_product_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES product (id);
ALTER TABLE styles ADD FOREIGN KEY (productId) REFERENCES product (id);
ALTER TABLE skus ADD FOREIGN KEY (styleId) REFERENCES styles (id);
ALTER TABLE photos ADD FOREIGN KEY (styleId) REFERENCES styles (id);
ALTER TABLE related ADD FOREIGN KEY (current_product_id) REFERENCES product (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE product ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE features ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE styles ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE skus ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE photos ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE related ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO product (id,name,slogan,description,category,default_price             ) VALUES
-- ('','','','','','');
-- INSERT INTO features (id,feature,value,productId) VALUES
-- ('','','','');
-- INSERT INTO styles (id,name,sale_price,default,original_price,productId) VALUES
-- ('','','','','','');
-- INSERT INTO skus (id,quantity,size,styleId) VALUES
-- ('','','','');
-- INSERT INTO photos (id,styleId,thumbnail_url,url) VALUES
-- ('','','','');
-- INSERT INTO related (id,productId,related_id) VALUES
-- ('','','');