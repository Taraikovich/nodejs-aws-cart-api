-- Create the carts table
CREATE TABLE carts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    updated_at DATE NOT NULL DEFAULT CURRENT_DATE,
    status CART_STATUS NOT NULL
);

-- Create the cart_items table
CREATE TABLE cart_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cart_id UUID NOT NULL,
    product_id UUID NOT NULL,
    count INTEGER NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE
);

-- Create an enum type for cart status
CREATE TYPE cart_status AS ENUM ('OPEN', 'ORDERED');

-- Alter carts table to use the new enum type
ALTER TABLE carts
    ALTER COLUMN status TYPE cart_status USING status::cart_status;

-- Create an index on cart_id in cart_items for faster queries
CREATE INDEX idx_cart_id ON cart_items(cart_id);

-- Create an index on product_id in cart_items for faster queries
CREATE INDEX idx_product_id ON cart_items(product_id);
