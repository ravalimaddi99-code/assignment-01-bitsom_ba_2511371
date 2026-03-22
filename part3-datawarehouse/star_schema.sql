-- Create Database
CREATE DATABASE IF NOT EXISTS data_warehouse;
USE data_warehouse;

-- =========================
-- Dimension Tables
-- =========================

-- Date Dimension
CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

-- Product Dimension
CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Store Dimension
CREATE TABLE dim_store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100)
);

-- =========================
-- Fact Table
-- =========================

CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT,
    product_id INT,
    store_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);

-- =========================
-- Insert Cleaned Sample Data
-- =========================

-- Date Data (standardized format)
INSERT INTO dim_date (full_date, day, month, year) VALUES
('2023-08-29', 29, 8, 2023),
('2023-12-12', 12, 12, 2023),
('2023-02-20', 20, 2, 2023);

-- Product Data (lowercase categories)
INSERT INTO dim_product (product_name, category) VALUES
('Milk', 'dairy'),
('Bread', 'bakery'),
('Eggs', 'dairy');

-- Store Data
INSERT INTO dim_store (store_name) VALUES
('Store A'),
('Store B');

-- Fact Data (at least 10 rows)
INSERT INTO fact_sales 
(date_id, product_id, store_id, quantity, unit_price, total_amount) VALUES
(1, 1, 1, 2, 50.00, 100.00),
(1, 2, 1, 1, 30.00, 30.00),
(2, 3, 2, 3, 10.00, 30.00),
(2, 1, 2, 1, 50.00, 50.00),
(3, 2, 1, 2, 30.00, 60.00),
(3, 3, 2, 5, 10.00, 50.00),
(1, 1, 2, 1, 50.00, 50.00),
(2, 2, 1, 3, 30.00, 90.00),
(3, 1, 1, 2, 50.00, 100.00),
(1, 3, 2, 4, 10.00, 40.00);