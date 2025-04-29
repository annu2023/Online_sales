create database online_sales ;
DESCRIBE sales;
-- Monthly Revenue & Order Volume Query
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  COUNT(DISTINCT item_id) AS order_volume,
  SUM(total) AS total_revenue
FROM
  sales
GROUP BY
  year, month
ORDER BY
  year, month;
  
-- For one Year
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  COUNT(DISTINCT item_id) AS order_volume,
  SUM(total) AS total_revenue
FROM
  sales
WHERE
  order_date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY
  year, month
ORDER BY
  year, month;
  
-- Top 5 Revenue Months Across All Time
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  COUNT(DISTINCT item_id) AS order_volume,
  SUM(total) AS total_revenue
FROM
  sales
GROUP BY
  year, month
ORDER BY
  total_revenue DESC
LIMIT 5;

SELECT
  DATE_FORMAT(order_date, '%b-%Y') AS month_year,
  COUNT(DISTINCT item_id) AS order_volume,
  SUM(total) AS total_revenue
FROM
  sales
GROUP BY
  month_year
ORDER BY
  STR_TO_DATE(month_year, '%b-%Y');


-- Monthly Average Order Value
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  COUNT(DISTINCT item_id) AS order_volume,
  SUM(total) AS total_revenue,
  ROUND(SUM(total)/COUNT(DISTINCT item_id), 2) AS avg_order_value
FROM
  sales
GROUP BY
  year, month
ORDER BY
  year, month;
