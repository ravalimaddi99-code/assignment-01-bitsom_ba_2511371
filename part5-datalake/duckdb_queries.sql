-- Q1: Total orders per customer
SELECT   
    c.customer_id,  
    c.name,  
    COUNT(o.order_id) AS total_orders  
FROM read_csv_auto('../datasets/customers.csv') c  
LEFT JOIN read_json_auto('../datasets/orders.json') o  
ON c.customer_id = o.customer_id  
GROUP BY c.customer_id, c.name;


-- Q2: Top 3 customers by total spending
SELECT   
    c.customer_id,  
    c.name,  
    SUM(o.total_amount) AS total_spent  
FROM read_csv_auto('../datasets/customers.csv') c  
JOIN read_json_auto('../datasets/orders.json') o  
ON c.customer_id = o.customer_id  
GROUP BY c.customer_id, c.name  
ORDER BY total_spent DESC  
LIMIT 3;


-- Q3: Customers from Bangalore who placed orders
SELECT DISTINCT   
    c.name  
FROM read_csv_auto('../datasets/customers.csv') c  
JOIN read_json_auto('../datasets/orders.json') o  
ON c.customer_id = o.customer_id  
WHERE c.city = 'Bangalore';


-- Q4: Customer name with order details
SELECT   
    c.name,  
    o.order_date,  
    o.total_amount,  
    o.num_items  
FROM read_csv_auto('../datasets/customers.csv') c  
JOIN read_json_auto('../datasets/orders.json') o  
ON c.customer_id = o.customer_id;