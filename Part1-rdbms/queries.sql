 USE assignment_db;

-- Q1: Customers from Mumbai with total order value
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;


-- Q2: Top 3 products by total quantity sold
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;
[12:16 am, 20/03/2026] Ravali: USE assignment_db;

-- Q1: Customers from Mumbai with total order value
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;


-- Q2: Top 3 products by total quantity sold
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;


-- Q3: Sales representatives and number of orders handled
SELECT
    s.rep_id,
    s.name,
    COUNT(o.order_id) AS total_orders
FROM sales_reps s
LEFT JOIN orders o ON s.rep_id = o.rep_id
GROUP BY s.rep_id, s.name;


-- Q4: Orders where total value exceeds 5000
SELECT
    o.order_id,
    SUM(oi.quantity * oi.price) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING total_value > 5000;


-- Q5: Products that have never been ordered
SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;