use eda1;
DESCRIBE merged_full_data;
SELECT COUNT(*) AS total_rows FROM merged_full_data;
SELECT * FROM merged_full_data;
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month_year,
       SUM(quantity * unit_price_usd) AS total_sales
FROM merged_full_data
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month_year; -- Sales trends and patterns
SELECT product_name,
       SUM(quantity) AS total_quantity_sold,
       SUM(quantity * unit_price_usd) AS total_revenue
FROM merged_full_data
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10; -- Product Performance Analysis
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    COUNT(DISTINCT customer_key) AS total_customers
FROM merged_full_data
GROUP BY age_group
ORDER BY age_group;-- Customer Age Distribution
SELECT country_x AS country,
       SUM(quantity * unit_price_usd) AS total_sales
FROM merged_full_data
GROUP BY country
ORDER BY total_sales DESC;-- Geographic analysis
SELECT store_key,
       SUM(quantity * unit_price_usd) AS store_revenue
FROM merged_full_data
GROUP BY store_key
ORDER BY store_revenue DESC;-- Store performance
SELECT 
    product_name, 
    SUM((unit_price_usd - unit_cost_usd) * quantity) AS total_profit
FROM 
    merged_full_data
GROUP BY 
    product_name
ORDER BY 
    total_profit DESC
LIMIT 10;-- Top 10 most profitable products
SELECT 
    category, 
    SUM(quantity * unit_price_usd) AS total_sales
FROM 
    merged_full_data
GROUP BY 
    category
ORDER BY 
    total_sales DESC;-- Top Selling Categories
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month, 
    currency_code, 
    SUM(unit_price_usd * quantity) AS total_sales,
    AVG(Exchanges) AS avg_exchange_rate
FROM 
    merged_full_data
GROUP BY 
    month, currency_code
ORDER BY 
    month, currency_code;-- Fluctuation of exchange rates affecting sales over time








