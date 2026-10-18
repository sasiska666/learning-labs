-- 1. Order totals through the view
SELECT * FROM order_totals ORDER BY order_id;

-- 2. Revenue per customer for paid and shipped orders
SELECT c.name, SUM(t.total) AS revenue
FROM order_totals t JOIN customers c USING (customer_id)
WHERE t.status IN ('paid', 'shipped')
GROUP BY c.name
ORDER BY revenue DESC;

-- 3. Customers who never ordered
SELECT c.name
FROM customers c
WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- 4. Best-selling products by quantity
SELECT p.name, SUM(oi.quantity) AS sold
FROM order_items oi JOIN products p USING (product_id)
GROUP BY p.name
ORDER BY sold DESC;

-- 5. Place an order inside a transaction (stock update must succeed with the insert)
BEGIN;
INSERT INTO orders (customer_id) VALUES (3);
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (currval('orders_order_id_seq'), 2, 2, 25.50);
UPDATE products SET stock = stock - 2 WHERE product_id = 2;
COMMIT;
