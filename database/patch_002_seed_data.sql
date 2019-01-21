INSERT INTO address (
	id, VERSION, address_line1, address_line2, address_line3,
	city, country, state, zip_code
) VALUES (
	1, 1, 'CB/2/001, Empire Estate', 'Old Pune Mumbai Highway', 'Near Ranka Jewellers, Pimpri Chinchwad',
	'Pune', 'India', 'Maharashtra', '411019'
);

INSERT INTO address (
	id, VERSION, address_line1, address_line2, address_line3,
	city, country, state, zip_code
) VALUES (
	2, 1, 'C7/304, Royal Park', 'DAV Road', 'Near Parihar Chowk, Aundh',
	'Pune', 'India', 'Maharashtra', '411007'
);

INSERT INTO party (
	id, VERSION, address_id, email_address, mobile_number,
	class, NAME, gstin, pan
) VALUES (
 	1, 1, 1, 'support@kalpavruksha.com', '02067123131',
	'com.retailstore.core.RetailStore', 'Kalpavruksha Sales', '27AALPC5080F1ZU', 'ABJPG3070E'
);

INSERT INTO party (
	id, VERSION, address_id, email_address, mobile_number,
	class, NAME
) VALUES (
 	2, 1, 2, 'Pankaj.Sarmane@gmail.com', '9870454573',
	'com.retailstore.core.Customer', 'Pankaj Sarmane'
);

INSERT INTO counter (
	id, VERSION, attendant_id, CODE, NAME, store_id
) VALUES (
	1, 1, NULL, 'ONLINE', 'Online', 1
);


INSERT INTO category (id, VERSION, NAME)
VALUES (1, 1, 'Computers & Accessaries'), (2, 1, 'Electronics'), (3, 1, 'Office Products');


INSERT INTO product (
	id, VERSION, category_id, company, description, price, product_code
) VALUES (
	1, 1, 1, 'SanDisk', 'SanDisk Ultra DUAL 64GB USB 3.0 OTG Pen Drive', 750.00, '10001'
);

INSERT INTO product (
	id, VERSION, category_id, company, description, price, product_code
) VALUES (
	2, 1, 1, 'HP', 'HP USB 2.0 Flash Drive 16GB v152w', 399.00, '10002'
);

INSERT INTO product (
	id, VERSION, category_id, company, description, price, product_code
) VALUES (
	3, 1, 2, 'Avan', 'Avan Portable AND Bendable Silicone Mini USB Keyboard LED Light', 150.00, '10003'
);

INSERT INTO product (
	id, VERSION, category_id, company, description, price, product_code
) VALUES (
	4, 1, 3, 'Cello', 'Cello Signature Carbon Ball Pen', 140.00, '10004'
);

INSERT INTO product (
	id, VERSION, category_id, company, description, price, product_code
) VALUES (
	5, 1, 2, 'Reynolds', 'Reynolds 045 Ball Pen - Black, Pack of 10', 34.00, '10005'
);

INSERT INTO product (
	id, VERSION, category_id, company, description, price, product_code
) VALUES (
	6, 1, 2, 'SEPAL', 'SEPAL Ring Binder FILE, 2D A4 Size Tough & Durable A4 Size Ring Binder Box Board FILE (Blue) -4pk', 260.00, '10006'
);

INSERT INTO tax (
	id, VERSION, from_date, NAME, to_date
) VALUES (
	1, 1, '2000-01-01', 'Sales Tax', '2019-03-31'
);

INSERT INTO tax (
	id, VERSION, from_date, NAME, to_date
) VALUES (
	2, 1, '2019-04-01', 'CGST', NULL
);

INSERT INTO tax (
	id, VERSION, from_date, NAME, to_date
) VALUES (
	3, 1, '2019-04-01', 'SGST', NULL
);


INSERT INTO tax_category (id, VERSION, NAME)
VALUES (1, 1, 'Category A'), (2, 1, 'Category B'), (3, 1, 'Category C');


INSERT INTO category_to_tax (id, VERSION, category_id, percent_value, tax_id)
VALUES (1, 1, 1, 10, 1), (2, 1, 2, 20, 1), (3, 1, 3, 0, 1);


INSERT INTO product_category (id, VERSION, category_id, product_id)
VALUES (1, 1, 1, 1), (2, 1, 1, 2), (3, 1, 2, 3), (4, 1, 3, 4), (5, 1, 3, 5), (6, 1, 1, 6);

