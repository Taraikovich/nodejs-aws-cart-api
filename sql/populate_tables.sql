-- Insert data into carts table
INSERT INTO carts (id, user_id, created_at, updated_at, status) VALUES
(uuid_generate_v4(), 'a0eebcbf-4b65-4bb4-9c4f-923b6f1cdb59', CURRENT_DATE, CURRENT_DATE, 'OPEN'),
(uuid_generate_v4(), 'b1f1e4a3-4a65-4c2f-9b3e-12b6c3e4f4d2', CURRENT_DATE, CURRENT_DATE, 'ORDERED'),
(uuid_generate_v4(), 'c2e2f5b4-5b76-4d3f-9e5e-23c7d4f6g5h3', CURRENT_DATE, CURRENT_DATE, 'OPEN');

-- Insert data into cart_items table
INSERT INTO cart_items (cart_id, product_id, count) VALUES
((SELECT id FROM carts WHERE status = 'OPEN' LIMIT 1), 'fb4d4c4b-6e6e-4f3b-8d6c-67a8e4f9c8e1', 3),
((SELECT id FROM carts WHERE status = 'ORDERED' LIMIT 1 OFFSET 1), 'ab4d4b4b-7f7f-5c4a-9e7b-78a9e5f9c9e2', 1),
((SELECT id FROM carts WHERE status = 'OPEN' LIMIT 1 OFFSET 1), 'cd4e4d4c-8g8g-6d5a-0f8c-89b1e6f0d8f2', 5);
