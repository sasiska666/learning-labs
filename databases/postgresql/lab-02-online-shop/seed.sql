INSERT INTO customers (name, city) VALUES
    ('Customer A', 'City 1'), ('Customer B', 'City 2'), ('Customer C', 'City 1');

INSERT INTO products (name, price, stock) VALUES
    ('Product 1', 10.00, 50), ('Product 2', 25.50, 20), ('Product 3', 99.99, 5);

INSERT INTO orders (customer_id, created_at, status) VALUES
    (1, '2025-05-01 10:00', 'paid'),
    (1, '2025-05-12 14:30', 'shipped'),
    (2, '2025-06-03 09:15', 'new');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (1, 1, 2, 10.00), (1, 2, 1, 25.50),
    (2, 3, 1, 99.99),
    (3, 1, 5, 10.00);
