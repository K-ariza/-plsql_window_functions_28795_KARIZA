SQL JOINs & Window Functions Project

Student Name:** KARIZA PATIENCE
Student ID:** 28795


---

## Business Problem

This project studies a small supermarket that records customers, products, quantities, and sale dates.
It is difficult to quickly identify top products, monthly sales changes, and high‑spending customers using simple queries.
SQL JOINs and window functions are used to analyze trends, rank performance, and group customers for better decisions.

---

## Success Criteria

* Identify the **top 5 products per region** using `RANK()`.
* Calculate **running monthly sales totals** using `SUM() OVER()`.
* Measure **month‑to‑month sales growth** using `LAG()`.
* Divide customers into **four spending groups** using `NTILE(4)`.
* Compute a **three‑month moving average of sales** using `AVG() OVER()`.

---

## Database Design

The database contains three tables: **customers, products, and sales**.
Customers and products each have a **one‑to‑many relationship** with sales.
An ER diagram shows primary keys and foreign‑key links between the tables.

---

## SQL Analysis

SQL JOINs are used to find valid sales, inactive customers, and unsold products.
Window functions are used to rank products, calculate running totals, compare monthly sales, and group customers by spending.

---

## Key Insights

* Most revenue comes from a **few top products**.
* **Total sales increase** over time with small monthly changes.
* A **small group of customers spends the most** money.
* Some **customers and products are inactive** and need attention.

---

## Conclusion

The analysis helps the supermarket improve **stock planning, marketing, and customer targeting** using SQL JOINs and window functions.



**End of One‑Page README**

