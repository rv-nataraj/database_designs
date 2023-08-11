/* create a database */

DROP DATABASE IF EXISTS skfp;
CREATE DATABASE skfp;
USE skfp;

/*  create tables */

CREATE TABLE skfp.`batch_master` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `manufactured_date` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
);

CREATE TABLE skfp.`item_master` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `package_id` int(10) unsigned DEFAULT NULL,
  `quantity` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`)
);

CREATE TABLE skfp.`items_returned` (
  `return_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `quantity_returned` int(11) DEFAULT NULL,
  PRIMARY KEY (`return_id`)
);

CREATE TABLE skfp.`items_supplied` (
  `supply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned DEFAULT NULL,
  `shop_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`supply_id`)
);

CREATE TABLE skfp.`package_master` (
  `package_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_type` varchar(100)  DEFAULT NULL,
  PRIMARY KEY (`package_id`)
);

CREATE TABLE skfp.`product_master` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100)  DEFAULT NULL,
  `shelf_life` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`product_id`)
);

CREATE TABLE skfp.`shop_master` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(100)  DEFAULT NULL,
  `address_line1` varchar(100)  DEFAULT NULL,
  `address_line2` varchar(100)  DEFAULT NULL,
  `address_line3` varchar(100)  DEFAULT NULL,
  `pincode` varchar(6)  DEFAULT NULL,
  `contact_no` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
);

/*  Add appropriate foreign keys  */

ALTER TABLE `skfp`.`item_master` ADD FOREIGN KEY (`package_id`) REFERENCES `skfp`.`package_master`(`package_id`);
ALTER TABLE `skfp`.`batch_master` ADD FOREIGN KEY (`product_id`) REFERENCES `skfp`.`product_master`(`product_id`);
ALTER TABLE `skfp`.`items_supplied` ADD FOREIGN KEY (`shop_id`) REFERENCES `skfp`.`shop_master`(`shop_id`);
ALTER TABLE `skfp`.`item_master` ADD FOREIGN KEY (`batch_id`) REFERENCES `skfp`.`batch_master`(`batch_id`);


/* include WHO columns and Soft Delete Attributes */

ALTER TABLE skfp.`batch_master` ADD COLUMN (
  `record_status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`item_master` ADD COLUMN (
  `record_status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`items_returned` ADD COLUMN (
  `record_status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`items_supplied` ADD COLUMN (
  `record_status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`package_master` ADD COLUMN (
  `record_status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`product_master` ADD COLUMN (
  `record_status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`shop_master` ADD COLUMN (
  `record_status` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);


