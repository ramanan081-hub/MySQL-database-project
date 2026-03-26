# MySQL International Export Company Database Project

## Project Overview
This project is a **MySQL-based database system** designed to simulate the operations of an **international export company**.  
It manages global customers, product catalogs, customer orders, item‑level order details, and payment records.

The project focuses on **real‑world database design and SQL querying**, commonly used in **export, sales, and order management systems**.

---

## Business Context
The database represents an **international export business** that:
- Sells products to customers across different regions
- Processes multiple orders per customer
- Manages multiple products per order
- Tracks payments for completed orders

This project was created for **learning and portfolio purposes**, based on real‑world business scenarios.

---

## Database Tables
The system consists of **5 core tables**:

1. **customers**  
   Stores customer details such as name, contact, and country.

2. **products**  
   Stores product information including product name and price.

3. **orders**  
   Stores order details placed by customers.

4. **order_items**  
   Stores item‑level details for each order (products and quantities).

5. **payments**  
   Stores payment information related to customer orders.

---

##  Table Relationships
- One customer can place **multiple orders**
- One order can contain **multiple products**
- `order_items` acts as a bridge between **orders** and **products**
- Each order has corresponding **payment details**

All tables are connected using **primary keys and foreign keys** to maintain data integrity.

---

##  SQL Concepts Used
This project demonstrates strong SQL skills using:

 Database creation and table design  
 PRIMARY KEY and FOREIGN KEY constraints  
 INNER JOIN and LEFT JOIN  
 Aggregate functions (SUM, COUNT, AVG)  
 GROUP BY and HAVING clauses  
 Subqueries  
 Built‑in SQL functions  
 Filtering and sorting data  

---

## Sample Business Queries
Some real‑world business queries included in this project:

- Customer‑wise order history  
- Total revenue by product  
- Monthly sales analysis  
- Most frequently ordered products  
- Payment status and order tracking  

---

##  Project Structure
