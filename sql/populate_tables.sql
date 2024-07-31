-- Insert test data into the carts table
INSERT INTO carts (id, user_id, created_at, updated_at, status) VALUES
(uuid_generate_v4(), uuid_generate_v4(), CURRENT_DATE, CURRENT_DATE, 'OPEN'),
(uuid_generate_v4(), uuid_generate_v4(), CURRENT_DATE, CURRENT_DATE, 'ORDERED'),
(uuid_generate_v4(), uuid_generate_v4(), CURRENT_DATE, CURRENT_DATE, 'OPEN');

-- Insert test data into the cart_items table
INSERT INTO cart_items (cart_id, product_id, count) VALUES
((SELECT id FROM carts WHERE status = 'OPEN' LIMIT 1), uuid_generate_v4(), 3),
((SELECT id FROM carts WHERE status = 'ORDERED' LIMIT 1), uuid_generate_v4(), 1),
((SELECT id FROM carts WHERE status = 'OPEN' LIMIT 1 OFFSET 1), uuid_generate_v4(), 5);
