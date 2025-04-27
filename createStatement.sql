CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    age INTEGER,
    city VARCHAR(100),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(100),
    price_per_qty DECIMAL(5,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS orders (
	order_id INTEGER PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(product_id) ON DELETE CASCADE,
    order_date DATE NOT NULL, 
    quantity INTEGER,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_order_totals (
    user_id INT PRIMARY KEY,         
    customer_name VARCHAR(100),      
    order_amount DECIMAL(10, 2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);


CREATE OR REPLACE PROCEDURE reload_user_order_totals()
LANGUAGE plpgsql
AS $$
BEGIN
    TRUNCATE TABLE user_order_totals;


    INSERT INTO user_order_totals (user_id, customer_name, order_amount, updated_at)
    SELECT 
        C.user_id,
        C.customer_name,
        SUM(A.quantity * B.price_per_qty) AS order_amount,
        CURRENT_TIMESTAMP
    FROM orders A
    JOIN products B ON A.product_id = B.product_id
    JOIN users C ON A.user_id = C.user_id
    GROUP BY C.user_id, C.customer_name;

    RAISE NOTICE 'User order totals have been reloaded successfully.';
END;
$$;