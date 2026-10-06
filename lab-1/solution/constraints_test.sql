INSERT INTO customers (full_name, email, password_hash) VALUES (NULL, 'asdadasd@asdadsasdads', 'asdadadsad');

INSERT INTO customers (full_name, email, password_hash) VALUES ('asdasdasd', 'asdasdasd', 'dfdf');

INSERT INTO products (category_id, product_name, sku) VALUES (-1, 'Test', 'wrongcat');

UPDATE customers SET password_hash = 'abc' WHERE customer_id = 1;

UPDATE price_history SET current_price = 0 WHERE price_history_id = 1;

UPDATE orders SET customer_id = -1 WHERE order_id = 1;
