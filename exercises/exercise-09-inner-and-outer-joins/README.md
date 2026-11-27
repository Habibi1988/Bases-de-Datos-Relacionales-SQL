# Exercise 9 — INNER JOIN and OUTER JOIN

This folder contains the SQL practice for Exercise 9, focused on multi-table queries using the `nomina` and `jardineria` databases.

## Topics

- Multi-table queries with `INNER JOIN`
- Outer joins with `LEFT JOIN`
- Matching rows through primary and foreign keys
- Finding unmatched records with `LEFT JOIN ... IS NULL`
- Self-joins to relate employees with their managers
- Filtering, sorting and limiting query results
- Combining multiple tables to answer business questions
- Using `NOT EXISTS` to exclude offices matching a set of conditions
- Referential integrity and foreign key constraints

## Exercise sections

### 1. Nómina database

The first section practises inner joins between employees, departments and job positions, including:

- Employee, department and salary information
- Employee contract dates and job titles
- Filtering by salary, department, marital status and number of children
- Identifying the youngest employee
- Calculating years of service and age with date functions
- Sorting results by department and years of service
- Listing departments and positions, including those without employees
- Identifying departments without associated employees
- Understanding the role of foreign keys in maintaining referential integrity

### 2. Jardinería database

The second section works with customers, sales representatives, offices, orders, order details, products, product ranges and payments.

It includes queries to:

- List customers and their sales representatives
- Find customers who have made payments and customers who have not
- Include the office city of each sales representative
- Find offices associated with customers in a specific city
- Display employees and their managers using a self-join
- Identify orders delivered later than the expected date
- List the product ranges purchased by each customer
- Find customers without payments or without orders
- Find employees without an office or without associated customers
- Identify products that have never appeared in an order
- Find offices where no employee represents a customer who purchased a product from the **Frutales** range
- Find customers who have placed orders but have not made payments
- List employees without associated customers together with their managers

## Files

- `ejercicio09.pdf` — Original exercise instructions.
- `scripts.sql` — SQL queries and answers for the exercise.

## Databases

- `nomina`
- `jardineria`

## Notes

The queries are written for MySQL. The product query requesting an image is adapted to the available `producto` table structure: the script returns the product name and description because the table does not contain an image column.
