BEGIN;

CREATE TABLE address (
    address_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT REFERENCES customers(customer_id) ON DELETE RESTRICT,
    order_id BIGINT NOT NULL UNIQUE REFERENCES orders(order_id) ON DELETE RESTRICT,
    address TEXT NOT NULL
);

INSERT INTO address (customer_id, order_id, address) SELECT customer_id, order_id, 'test' FROM orders;

ALTER TABLE orders DROP COLUMN customer_id;

COMMIT;
