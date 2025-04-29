# Online_sales

# 📊 Monthly Sales Analysis with MySQL

This project provides SQL-based analysis of monthly sales data, using a `sales.csv` dataset imported into MySQL.

## 📁 Dataset

The dataset contains records of customer orders with key fields such as:

- `order_date`: Date of the order
- `item_id`: Unique item identifier
- `total`: Revenue from the item

## 📌 Key Metrics

The analysis computes the following monthly metrics:
- 📆 **Year and Month** (using `EXTRACT`)
- 📦 **Order Volume** (count of distinct `item_id`)
- 💰 **Total Revenue** (sum of `total`)
- 🧮 **Average Order Value** (total revenue / order volume)

## 🛠 SQL Highlights

- Aggregation using `SUM()` and `COUNT(DISTINCT ...)`
- Time extraction using `EXTRACT(YEAR FROM ...)`
- Grouping by expressions (to comply with `ONLY_FULL_GROUP_BY`)
- Sorting and limiting results to show trends and top performers

## 📊 Example Query

```sql
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  COUNT(DISTINCT item_id) AS order_volume,
  SUM(total) AS total_revenue,
  ROUND(SUM(total) / COUNT(DISTINCT item_id), 2) AS avg_order_value
FROM
  sales
GROUP BY
  EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY
  year, month;

## 📦 Tools Used

    MySQL (with ONLY_FULL_GROUP_BY mode enabled)

    SQL client (MySQL Workbench )
