📊 SQL Database Practice – Employees, Customers & Transactions

This project demonstrates fundamental SQL database operations including table creation, modification, constraints, joins, aggregations, and transaction control. It simulates a simple business database containing employees, customers, products, and transactions.

The SQL script showcases how relational databases are designed and manipulated using standard SQL commands.

📁 Database Schema Overview

The project contains the following main tables:

Table Description
employees Stores employee information
products Contains product details and pricing
customers Stores customer records
transactions Records customer purchase transactions
🏗️ Table Creation
Employees Table

Stores employee personal and job-related information.

CREATE TABLE employees(
employee_id INT,
first_name VARCHAR(20),
last_name VARCHAR(50),
hire_date DATE
);

Later modifications include:

Adding email

Adding hourly_rate

Adding jobs

Example final structure:

Column Type
employee_id INT
first_name VARCHAR
last_name VARCHAR
email VARCHAR
hire_date DATE
hourly_rate INT
jobs VARCHAR
Products Table

Stores product information.

CREATE TABLE products(
product_id INT,
product_name VARCHAR(25),
price DECIMAL(4,2)
);

Constraint applied:

ALTER TABLE products ADD CONSTRAINT UNIQUE(product_name);

This ensures duplicate product names cannot exist.

Customers Table

Stores customer details.

CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

AUTO_INCREMENT automatically generates unique IDs.

Transactions Table

Records purchases made by customers.

CREATE TABLE transactions(
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
amount DECIMAL(5,2),
customer_id INT,
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

This establishes a foreign key relationship between customers and transactions.

⚙️ Table Alterations

Various ALTER TABLE commands were used:

Add Column
ALTER TABLE employees ADD phone_number VARCHAR(15);
Rename Column
ALTER TABLE employees CHANGE COLUMN phone_number email VARCHAR(20);
Modify Column
ALTER TABLE employees MODIFY COLUMN email VARCHAR(100);
Drop Column
ALTER TABLE employees DROP COLUMN hourly_rate;
🔒 Constraints Used

Unique Constraint

ALTER TABLE products ADD CONSTRAINT UNIQUE(product_name);

Ensures product names are unique.
Check Constraint
ALTER TABLE employees ADD CONSTRAINT CHECK(hourly_rate >= 10.00);
Ensures minimum wage requirement.
Primary Key

Used in:

customers
transactions

Foreign Key
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)

Ensures transaction records belong to valid customers.

✏️ Data Manipulation

Insert Data
INSERT INTO employees VALUES
(1,"Satish","Kumar","anonymous1986222@gmail.com","2026-03-08");

Example for products:

INSERT INTO products VALUES
(100,"hamburger",3.99),
(101,"fries",1.89),
(102,"soda",1.00),
(103,"ice cream",1.49);

🔍 Data Queries

Select Records
SELECT _ FROM employees;
Conditional Query
SELECT _ FROM employees WHERE first_name = "Satish";
Pattern Matching
SELECT \* FROM employees WHERE last_name LIKE "K%";

🔄 Transactions

SQL transaction commands allow safe data modification.

Commit
COMMIT;

Saves all changes permanently.

Rollback
ROLLBACK;

Reverts changes before the last commit.

📊 Aggregate Functions

Used for data analysis.

Count Transactions
SELECT COUNT(amount) AS todays_transaction FROM transactions;
Maximum Transaction
SELECT MAX(amount) AS maximum FROM transactions;
Minimum Transaction
SELECT MIN(amount) AS minimum FROM transactions;
Total Sales
SELECT SUM(amount) AS total_sales FROM transactions;
🔗 Joins
Right Join Example
SELECT transaction_id, amount, first_name, last_name
FROM transactions
RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

Joins transaction records with customer details.

🧮 Group By and Having

Used to filter grouped data.

SELECT COUNT(amount), customer_id
FROM transactions
GROUP BY customer_id
HAVING COUNT(amount) >= 3;

This retrieves customers with 3 or more transactions.

🔀 Union Operations

Combine results from multiple tables.

Union
SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM customers;

Removes duplicates.

Union All
SELECT first_name, last_name FROM employees
UNION ALL
SELECT first_name, last_name FROM customers;

Includes duplicates.

📑 Sorting & Limiting Results
SELECT \* FROM transactions
ORDER BY amount, customer_id
LIMIT 3;

Returns the top 3 smallest transactions.

🎯 Key Concepts Demonstrated

This project covers:

SQL DDL (Data Definition Language)
SQL DML (Data Manipulation Language)
Constraints
Primary Keys
Foreign Keys
Joins
Aggregate Functions
Transactions
Grouping and Filtering
Union Operations

💡 Learning Purpose

This project is designed to help developers understand:

How relational databases work
How to design normalized tables
How to query and manipulate data effectively
How to maintain data integrity using constraints
