CREATE TABLE IF NOT EXISTS customer (
    customer_id INTEGER PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,      
    city VARCHAR(255),               
    state VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS product (
    product_id INTEGER PRIMARY KEY,    
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) ,           
    unit_price DECIMAL(10, 2) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY,      
    customer_id INT NOT NULL,        
    order_date DATE NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_id INT NOT NULL,             
    product_id INT NOT NULL,         
    qty INT NOT NULL,      
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,           
    PRIMARY KEY (order_id, product_id),  
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,  
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE 
);


-- CREATE OR REPLACE PROCEDURE reload_user_order_totals()
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     TRUNCATE TABLE user_order_totals;


--     INSERT INTO user_order_totals (user_id, customer_name, order_amount, updated_at)
--     SELECT 
--         C.user_id,
--         C.customer_name,
--         SUM(A.quantity * B.price_per_qty) AS order_amount,
--         CURRENT_TIMESTAMP
--     FROM orders A
--     JOIN products B ON A.product_id = B.product_id
--     JOIN users C ON A.user_id = C.user_id
--     GROUP BY C.user_id, C.customer_name;

--     RAISE NOTICE 'User order totals have been reloaded successfully.';
-- END;
-- $$;