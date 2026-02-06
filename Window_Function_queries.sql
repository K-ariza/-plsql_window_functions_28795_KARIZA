-- Rank products by total revenue within each region(RANKING FUNCTION)
SELECT
    c.region,
    p.product_name,
    SUM(s.quantity * p.unit_price) AS total_revenue,
    RANK() OVER (
        PARTITION BY c.region
        ORDER BY SUM(s.quantity * p.unit_price) DESC
    ) AS product_rank
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region, p.product_name;

-- Running monthly sales total(Aggregate Window Functions)
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(quantity * unit_price) AS monthly_sales,
    SUM(SUM(quantity * unit_price)) OVER (
        ORDER BY DATE_TRUNC('month', sale_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;

-- Month-to-month sales comparison using LAG(Navigation Functions)
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS month,
        SUM(quantity * unit_price) AS total_sales
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month) AS previous_month_sales,
    total_sales - LAG(total_sales) OVER (ORDER BY month) AS growth_amount
FROM monthly_sales
ORDER BY month;

-- Segment customers into quartiles based on total spending(Distribution Functions)
SELECT
    c.customer_id,
    c.full_name,
    SUM(s.quantity * p.unit_price) AS total_spent,
    NTILE(4) OVER (
        ORDER BY SUM(s.quantity * p.unit_price) DESC
    ) AS spending_quartile,
    CUME_DIST() OVER (
        ORDER BY SUM(s.quantity * p.unit_price) DESC
    ) AS cumulative_distribution
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.full_name;

