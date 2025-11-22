CREATE DATABASE sales_db;
USE sales_db;

CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO online_sales VALUES
(1, '2023-01-10', 101, 200),
(2, '2023-01-11', 102, 350),
(3, '2023-02-05', 101, 500),
(4, '2023-02-20', 103, 250),
(5, '2023-03-18', 104, 700);

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;

SELECT
    MONTH(order_date) AS order_month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_count
FROM online_sales
WHERE YEAR(order_date) = 2023
GROUP BY MONTH(order_date)
ORDER BY order_month;

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY monthly_revenue DESC
LIMIT 3;

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(IFNULL(amount, 0)) AS monthly_revenue
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date);

select * from online_sales;




