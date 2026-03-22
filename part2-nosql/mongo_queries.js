// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    name: "Laptop",
    category: "Electronics",
    price: 55000,
    expiry: null,
    tags: ["tech", "student", "work"],
    details: { brand: "HP", warranty_years: 2 }
  },
  {
    name: "Smartphone",
    category: "Electronics",
    price: 25000,
    expiry: null,
    tags: ["mobile", "android"],
    details: { brand: "Samsung", warranty_years: 1 }
  },
  {
    name: "Milk",
    category: "Groceries",
    price: 50,
    expiry: "2024-12-01",
    tags: ["daily", "fresh"],
    details: { brand: "Amul", quantity: "1L" }
  }
]);

// OP2: find Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry: { $lt: "2025-01-01" }
});

// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { name: "Laptop" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create index on category
db.products.createIndex({ category: 1 });