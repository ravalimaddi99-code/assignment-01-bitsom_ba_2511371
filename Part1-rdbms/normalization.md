Keeping all data in a single table may seem simple, but it leads to multiple issues such as redundancy and data anomalies. In the given dataset (orders_flat.csv), customer, product, and sales representative details are repeated across multiple rows for every order. For example, the same customer_id appears multiple times with identical information. This repetition increases storage and makes updates difficult.
If a customer’s city needs to be updated, it must be changed in every row where that customer appears. Missing even one row can result in inconsistent data. Similarly, inserting a new product is not possible without creating an order, and deleting an order may remove important product or customer information. These are examples of insert, update, and delete anomalies.
Normalization helps solve these problems by dividing the data into separate tables such as Customers, Products, Orders, and Sales Representatives. Each table stores only relevant information, reducing duplication. Relationships between tables using primary and foreign keys ensure data consistency.
By applying Third Normal Form (3NF), we eliminate redundancy and ensure that each piece of data is stored only once. This improves data integrity, reduces anomalies, and makes the database easier to maintain and scale.
Therefore, normalization is not over-engineering but a necessary step for building a reliable and efficient database system.

## AnamolyAnalysis:
- Insert Anamoly:
For example a new product like product_id =P105 cannot be added unless an order_id is provided because the table stores everything together.

- Update Anamoly:
For example,customer-id =C101 appears in multiple rows with the same city.If the city changes it must be updated in all those rows.

- Delete Anamoly:
For example if a product like product-id =P205 appears in only one row,deleting that row will also delete all details of that product.
