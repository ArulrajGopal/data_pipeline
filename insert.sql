-- Insert users
INSERT INTO users (user_id, customer_name, age, city) VALUES
(1, 'Alice Johnson', 28, 'New York'),
(2, 'Bob Smith', 35, 'Los Angeles'),
(3, 'Charlie Davis', 22, 'Chicago');

-- Insert products
INSERT INTO products (product_id, product_name, product_category, price_per_qty) VALUES
(1, 'Apple iPhone 14', 'Electronics', 799.99),
(2, 'Nike Running Shoes', 'Footwear', 120.00),
(3, 'Organic Bananas (1 lb)', 'Groceries', 0.79);

-- Insert orders
INSERT INTO orders (order_id, user_id, product_id, order_date, quantity) VALUES
(1, 1, 1, '2025-04-10', 1),
(2, 2, 2, '2025-04-12', 2),
(3, 3, 3, '2025-04-15', 5),
(4, 1, 3, '2025-04-16', 10);
