-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS sdc;
CREATE DATABASE sdc;
USE sdc;

-- ---
-- Table 'products'
--
-- ---

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` INTEGER  NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `slogan` VARCHAR(250) NULL DEFAULT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `category` VARCHAR(25) NULL DEFAULT NULL,
  `default_price` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'related'
--
-- ---

DROP TABLE IF EXISTS `related`;

CREATE TABLE `related` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `related_product_id` INTEGER NULL DEFAULT NULL,
  `id_products` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'features'
--
-- ---

DROP TABLE IF EXISTS `features`;

CREATE TABLE `features` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_products` INTEGER NOT NULL,
  `feature` VARCHAR(50) NULL DEFAULT NULL,
  `value` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'styles'
--
-- ---

DROP TABLE IF EXISTS `styles`;

CREATE TABLE `styles` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_products` INTEGER NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `sale_price` INTEGER NULL DEFAULT NULL,
  `original_price` INTEGER NULL DEFAULT NULL,
  `default_style` INTEGER NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'photos'
--
-- ---

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_styles` INTEGER NOT NULL,
  `thumbnail_url` VARCHAR(200) NULL DEFAULT NULL,
  `url` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'skus'
-- ---

DROP TABLE IF EXISTS `skus`;

CREATE TABLE `skus` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `quantity` INTEGER NOT NULL,
  `size` VARCHAR(5) NULL DEFAULT NULL,
  `id_styles` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `related` ADD FOREIGN KEY (id_products) REFERENCES `products` (`id`);
ALTER TABLE `features` ADD FOREIGN KEY (id_products) REFERENCES `products` (`id`);
ALTER TABLE `styles` ADD FOREIGN KEY (id_products) REFERENCES `products` (`id`);
ALTER TABLE `photos` ADD FOREIGN KEY (id_styles) REFERENCES `styles` (`id`);
ALTER TABLE `skus` ADD FOREIGN KEY (id_styles) REFERENCES `styles` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `related` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `feature` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `product_styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `products` (`product_id`,`name`,`slogan`,`description`,`category`,`default_price`) VALUES
-- ('','','','','','');
-- INSERT INTO `related` (`id`,`related_product_id`,`product_id_products`) VALUES
-- ('','','');
-- INSERT INTO `features` (`id`,`product_id_products`,`value`) VALUES
-- ('','','');
-- INSERT INTO `feature` (`id`,`feature`,`id_features`) VALUES
-- ('','','');
-- INSERT INTO `product_styles` (`id`,`product_id_products`) VALUES
-- ('','');
-- INSERT INTO `styles` (`id`,`id_product_styles`,`name`,`original_price`,`sale_price`,`default?`) VALUES
-- ('','','','','','');
-- INSERT INTO `photos` (`id`,`id_styles`,`thumbnail_url`,`url`) VALUES
-- ('','','','');
-- INSERT INTO `skus` (`id`,`quantity`,`size`,`id_styles`) VALUES
-- ('','','','');

-- ---
-- Load Data
-- ---

-- ---
-- Products
-- ---

LOAD DATA LOCAL INFILE './csv/product.csv'
INTO TABLE products FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  id,
  name,
  slogan,
  description,
  category,
  default_price
);

-- ---
-- related
-- ---

LOAD DATA LOCAL INFILE './csv/related.csv'
INTO TABLE related FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  id,
  id_products,
  related_product_id
);

-- ---
-- features data
-- ---

LOAD DATA LOCAL INFILE './csv/features.csv'
INTO TABLE features FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  id,
  id_products,
  feature,
  value
);

-- ---
-- styles data
-- ---

LOAD DATA LOCAL INFILE './csv/styles.csv'
INTO TABLE styles FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  id,
  id_products,
  name,
  sale_price,
  original_price,
  default_style
);

-- ---
-- photos data
-- ---

LOAD DATA LOCAL INFILE './csv/photos.csv'
INTO TABLE photos FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  id,
  id_styles,
  thumbnail_url,
  url
);

-- ---
-- skus data
-- ---

LOAD DATA LOCAL INFILE './csv/skus.csv'
INTO TABLE skus FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  id,
  id_styles,
  size,
  quantity
);