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

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert into Customers
INSERT INTO customers VALUES
('C001', 'Rohan Mehta', 'Mumbai'),
('C002', 'Priya Sharma', 'Mumbai'),
('C003', 'Amit Verma', 'Delhi'),
('C004', 'Neha Gupta', 'Pune'),
('C005', 'Vikram Singh', 'Mumbai');

-- Insert into Products
INSERT INTO products VALUES
('P001', 'Laptop', 50000),
('P002', 'Mobile', 20000),
('P003', 'Tablet', 15000),
('P004', 'Headphones', 2000),
('P005', 'Keyboard', 1500);

-- Insert into Sales Reps
INSERT INTO sales_reps VALUES
('S001', 'Anil Kumar'),
('S002', 'Sunita Rao'),
('S003', 'Rahul Sharma'),
('S004', 'Pooja Singh'),
('S005', 'Karan Patel');

-- Insert into Orders
INSERT INTO orders VALUES
('ORD1001', 'C001', 'S001'),
('ORD1002', 'C002', 'S002'),
('ORD1003', 'C003', 'S003'),
('ORD1004', 'C004', 'S004'),
('ORD1005', 'C005', 'S005');

-- Insert into Order Items
INSERT INTO order_items VALUES
('ORD1001', 'P001', 1),
('ORD1002', 'P002', 2),
('ORD1003', 'P003', 1),
('ORD1004', 'P004', 3),
('ORD1005', 'P005', 2);