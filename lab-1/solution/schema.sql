BEGIN;

CREATE TABLE customers (
    customer_id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL CHECK ( char_length(password_hash) > 7 )
);

CREATE TABLE categories (
    category_id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE products (
    product_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id BIGINT NOT NULL REFERENCES categories(category_id) ON DELETE RESTRICT,
    product_name TEXT NOT NULL,
    sku TEXT NOT NULL UNIQUE
);

CREATE TABLE orders (
    order_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(customer_id) ON DELETE RESTRICT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    order_id BIGINT REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id BIGINT REFERENCES products(product_id) ON DELETE RESTRICT,
    quantity BIGINT NOT NULL CHECK (quantity > 0),

    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE price_history (
    price_history_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id BIGINT NOT NULL REFERENCES products(product_id) ON DELETE RESTRICT,
    current_price NUMERIC(10, 2) NOT NULL CHECK (current_price > 0),
    changed_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMIT;

-- ROLLBACK ;
-- DROP TABLE IF EXISTS order_items, price_history, orders, products, customers, categories;
