-- Retrieve sales transactions with matching customers and products(INNER JOIN)
SELECT
    s.sale_id,
    c.full_name,
    p.product_name,
    s.quantity,
    s.sale_date
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN products p
    ON s.product_id = p.product_id;

-- Retrieve all customers including those with no sales(LEFT JOIN)
SELECT
    c.customer_id,
    c.full_name,
    s.sale_id
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;

-- Retrieve all products including those without sales(RIGHT JOIN)
SELECT
    p.product_id,
    p.product_name,
    s.sale_id
FROM sales s
RIGHT JOIN products p
    ON s.product_id = p.product_id
WHERE s.sale_id IS NULL;

-- Retrieve customers and products including unmatched records(FULL OUTER JOIN)
SELECT
    c.customer_id,
    c.full_name,
    p.product_id,
    p.product_name
FROM customers c
FULL OUTER JOIN products p
    ON c.customer_id = p.product_id;

-- Compare customers who are in the same region(SELF JOIN)
SELECT
    c1.full_name AS customer_1,
    c2.full_name AS customer_2,
    c1.region
FROM customers c1
INNER JOIN customers c2
    ON c1.region = c2.region
   AND c1.customer_id <> c2.customer_id;
