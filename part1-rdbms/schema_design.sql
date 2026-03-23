USE assignment_db;
select database();
select * from orders_flat;
-- Use database
USE assignment_db;

-- Drop tables if already exist (to avoid errors)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS sales_reps;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);
