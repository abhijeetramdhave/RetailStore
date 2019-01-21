CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `address_line3` varchar(255) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `party` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(25) NOT NULL,
  `class` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gstin` varchar(25) DEFAULT NULL,
  `pan` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6581AE6118C5BC8` (`address_id`),
  CONSTRAINT `FK6581AE6118C5BC8` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `counter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `attendant_id` bigint(20) DEFAULT NULL,
  `code` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK391755FCCBB8EA65` (`store_id`),
  KEY `FK391755FCFD333094` (`attendant_id`),
  CONSTRAINT `FK391755FCCBB8EA65` FOREIGN KEY (`store_id`) REFERENCES `party` (`id`),
  CONSTRAINT `FK391755FCFD333094` FOREIGN KEY (`attendant_id`) REFERENCES `party` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK302BCFED4B9638A` (`parent_id`),
  CONSTRAINT `FK302BCFED4B9638A` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `company` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(19,2) NOT NULL,
  `product_code` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKED8DCCEFB4FB5EB6` (`category_id`),
  CONSTRAINT `FKED8DCCEFB4FB5EB6` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tax` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `from_date` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tax_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `category_to_tax` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `percent_value` decimal(19,2) NOT NULL,
  `tax_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD2C78E482198F8DE` (`category_id`),
  KEY `FKD2C78E4812CE3DF3` (`tax_id`),
  CONSTRAINT `FKD2C78E4812CE3DF3` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`),
  CONSTRAINT `FKD2C78E482198F8DE` FOREIGN KEY (`category_id`) REFERENCES `tax_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA0303E4E2198F8DE` (`category_id`),
  KEY `FKA0303E4E2746FA1E` (`product_id`),
  CONSTRAINT `FKA0303E4E2198F8DE` FOREIGN KEY (`category_id`) REFERENCES `tax_category` (`id`),
  CONSTRAINT `FKA0303E4E2746FA1E` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tax_levied` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `bill_item_id` bigint(20) NOT NULL,
  `percent_value` decimal(19,2) NOT NULL,
  `tax_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF0443A9F12CE3DF3` (`tax_id`),
  KEY `FKF0443A9F993064D3` (`bill_item_id`),
  CONSTRAINT `FKF0443A9F12CE3DF3` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`),
  CONSTRAINT `FKF0443A9F993064D3` FOREIGN KEY (`bill_item_id`) REFERENCES `bill_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `bill_date` datetime NOT NULL,
  `bill_number` varchar(25) NOT NULL,
  `counter_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `net_amount` decimal(19,2) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `total_amount` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E24071BDBEC8` (`counter_id`),
  KEY `FK2E24077537F02C` (`customer_id`),
  KEY `FK2E2407CBB8EA65` (`store_id`),
  CONSTRAINT `FK2E24071BDBEC8` FOREIGN KEY (`counter_id`) REFERENCES `counter` (`id`),
  CONSTRAINT `FK2E24077537F02C` FOREIGN KEY (`customer_id`) REFERENCES `party` (`id`),
  CONSTRAINT `FK2E2407CBB8EA65` FOREIGN KEY (`store_id`) REFERENCES `party` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

