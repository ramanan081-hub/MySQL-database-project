CREATE DATABASE sql_project;
use sql_project;


CREATE TABLE customers (                                          -- TABLE CERATE 
  customer_id INT NOT NULL, first_name  VARCHAR(50)  NOT NULL,
  last_name  VARCHAR(50)  NOT NULL, email VARCHAR(100) NOT NULL,
  city  VARCHAR(60)  NOT NULL, created_at  DATETIME     NOT NULL,
  CONSTRAINT pk_customers PRIMARY KEY (customer_id),
  CONSTRAINT uq_customers_email UNIQUE (email)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
  
CREATE INDEX ix_customers_city       ON customers(city);           -- HELPFUL INDEXES
CREATE INDEX ix_customers_created_at ON customers(created_at);



CREATE TABLE products (                                             -- TABLE CERATE 
  product_id   INT NOT NULL,
  sku          VARCHAR(40)  NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  category     VARCHAR(50)  NOT NULL,
  unit_price   DECIMAL(10,2) NOT NULL,
  CONSTRAINT pk_products PRIMARY KEY (product_id),
  CONSTRAINT uq_products_sku UNIQUE (sku)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

CREATE INDEX ix_products_category   ON products(category);             -- HELPFUL INDEXES
CREATE INDEX ix_products_unit_price ON products(unit_price);




CREATE TABLE orders (                                               -- TABLE CERATE 
  order_id    INT NOT NULL,
  customer_id INT NOT NULL,
  order_date  DATE NOT NULL,
  status      VARCHAR(20) NOT NULL,
  CONSTRAINT pk_orders PRIMARY KEY (order_id),
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;


CREATE INDEX ix_orders_customer   ON orders(customer_id);              -- HELPFUL INDEXES
CREATE INDEX ix_orders_order_date ON orders(order_date);
CREATE INDEX ix_orders_status     ON orders(status);



CREATE TABLE order_items (                                        -- TABLE CERATE 
  order_item_id INT NOT NULL,
  order_id      INT NOT NULL,
  product_id    INT NOT NULL,
  quantity      INT NOT NULL,
  unit_price    DECIMAL(10,2) NOT NULL,
  CONSTRAINT pk_order_items PRIMARY KEY (order_item_id),
  CONSTRAINT fk_order_items_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_order_items_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT uq_order_items_order_product UNIQUE (order_id, product_id)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
  

CREATE INDEX ix_order_items_product  ON order_items(product_id);          -- HELPFUL INDEXES



CREATE TABLE payments (                                                  -- TABLE CERATE 
  payment_id INT NOT NULL,
  order_id   INT NOT NULL,
  paid_at    DATETIME NOT NULL,
  amount     DECIMAL(10,2) NOT NULL,
  method     VARCHAR(20) NOT NULL,
  CONSTRAINT pk_payments PRIMARY KEY (payment_id),
  CONSTRAINT fk_payments_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;


CREATE INDEX ix_payments_order  ON payments(order_id);                           -- HELPFUL INDEXES
CREATE INDEX ix_payments_method ON payments(method);
CREATE INDEX ix_payments_paid   ON payments(paid_at);


ALTER TABLE payments ADD CONSTRAINT uq_payments_order UNIQUE (order_id);          -- ALTER TABLE




INSERT INTO customers (customer_id, first_name, last_name, email, city, created_at)   -- INSERT DATA 
VALUES
  (1, 'Arun', 'K', 'arun.k@example.com', 'Coimbatore', '2026-02-01 10:00:00'),
  (2, 'Bala', 'S', 'bala.s@example.com', 'Chennai', '2026-02-02 10:00:00'),
  (3, 'Chitra', 'R', 'chitra.r@example.com', 'Madurai', '2026-02-03 10:00:00'),
  (4, 'Divya', 'P', 'divya.p@example.com', 'Salem', '2026-02-04 10:00:00'),
  (5, 'Elan', 'T', 'elan.t@example.com', 'Erode', '2026-02-05 10:00:00'),
  (6, 'Farook', 'A', 'farook.a@example.com', 'Tiruppur', '2026-02-06 10:00:00'),
  (7, 'Geeta', 'V', 'geeta.v@example.com', 'Coimbatore', '2026-02-07 10:00:00'),
  (8, 'Hari', 'N', 'hari.n@example.com', 'Chennai', '2026-02-08 10:00:00'), 
  (9, 'Indu', 'J', 'indu.j@example.com', 'Madurai', '2026-02-09 10:00:00'),
  (10, 'Karthi', 'M', 'karthi.m@example.com', 'Salem', '2026-02-10 10:00:00'),
  (11, 'Lakshmi', 'K', 'lakshmi.k@example.com', 'Erode', '2026-02-11 10:00:00'),
  (12, 'Mohan', 'B', 'mohan.b@example.com', 'Tiruppur', '2026-02-12 10:00:00'),
  (13, 'Nisha', 'D', 'nisha.d@example.com', 'Coimbatore', '2026-02-13 10:00:00'),
  (14, 'Omkar', 'L', 'omkar.l@example.com', 'Chennai', '2026-02-14 10:00:00'),
  (15, 'Pooja', 'G', 'pooja.g@example.com', 'Madurai', '2026-02-15 10:00:00'),
  (16, 'Qadir', 'H', 'qadir.h@example.com', 'Salem', '2026-02-16 10:00:00'),
  (17, 'Ravi', 'T', 'ravi.t@example.com', 'Erode', '2026-02-17 10:00:00'),
  (18, 'Soumya', 'I', 'soumya.i@example.com', 'Tiruppur', '2026-02-18 10:00:00'),
  (19, 'Tarun', 'E', 'tarun.e@example.com', 'Coimbatore', '2026-02-19 10:00:00'),
  (20, 'Uma', 'R', 'uma.r@example.com', 'Chennai', '2026-02-20 10:00:00'),
  (21, 'Vijay', 'K', 'vijay.k@example.com', 'Madurai', '2026-02-21 10:00:00'),
  (22, 'Waseem', 'Z', 'waseem.z@example.com', 'Salem', '2026-02-22 10:00:00'),
  (23, 'Xavier', 'C', 'xavier.c@example.com', 'Erode', '2026-02-23 10:00:00'),
  (24, 'Yamini', 'S', 'yamini.s@example.com', 'Tiruppur', '2026-02-24 10:00:00'),
  (25, 'Zara', 'B', 'zara.b@example.com', 'Coimbatore', '2026-02-25 10:00:00'),
  (26, 'Abhinav', 'R', 'abhinav.r@example.com', 'Chennai', '2026-02-26 10:00:00'),
  (27, 'Bhavya', 'P', 'bhavya.p@example.com', 'Madurai', '2026-02-27 10:00:00'),
  (28, 'Chandan', 'U', 'chandan.u@example.com', 'Salem', '2026-02-28 10:00:00'),
  (29, 'Deepa', 'M', 'deepa.m@example.com', 'Erode', '2026-03-01 10:00:00'),
  (30, 'Eshwar', 'N', 'eshwar.n@example.com', 'Tiruppur', '2026-03-02 10:00:00'),
  (31, 'Fatima', 'Q', 'fatima.q@example.com', 'Coimbatore', '2026-03-03 10:00:00'),
  (32, 'Gokul', 'V', 'gokul.v@example.com', 'Chennai', '2026-03-04 10:00:00'),
  (33, 'Harini', 'S', 'harini.s@example.com', 'Madurai', '2026-03-05 10:00:00'),
  (34, 'Irfan', 'A', 'irfan.a@example.com', 'Salem', '2026-03-06 10:00:00'),
  (35, 'Jaya', 'T', 'jaya.t@example.com', 'Erode', '2026-03-07 10:00:00'),
  (36, 'Kiran', 'L', 'kiran.l@example.com', 'Tiruppur', '2026-03-08 10:00:00'),
  (37, 'Leela', 'P', 'leela.p@example.com', 'Coimbatore', '2026-03-09 10:00:00'),
  (38, 'Mahesh', 'Y', 'mahesh.y@example.com', 'Chennai', '2026-03-10 10:00:00'),
  (39, 'Nandini', 'J', 'nandini.j@example.com', 'Madurai', '2026-03-11 10:00:00'),
  (40, 'Oviya', 'E', 'oviya.e@example.com', 'Salem', '2026-03-12 10:00:00'),
  (41, 'Pranav', 'D', 'pranav.d@example.com', 'Erode', '2026-03-13 10:00:00'),
  (42, 'Ritika', 'F', 'ritika.f@example.com', 'Tiruppur', '2026-03-14 10:00:00'),
  (43, 'Sanjay', 'G', 'sanjay.g@example.com', 'Coimbatore', '2026-03-15 10:00:00'),
  (44, 'Tanvi', 'H', 'tanvi.h@example.com', 'Chennai', '2026-03-16 10:00:00'),
  (45, 'Uday', 'I', 'uday.i@example.com', 'Madurai', '2026-03-17 10:00:00'),
  (46, 'Varun', 'J', 'varun.j@example.com', 'Salem', '2026-03-18 10:00:00'),
  (47, 'Wasim', 'K', 'wasim.k@example.com', 'Erode', '2026-03-19 10:00:00'),
  (48, 'Xena', 'L', 'xena.l@example.com', 'Tiruppur', '2026-03-20 10:00:00'),
  (49, 'Yash', 'M', 'yash.m@example.com', 'Coimbatore', '2026-03-21 10:00:00'),
  (50, 'Zubin', 'N', 'zubin.n@example.com', 'Chennai', '2026-03-22 10:00:00');
  
  INSERT INTO products (product_id, sku, product_name, category, unit_price)           -- INSERT DATA
VALUES
  (101, 'SKU-PRD-101', 'Red T-Shirt',        'Apparel',     399.00),
  (102, 'SKU-PRD-102', 'Blue T-Shirt',       'Apparel',     429.00),
  (103, 'SKU-PRD-103', 'Coffee Mug',         'Home',        249.00),
  (104, 'SKU-PRD-104', 'Notebook A5',        'Stationery',  149.00),
  (105, 'SKU-PRD-105', 'Black T-Shirt',      'Apparel',     449.00),
  (106, 'SKU-PRD-106', 'Water Glass',        'Home',        129.00),
  (107, 'SKU-PRD-107', 'Gel Pen (Blue)',     'Stationery',   39.00),
  (108, 'SKU-PRD-108', 'Gel Pen (Black)',    'Stationery',   39.00),
  (109, 'SKU-PRD-109', 'Travel Mug',         'Home',        299.00),
  (110, 'SKU-PRD-110', 'Baseball Cap',       'Apparel',     299.00),
  (111, 'SKU-PRD-111', 'Hoodie Grey',        'Apparel',     799.00),
  (112, 'SKU-PRD-112', 'Hoodie Black',       'Apparel',     849.00),
  (113, 'SKU-PRD-113', 'Tote Bag',           'Home',        199.00),
  (114, 'SKU-PRD-114', 'Notebook A4',        'Stationery',  199.00),
  (115, 'SKU-PRD-115', 'Stickers Pack',      'Stationery',   59.00),
  (116, 'SKU-PRD-116', 'Ceramic Plate',      'Home',        349.00),
  (117, 'SKU-PRD-117', 'Poster (A3)',        'Stationery',  129.00),
  (118, 'SKU-PRD-118', 'Keychain',           'Home',         79.00),
  (119, 'SKU-PRD-119', 'Mouse Pad',          'Electronics', 199.00),
  (120, 'SKU-PRD-120', 'USB Cable C',        'Electronics', 249.00),
  (121, 'SKU-PRD-121', 'Wireless Mouse',     'Electronics', 799.00),
  (122, 'SKU-PRD-122', 'Laptop Sleeve 13"',  'Electronics', 999.00),
  (123, 'SKU-PRD-123', 'Phone Stand',        'Electronics', 299.00),
  (124, 'SKU-PRD-124', 'Desk Lamp',          'Home',        699.00),
  (125, 'SKU-PRD-125', 'Cushion Cover',      'Home',        249.00),
  (126, 'SKU-PRD-126', 'Socks (Pair)',       'Apparel',     149.00),
  (127, 'SKU-PRD-127', 'Scarf',              'Apparel',     349.00),
  (128, 'SKU-PRD-128', 'Cap (White)',        'Apparel',     299.00),
  (129, 'SKU-PRD-129', 'Thermos Bottle',     'Home',        799.00),
  (130, 'SKU-PRD-130', 'Notebook Dotted',    'Stationery',  179.00),
  (131, 'SKU-PRD-131', 'Highlighter Set',    'Stationery',  129.00),
  (132, 'SKU-PRD-132', 'Pen Set (5)',        'Stationery',  149.00),
  (133, 'SKU-PRD-133', 'Desk Organizer',     'Home',        599.00),
  (134, 'SKU-PRD-134', 'Cable Organizer',    'Electronics', 149.00),
  (135, 'SKU-PRD-135', 'Bluetooth Speaker',  'Electronics',1499.00),
  (136, 'SKU-PRD-136', 'Power Bank 10k',     'Electronics',1299.00),
  (137, 'SKU-PRD-137', 'Earbuds Wired',      'Electronics', 399.00),
  (138, 'SKU-PRD-138', 'Earbuds Wireless',   'Electronics',1999.00),
  (139, 'SKU-PRD-139', 'Coaster Set',        'Home',        149.00),
  (140, 'SKU-PRD-140', 'Wall Clock',         'Home',        899.00),
  (141, 'SKU-PRD-141', 'Office Chair Mat',   'Home',       1199.00),
  (142, 'SKU-PRD-142', 'Stapler',            'Stationery',  129.00),
  (143, 'SKU-PRD-143', 'Tape Dispenser',     'Stationery',  159.00),
  (144, 'SKU-PRD-144', 'Glue Stick',         'Stationery',   49.00),
  (145, 'SKU-PRD-145', 'Ruler (30cm)',       'Stationery',   39.00),
  (146, 'SKU-PRD-146', 'Marker Set',         'Stationery',  199.00),
  (147, 'SKU-PRD-147', 'T-Shirt Green',      'Apparel',     429.00),
  (148, 'SKU-PRD-148', 'T-Shirt Yellow',     'Apparel',     429.00),
  (149, 'SKU-PRD-149', 'Notebook Spiral',    'Stationery',  159.00),
  (150, 'SKU-PRD-150', 'Mug with Lid',       'Home',        349.00);
  
  INSERT INTO orders (order_id, customer_id, order_date, status)               -- INSERT DATA
VALUES
  (2001,  1, '2026-03-01', 'confirmed'),
  (2002,  2, '2026-03-02', 'shipped'),
  (2003,  3, '2026-03-03', 'pending'),
  (2004,  4, '2026-03-04', 'delivered'),
  (2005,  5, '2026-03-05', 'confirmed'),
  (2006,  6, '2026-03-06', 'shipped'),
  (2007,  7, '2026-03-07', 'pending'),
  (2008,  8, '2026-03-08', 'delivered'),
  (2009,  9, '2026-03-09', 'confirmed'),
  (2010, 10, '2026-03-10', 'pending'),
  (2011, 11, '2026-03-11', 'confirmed'),
  (2012, 12, '2026-03-12', 'shipped'),
  (2013, 13, '2026-03-13', 'pending'),
  (2014, 14, '2026-03-14', 'delivered'),
  (2015, 15, '2026-03-15', 'confirmed'),
  (2016, 16, '2026-03-16', 'shipped'),
  (2017, 17, '2026-03-17', 'pending'),
  (2018, 18, '2026-03-18', 'delivered'),
  (2019, 19, '2026-03-19', 'confirmed'),
  (2020, 20, '2026-03-20', 'pending'),
  (2021, 21, '2026-03-21', 'confirmed'),
  (2022, 22, '2026-03-22', 'shipped'),
  (2023, 23, '2026-03-23', 'pending'),
  (2024, 24, '2026-03-24', 'delivered'),
  (2025, 25, '2026-03-25', 'confirmed'),
  (2026, 26, '2026-03-26', 'shipped'),
  (2027, 27, '2026-03-27', 'pending'),
  (2028, 28, '2026-03-28', 'delivered'),
  (2029, 29, '2026-03-29', 'confirmed'),
  (2030, 30, '2026-03-30', 'pending'),
  (2031, 31, '2026-03-31', 'confirmed'),
  (2032, 32, '2026-04-01', 'shipped'),
  (2033, 33, '2026-04-02', 'pending'),
  (2034, 34, '2026-04-03', 'delivered'),
  (2035, 35, '2026-04-04', 'confirmed'),
  (2036, 36, '2026-04-05', 'shipped'),
  (2037, 37, '2026-04-06', 'pending'),
  (2038, 38, '2026-04-07', 'delivered'),
  (2039, 39, '2026-04-08', 'confirmed'),
  (2040, 40, '2026-04-09', 'pending'),
  (2041, 41, '2026-04-10', 'confirmed'),
  (2042, 42, '2026-04-11', 'shipped'),
  (2043, 43, '2026-04-12', 'pending'),
  (2044, 44, '2026-04-13', 'delivered'),
  (2045, 45, '2026-04-14', 'confirmed'),
  (2046, 46, '2026-04-15', 'shipped'),
  (2047, 47, '2026-04-16', 'pending'),
  (2048, 48, '2026-04-17', 'delivered'),
  (2049, 49, '2026-04-18', 'confirmed'),
  (2050, 50, '2026-04-19', 'pending');
  
  
  INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price)    -- INSERT DATA
VALUES
  (1, 2001, 101, 2, 399.00),
  (2, 2002, 102, 1, 429.00),
  (3, 2003, 103, 3, 249.00),
  (4, 2004, 104, 4, 149.00),
  (5, 2005, 105, 5, 449.00),
  (6, 2006, 106, 1, 129.00),
  (7, 2007, 107, 2,  39.00),
  (8, 2008, 108, 3,  39.00),
  (9, 2009, 109, 4, 299.00),
  (10,2010, 110, 5, 299.00),
  (11,2011, 111, 1, 799.00),
  (12,2012, 112, 2, 849.00),
  (13,2013, 113, 3, 199.00),
  (14,2014, 114, 4, 199.00),
  (15,2015, 115, 5,  59.00),
  (16,2016, 116, 1, 349.00),
  (17,2017, 117, 2, 129.00),
  (18,2018, 118, 3,  79.00),
  (19,2019, 119, 4, 199.00),
  (20,2020, 120, 5, 249.00),
  (21,2021, 121, 1, 799.00),
  (22,2022, 122, 2, 999.00),
  (23,2023, 123, 3, 299.00),
  (24,2024, 124, 4, 699.00),
  (25,2025, 125, 5, 249.00),
  (26,2026, 126, 1, 149.00),
  (27,2027, 127, 2, 349.00),
  (28,2028, 128, 3, 299.00),
  (29,2029, 129, 4, 799.00),
  (30,2030, 130, 5, 179.00),
  (31,2031, 131, 1, 129.00),
  (32,2032, 132, 2, 149.00),
  (33,2033, 133, 3, 599.00),
  (34,2034, 134, 4, 149.00),
  (35,2035, 135, 5,1499.00),
  (36,2036, 136, 1,1299.00),
  (37,2037, 137, 2, 399.00),
  (38,2038, 138, 3,1999.00),
  (39,2039, 139, 4, 149.00),
  (40,2040, 140, 5, 899.00),
  (41,2041, 141, 1,1199.00),
  (42,2042, 142, 2, 129.00),
  (43,2043, 143, 3, 159.00),
  (44,2044, 144, 4,  49.00),
  (45,2045, 145, 5,  39.00),
  (46,2046, 146, 1, 199.00),
  (47,2047, 147, 2, 429.00),
  (48,2048, 148, 3, 429.00),
  (49,2049, 149, 4, 159.00),
  (50,2050, 150, 5, 349.00);
  
  
  INSERT INTO payments (payment_id, order_id, paid_at, amount, method)          -- INSERT DATA
VALUES
  (9101, 2001, '2026-03-01 12:00:00', 2*399.00,  'UPI'),     
  (9102, 2002, '2026-03-02 12:00:00', 1*429.00,  'Card'),    
  (9103, 2003, '2026-03-03 12:00:00', 3*249.00,  'Cash'),   
  (9104, 2004, '2026-03-04 12:00:00', 4*149.00,  'UPI'),     
  (9105, 2005, '2026-03-05 12:00:00', 5*449.00,  'Card'),    
  (9106, 2006, '2026-03-06 12:00:00', 1*129.00,  'Cash'),   
  (9107, 2007, '2026-03-07 12:00:00', 2* 39.00,  'UPI'),   
  (9108, 2008, '2026-03-08 12:00:00', 3* 39.00,  'Card'),    
  (9109, 2009, '2026-03-09 12:00:00', 4*299.00,  'Cash'),    
  (9110, 2010, '2026-03-10 12:00:00', 5*299.00,  'UPI'),     
  (9111, 2011, '2026-03-11 12:00:00', 1*799.00,  'Card'),    
  (9112, 2012, '2026-03-12 12:00:00', 2*849.00,  'Cash'),   
  (9113, 2013, '2026-03-13 12:00:00', 3*199.00,  'UPI'),     
  (9114, 2014, '2026-03-14 12:00:00', 4*199.00,  'Card'),    
  (9115, 2015, '2026-03-15 12:00:00', 5* 59.00,  'Cash'),    
  (9116, 2016, '2026-03-16 12:00:00', 1*349.00,  'UPI'),     
  (9117, 2017, '2026-03-17 12:00:00', 2*129.00,  'Card'),   
  (9118, 2018, '2026-03-18 12:00:00', 3* 79.00,  'Cash'),   
  (9119, 2019, '2026-03-19 12:00:00', 4*199.00,  'UPI'),   
  (9120, 2020, '2026-03-20 12:00:00', 5*249.00,  'Card'),  
  (9121, 2021, '2026-03-21 12:00:00', 1*799.00,  'Cash'),  
  (9122, 2022, '2026-03-22 12:00:00', 2*999.00,  'UPI'),    
  (9123, 2023, '2026-03-23 12:00:00', 3*299.00,  'Card'),   
  (9124, 2024, '2026-03-24 12:00:00', 4*699.00,  'Cash'),  
  (9125, 2025, '2026-03-25 12:00:00', 5*249.00,  'UPI'),
  (9126, 2026, '2026-03-26 12:00:00', 1*149.00,  'Card'),   
  (9127, 2027, '2026-03-27 12:00:00', 2*349.00,  'Cash'),  
  (9128, 2028, '2026-03-28 12:00:00', 3*299.00,  'UPI'),   
  (9129, 2029, '2026-03-29 12:00:00', 4*799.00,  'Card'),    
  (9130, 2030, '2026-03-30 12:00:00', 5*179.00,  'Cash'),    
  (9131, 2031, '2026-03-31 12:00:00', 1*129.00,  'UPI'),   
  (9132, 2032, '2026-04-01 12:00:00', 2*149.00,  'Card'),   
  (9133, 2033, '2026-04-02 12:00:00', 3*599.00,  'Cash'),  
  (9134, 2034, '2026-04-03 12:00:00', 4*149.00,  'UPI'),    
  (9135, 2035, '2026-04-04 12:00:00', 5*1499.00, 'Card'),  
  (9136, 2036, '2026-04-05 12:00:00', 1*1299.00, 'Cash'), 
  (9137, 2037, '2026-04-06 12:00:00', 2* 399.00, 'UPI'),   
  (9138, 2038, '2026-04-07 12:00:00', 3*1999.00, 'Card'),  
  (9139, 2039, '2026-04-08 12:00:00', 4* 149.00, 'Cash'),    
  (9140, 2040, '2026-04-09 12:00:00', 5* 899.00, 'UPI'),     
  (9141, 2041, '2026-04-10 12:00:00', 1*1199.00, 'Card'),    
  (9142, 2042, '2026-04-11 12:00:00', 2* 129.00, 'Cash'),    
  (9143, 2043, '2026-04-12 12:00:00', 3* 159.00, 'UPI'),     
  (9144, 2044, '2026-04-13 12:00:00', 4*  49.00, 'Card'),    
  (9145, 2045, '2026-04-14 12:00:00', 5*  39.00, 'Cash'),    
  (9146, 2046, '2026-04-15 12:00:00', 1* 199.00, 'UPI'),     
  (9147, 2047, '2026-04-16 12:00:00', 2* 429.00, 'Card'),    
  (9148, 2048, '2026-04-17 12:00:00', 3* 429.00, 'Cash'),    
  (9149, 2049, '2026-04-18 12:00:00', 4* 159.00, 'UPI'),     
  (9150, 2050, '2026-04-19 12:00:00', 5* 349.00, 'Card');    
  
SELECT  * FROM customers;
SELECT  * FROM order_items;
SELECT  * FROM orders;
SELECT  * FROM payments;
SELECT  * FROM products;
     
     
-- 1 how order_id, order_date, and status from the orders table, sorted by order_id ascending.
SELECT 
    order_id, order_date, status
FROM
    orders
ORDER BY order_id ASC;


-- Show all columns from products where category is 'Electronics', sorted by unit_price descending.
SELECT 
    *
FROM
    products
WHERE
    category = 'Electronics'
ORDER BY unit_price DESC;


-- List all unique city values from customers, sorted alphabetically (A→Z).
SELECT DISTINCT
    city
FROM
    customers
ORDER BY city ASC;


-- Show the number of orders placed by each customer.Display customer_id and total_orders, sorted by total_orders descending.
SELECT 
    customer_id, COUNT(*) AS total_orders
FROM
    orders
GROUP BY customer_id
ORDER BY total_orders DESC;

    
-- order_id, first_name, last_name, order_date, status for all orders.
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.status
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id;
    
    
 -- Show each order with the product name and quantity(INNER JOIN)
SELECT 
    o.order_id,
    p.product_name,
    o.quantity,
    o.unit_price
FROM order_items o
INNER JOIN products p
    ON o.product_id = p.product_id
ORDER BY o.order_id, p.product_name;



-- Show the total amount for each order.
SELECT 
    order_id, SUM(quantity * unit_price) AS toltalamount
FROM
    order_items
GROUP BY order_id
ORDER BY toltalamount DESC;



/* Show only the orders whose total amount is greater than 1000.Return order_id 
and order_total, ordered by order_total descending.*/
SELECT 
    order_id, SUM(quantity * unit_price) AS toltalamount
FROM
    order_items
GROUP BY order_id
HAVING toltalamount > 1000
ORDER BY toltalamount DESC;
 
 
-- Show each order with the customer’s full name and the order total.
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS fullname,
    SUM(oi.quantity * oi.unit_price) AS toltalamount
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id , c.first_name , c.last_name
ORDER BY o.order_id;


/*JOIN with payments and comparison Show each order with: 
order_id, order_total (from items), paid_amount (from payments.amount), 
balance = order_total - paid_amount*/
SELECT
    t.order_id,
    t.order_total,
    p.amount AS paid_amount,
    (t.order_total - p.amount) AS balance
FROM
(
    SELECT 
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS t
JOIN payments AS p
    ON t.order_id = p.order_id
ORDER BY balance DESC;




 -- dataset, every order does have a payment, BUT this question tests your ability to use LEFT JOIN.
SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    p.amount AS payment_amount
FROM
    orders o
        LEFT JOIN
    payments p ON o.order_id = p.order_id
ORDER BY payment_amount DESC;


   
-- Sometimes payments can be missing. To make the report robust, show 0 instead of NULL for missing payments.
  SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    COALESCE (p.amount,0.00) AS payment_amount
FROM
    orders o
        LEFT JOIN
    payments p ON o.order_id = p.order_id
ORDER BY payment_amount DESC;


-- Show product level sales lines with this output:
SELECT 
    o.order_id,
    p.sku,
    p.product_name,
    o.quantity,
    (o.quantity * o.unit_price) AS line_total
FROM
    order_items o
        INNER JOIN
    products p ON p.product_id = o.product_id
ORDER BY line_total DESC , o.order_id ASC;


-- Show total revenue per product.
SELECT 
    p.product_id,
    p.product_name,
    SUM(o.quantity * o.unit_price) AS revenue
FROM
    order_items o
        JOIN
    products p ON o.product_id = p.product_id
GROUP BY p.product_id , p.product_name
ORDER BY revenue DESC;



-- show each customer’s total spend (sum of their order totals), with columns:
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS fullname,
    SUM(oi.quantity * oi.unit_price) AS total_spend
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spend DESC;


-- Show each customer with the number of orders they placed. If a customer placed 0 orders, show 0 (not NULL).
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_order
FROM
    customers c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , customer_name
ORDER BY total_order DESC;


-- Among customers, show only those whose quantity ≥ 3.
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(oi.quantity) AS total_quanitity
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id , customer_name
HAVING total_quanitity > 3
ORDER BY customer_name DESC;


-- Show all orders placed in March 2026, with columns:
SELECT 
    order_id, order_date, status
FROM
    orders
WHERE
    YEAR(order_date) = 2026
        AND MONTH(order_date) = 3;
        
-- Show each customer’s customer_id and a new column called initials, which contains:
SELECT 
    customer_id,
    CONCAT(LEFT(first_name, 1), LEFT(last_name, 1)) AS initials
FROM
    customers
ORDER BY customer_i ;


-- Show each product’s product_id, product_name, and a column price_round that is the price rounded to the nearest integer.
SELECT 
    product_id,
    product_name,
    ROUND(unit_price, 0) AS price_round
FROM
    products
ORDER BY price_round DESC , product_id ASC;


/*Show each order with: order_id, order_date, days_from_first_order →
 number of days between this order and the earliest order date in the table*/
SELECT 
    order_id,
    order_date,
    DATEDIFF(order_date,
            (SELECT 
                    MIN(order_date)
                FROM
                    orders)) AS days
FROM
    orders
ORDER BY order_id ASC;

/*Classify each order into a category called order_size:
If order_total >= 1000 → "Large"
If order_total >= 500  → "Medium"
Else  → "Small"*/
SELECT 
    order_id,
    SUM(quantity * unit_price) AS total_order,
    CASE
        WHEN SUM(quantity * unit_price) >= 1000 THEN 'large'
        WHEN SUM(quantity * unit_price) >= 500 THEN 'medium'
        ELSE 'low'
    END AS order_size
FROM
    order_items
GROUP BY order_id;


/* Classify products into a new column price_band using unit_price:
unit_price >= 1000 → 'Premium'
unit_price BETWEEN 300 AND 999.99 → 'Mid'
else → 'Budget'*/
SELECT 
    product_id,
    product_name,
    unit_price,
    CASE
        WHEN unit_price >= 1000 THEN 'Premium'
        WHEN unit_price BETWEEN 300 AND 999.0 THEN 'Mid'
        ELSE 'Budget'
    END AS price_band
FROM
    products
ORDER BY price_band ASC , unit_price DESC;



/*Return products that are either:
 in categories Apparel or Electronics (use IN),
 and whose unit_price is between 300 and 900 (use BETWEEN),
 and whose product_name contains the word T-Shirt (use LIKE).*/
SELECT 
    product_id, product_name, category, unit_price
FROM
    products
WHERE
    category IN ('Apparel','Electronics')
        AND unit_price BETWEEN 300 AND 900
        AND product_name LIKE '%T-Shirt%'
ORDER BY unit_price DESC;


-- Show the products whose price is higher than the average price of all products.
SELECT 
    product_id, unit_price
FROM
    products
WHERE
    unit_price > (SELECT 
            AVG(unit_price)
        FROM
            products)
ORDER BY unit_price DESC;


-- Show all orders that include any product from the “Electronics” category.
SELECT 
    o.order_id, o.order_date, o.status
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
        JOIN
    products p ON p.product_id = oi.product_id
WHERE
    p.category = ('Electronics')
ORDER BY o.order_date ASC;


-- Show all customers who placed at least one order.
SELECT 
    c.customer_id, c.first_name, c.last_name
FROM
    customers c
        INNER JOIN
    orders o ON c.customer_id = o.customer_id;
    
    
    
-- Show how many products each category has.
SELECT 
    category, COUNT(product_id) AS total_value
FROM
    products
GROUP BY category
ORDER BY total_value DESC;


/*Show the top 5 most expensive products, including:
product_id
product_name
unit_price*/
SELECT product_id,product_name,unit_price
FROM products 
ORDER BY unit_price DESC , product_name ASC LIMIT 5;



-- Return all customers whose first name contains the letter 'a' (case‑insensitive).
SELECT 
    customer_id, LOWER(first_name) AS lower_name, last_name, email
FROM
    customers
WHERE
    LOWER(first_name) LIKE '%a%'
ORDER BY first_name ASC;


-- Show only the categories that have more than 10 products.
SELECT 
    category, COUNT(product_id) AS total_prodect
FROM
    products
GROUP BY category
HAVING COUNT(product_id) > 10
ORDER BY total_prodect DESC;


-- Show all orders placed between '2026-03-10' and '2026-03-20' (inclusive).
SELECT 
    order_id, order_date, status
FROM
    orders
WHERE
    order_date BETWEEN '2026-03-10' AND '2026-03-20';
    
/*Show the following from the orders table:
The earliest order date (use MIN(order_date))
The latest order date (use MAX(order_date))
*/
SELECT 
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM
    orders;
    
    

-- Show the number of unique cities where customers live.
SELECT 
    COUNT(DISTINCT city) AS unique_city_count
FROM
    customers;
    


-- Show the average unit price of all products, rounded to 2 decimal places.
SELECT 
    ROUND(AVG(unit_price), 2) AS avg_price
FROM 
    products;
    
    
/*Show the following information from the products table:
Lowest price (min_price)
Highest price (max_price)
Difference (price_range) = highest price – lowest price*/
SELECT 
    MIN(unit_price) AS low_price,
    MAX(unit_price) AS hing_price,
    MAX(unit_price) - MIN(unit_price) AS price_range
FROM
    products;
    
    
    
-- Show how many orders contain a product in the 'Stationery' category.
SELECT 
    COUNT(DISTINCT order_id) AS stationery_order_count
FROM
    order_items o
        JOIN
    products p ON o.product_id = p.product_id
WHERE
    p.category = 'Stationery';
    
    
    
/* Show customer_id, customer_name, and total items purchased for customers who bought
 more items than the average quantity per customer.*/
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(oi.quantity) AS total_quantity
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY customer_id , customer_name
HAVING total_quantity > (SELECT 
        AVG(t.total_quantity)
    FROM
        (SELECT 
            o.customer_id, SUM(oi.quantity) AS total_quantity
        FROM
            orders o
        JOIN order_items oi ON oi.order_id = o.order_id
        GROUP BY o.customer_id) AS t)
ORDER BY total_quantity DESC;



-- Find all products with names containing the word "Mug" (case-insensitive)
SELECT 
    product_id, lower(product_name), unit_price
FROM
    products
WHERE
    LOWER(product_name) LIKE '%mug%'
ORDER BY unit_price DESC;



-- Show all products whose price is between 100 and 300, inclusive.
SELECT 
    product_id, product_name, unit_price
FROM
    products
WHERE
    unit_price BETWEEN 100 AND 300
ORDER BY unit_price DESC;



-- For each customer, list their most recent order only
SELECT
    order_id,
    customer_id,
    order_date,
    status
FROM (
    SELECT 
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        ROW_NUMBER() OVER (
            PARTITION BY o.customer_id 
            ORDER BY o.order_date DESC
        ) AS rn
    FROM orders o
) AS t
WHERE rn = 1
ORDER BY customer_id;


-- For each customer, show every order and the number of days since their previous order.
SELECT
    order_id,
    customer_id,
    order_date,
    LAG(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_date,
    DATEDIFF(
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        )
    ) AS days_since_last_order
FROM orders
ORDER BY customer_id, order_date;



-- Find the top 5 highest-value orders based on order_total and rank_position
SELECT 
     order_id,order_total,
RANK()OVER(
ORDER BY order_total DESC 
	) as rank_position 
FROM 
   (SELECT order_id,sum(quantity * unit_price) 
         AS order_total
FROM order_items 
GROUP BY 
     order_id) AS T
ORDER BY order_total DESC
 LIMIT 5;



-- Find products grouped by category, ranked by price within each category.
SELECT
    category,
    product_id,
    product_name,
    unit_price,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY unit_price DESC
    ) AS price_rank
FROM products
ORDER BY category, price_rank, unit_price DESC;



-- Find each customer’s TOTAL spending and RANK them
SELECT
    t.customer_id,
    t.customer_name,
    t.total_spend,
    DENSE_RANK() OVER (ORDER BY t.total_spend DESC) AS spend_rank
FROM (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY 
        c.customer_id,
        customer_name
) AS t
ORDER BY spend_rank;


/*
Create a VIEW named v_order_totals that contains:
order_id
customer_id
order_total = SUM(quantity × unit_price)*/
CREATE VIEW view_order_total  AS
	SELECT
       o.order_id,
       o.customer_id, 
       SUM(oi.quantity * oi.unit_price) AS total_spend
	FROM order_items oi
	JOIN orders o
       ON O.order_id = oi.order_id
	GROUP BY
       o.order_id,
       o.customer_id;
       
	SELECT * FROM view_order_total;
    
    
    
-- Create an index on the city column in the customers table to speed up city‑based searches.
     CREATE INDEX 
			index_customer_city 
		ON customers(city);
     SELECT * 
			from customers
     WHERE
			city ="Chennai";
            
            
            
--  Using SAVEPOINT, ROLLBACK TO SAVEPOINT, COMMIT            
START TRANSACTION;

-- First insert (this one will be saved finally)
INSERT INTO customers (customer_id, first_name, last_name, email, city, created_at)
VALUES (9001, 'Test1', 'User1', 'test1@example.com', 'Chennai', NOW());

-- Create savepoint
SAVEPOINT sp1;

-- Second insert (this one will be undone)
INSERT INTO customers (customer_id, first_name, last_name, email, city, created_at)
VALUES (9002, 'Test2', 'User2', 'test2@example.com', 'Coimbatore', NOW());

-- Undo second insert only
ROLLBACK TO sp1;

-- Finalize the transaction (only the first insert is committed)
COMMIT;

-- Using a CTE, calculate the order_total for each order.
WITH order_totals AS (
    SELECT 
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM order_items
    GROUP BY order_id
)
SELECT 
    order_id,
    order_total
FROM order_totals
ORDER BY order_total DESC;

/* Using a CTE, show each customer’s total spending,
 then display only those who spent more than 2000.*/
 WITH customer_spend AS (
    SELECT 
        c.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id
)
SELECT 
    customer_id,
    total_spend
FROM customer_spend
WHERE total_spend > 2000
ORDER BY total_spend DESC;

/*Show each order with:
order_id
customer_id
order_total
paid_amount
balance = order_total − paid_amount
 If paid_amount is NULL → treat it as 0 using COALESCE()*/
SELECT
    o.order_id,
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS order_total,
    COALESCE(p.amount, 0) AS paid_amount,
    SUM(oi.quantity * oi.unit_price) - COALESCE(p.amount, 0) AS balance
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
LEFT JOIN payments p
    ON o.order_id = p.order_id
GROUP BY 
    o.order_id,
    o.customer_id
ORDER BY 
    balance DESC;


-- “Customer Profit & Behavior Analysis Report”
WITH customer_base AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.quantity) AS total_quantity,
        SUM(oi.quantity * oi.unit_price) AS total_revenue,
        AVG(oi.quantity * oi.unit_price) AS avg_order_value,
        
        MIN(o.order_date) AS first_order_date,
        MAX(o.order_date) AS last_order_date,
        
        AVG(
            COALESCE(DATEDIFF(p.paid_at, o.order_date), 0)
        ) AS payment_delay_avg_days
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    LEFT JOIN payments p
        ON o.order_id = p.order_id
    GROUP BY 
        c.customer_id,
        customer_name
),

category_totals AS (
    SELECT
        c.customer_id,
        p.category,
        SUM(oi.quantity) AS total_cat_qty,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY SUM(oi.quantity) DESC
        ) AS rn
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY 
        c.customer_id, 
        p.category
)

SELECT
    cb.customer_id,
    cb.customer_name,
    cb.total_orders,
    cb.total_quantity,
    cb.total_revenue,
    cb.avg_order_value,
    cb.first_order_date,
    cb.last_order_date,
    cb.payment_delay_avg_days,
    
    ct.category AS category_most_purchased,
    
    CASE
        WHEN cb.total_revenue >= 5000 THEN 'High-Value'
        WHEN cb.total_revenue >= 2000 THEN 'Mid-Value'
        ELSE 'Low-Value'
    END AS high_value_flag,
    
    DENSE_RANK() OVER (ORDER BY cb.total_revenue DESC) AS customer_rank,
    
    SUM(cb.total_revenue) 
        OVER (ORDER BY cb.total_revenue DESC) AS running_total_global

FROM customer_base cb
LEFT JOIN category_totals ct
    ON cb.customer_id = ct.customer_id
    AND ct.rn = 1
ORDER BY 
    cb.total_revenue DESC,
    cb.customer_id ASC;













