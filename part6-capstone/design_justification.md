Storage Systems

In this architecture, different storage systems are used based on the type of data. A PostgreSQL database is used as the OLTP system to store structured hospital data such as patient records, treatments, and billing information. For real-time ICU monitoring data, a NoSQL database is used to efficiently handle continuous high-speed data streams.

A data warehouse is used as the central storage for analytical processing. It stores cleaned and transformed data coming from both the OLTP system and streaming data through an ETL pipeline. This enables efficient querying for reports and machine learning models.

OLTP vs OLAP Boundary

The OLTP system handles real-time transactional operations such as inserting and updating patient data. It is optimized for speed and consistency. In this architecture, PostgreSQL serves as the OLTP system.

The OLAP system begins at the data warehouse, where data is transformed and optimized for analysis. The ETL pipeline acts as the boundary between OLTP and OLAP systems by extracting data from transactional systems and loading it into the data warehouse for analytics.

Trade-offs

One important trade-off in this architecture is between real-time processing and system complexity. Using streaming systems and NoSQL databases allows real-time monitoring of ICU data, which is critical for patient care. However, it increases system complexity and maintenance effort.

A simpler batch-based system would be easier to maintain but would not support real-time insights. Therefore, this design prioritizes real-time capabilities despite increased complexity.