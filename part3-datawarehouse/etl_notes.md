## ETL Decisions

### Decision 1 — Standardizing Date Format
Problem: The dataset contained inconsistent date formats such as DD-MM-YYYY, YYYY-MM-DD, and DD/MM/YYYY, which made it difficult to perform time-based analysis.

Resolution: All date values were converted into a standard format (YYYY-MM-DD) before loading into the data warehouse. This ensured consistency and enabled proper grouping by month and year.

---

### Decision 2 — Handling NULL and Missing Values
Problem: Some records contained NULL or missing values in important fields like product category or price, which could affect analytical results.

Resolution: Missing values were either replaced with appropriate defaults or removed if they were not usable. This ensured data quality and prevented errors during aggregation.

---

### Decision 3 — Standardizing Category Names
Problem: Product categories had inconsistent casing such as 'Dairy', 'dairy', and 'DAIRY', leading to incorrect grouping in analysis.

Resolution: All category values were converted to lowercase to maintain uniformity and ensure accurate grouping in queries.

---