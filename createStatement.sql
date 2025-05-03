
CREATE TABLE IF NOT EXISTS customer (
    customer_id INTEGER PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,      
    city VARCHAR(255),               
    state VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS product (
    productid INTEGER PRIMARY KEY,    
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) ,           
    unit_price DECIMAL(10, 2) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS orders (
    orderid INTEGER PRIMARY KEY,      
    customer_id INT NOT NULL,        
    order_date DATE NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE IF NOT EXISTS orderdetails (
    orderid INT NOT NULL,             
    productid INT NOT NULL,         
    qty INT NOT NULL,      
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,           
    PRIMARY KEY (orderid, productid),  
    FOREIGN KEY (orderid) REFERENCES orders(orderid) ON DELETE CASCADE,  
    FOREIGN KEY (productid) REFERENCES product(productid) ON DELETE CASCADE 
);