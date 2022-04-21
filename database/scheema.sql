DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` INTEGER NULL DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `slogan` VARCHAR NULL DEFAULT NULL,
  `description` VARCHAR NULL DEFAULT NULL,
  `category` VARCHAR NULL DEFAULT NULL,
  `default_price` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `features`;

CREATE TABLE `features` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `feature` VARCHAR NULL DEFAULT NULL,
  `value` VARCHAR NULL DEFAULT NULL,
  `product_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `styles`;

CREATE TABLE `styles` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `sale_price` DECIMAL NULL DEFAULT NULL,
  `default`  NULL DEFAULT NULL,
  `original_price` DECIMAL NULL DEFAULT NULL,
  `product_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `product_id`)
);

DROP TABLE IF EXISTS `skus`;

CREATE TABLE `skus` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `quantity` INTEGER NULL DEFAULT NULL,
  `size` VARCHAR NULL DEFAULT NULL,
  `styles_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `styles_id` INTEGER NULL DEFAULT NULL,
  `thumbnail_url` VARCHAR NULL DEFAULT NULL,
  `url` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `related`;

CREATE TABLE `related` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `product_id` INTEGER NULL DEFAULT NULL,
  `related_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `features` ADD FOREIGN KEY (product_id) REFERENCES `product` (`id`);
ALTER TABLE `styles` ADD FOREIGN KEY (product_id) REFERENCES `product` (`id`);
ALTER TABLE `skus` ADD FOREIGN KEY (styles_id) REFERENCES `styles` (`id`);
ALTER TABLE `photos` ADD FOREIGN KEY (styles_id) REFERENCES `styles` (`id`);
ALTER TABLE `related` ADD FOREIGN KEY (product_id) REFERENCES `product` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `product` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `related` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `product` (`id`,`name`,`slogan`,`description`,`category`,`default_price             `) VALUES
-- ('','','','','','');
-- INSERT INTO `features` (`id`,`feature`,`value`,`product_id`) VALUES
-- ('','','','');
-- INSERT INTO `styles` (`id`,`name`,`sale_price`,`default`,`original_price`,`product_id`) VALUES
-- ('','','','','','');
-- INSERT INTO `skus` (`id`,`quantity`,`size`,`styles_id`) VALUES
-- ('','','','');
-- INSERT INTO `photos` (`id`,`styles_id`,`thumbnail_url`,`url`) VALUES
-- ('','','','');
-- INSERT INTO `related` (`id`,`product_id`,`related_id`) VALUES
-- ('','','');