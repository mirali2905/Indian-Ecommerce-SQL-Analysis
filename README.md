# Indian E-Commerce Sales Analysis Using SQL

## Project Overview

This project analyses 5,000 Indian e-commerce orders from January to December 2023 using MySQL.

The objective is to transform transactional sales data into meaningful business insights related to revenue performance, product categories, regional sales, payment preferences, delivery efficiency and customer ratings.

The project demonstrates practical SQL skills relevant to entry-level Data Analyst, Business Analyst and MIS Analyst roles.

## Tools & Technologies

- MySQL / MariaDB
- phpMyAdmin
- XAMPP
- Visual Studio Code
- SQL

## Dataset Overview

The dataset contains 5,000 orders and 13 columns.

**Key fields:**

- Order_ID
- Order_Date
- Customer_ID
- Gender
- Region
- Product
- Category
- Unit_Price
- Quantity
- Revenue
- Payment_Method
- Delivery_Time_Days
- Rating

**Data period:** January–December 2023

**Database:** `indian_ecommerce`

**Table:** `sales`

## Business Objectives

The analysis addresses the following questions:

1. What is the overall business performance?
2. Which product categories generate the highest revenue?
3. Which geographical regions perform best?
4. How does revenue change month by month?
5. Which payment methods are most frequently used?
6. How does delivery performance differ across regions?
7. Which product categories receive the highest customer ratings?
8. Which orders generate revenue above the overall average?
9. What percentage of total revenue does each category contribute?
10. How do product categories rank by revenue?
11. What is the month-over-month revenue growth?
12. Which product categories perform best within each region?

## SQL Skills Demonstrated

- SELECT, WHERE, GROUP BY and ORDER BY
- Aggregate functions: COUNT, SUM, AVG, MIN and MAX
- Subqueries
- Common Table Expressions (CTEs)
- Window functions: RANK and LAG
- PARTITION BY
- Date functions: MONTH and MONTHNAME
- Revenue contribution and growth calculations

## Key Business Findings

| Business Metric | Result |
|---|---:|
| Total Orders | 5,000 |
| Total Revenue | ₹23,08,87,933 |
| Total Quantity Sold | 10,246 |
| Average Order Value | ₹46,177.59 |
| Average Delivery Time | 5.46 days |
| Highest Revenue Category | Laptops |
| Highest Revenue Region | West |
| Highest Revenue Month | October |

### Additional Insights

- Laptops contribute 54.56% of total business revenue.
- Laptops and Smartphones together generate 85.61% of revenue.
- UPI has the highest order count, while Cash on Delivery generates the highest revenue among payment methods.
- October recorded the strongest month-over-month revenue growth at 16.19%.
- Laptops rank first in revenue generation across all five regions.

## Project Files

| File | Description |
|---|---|
| `ecommerce_analysis.sql` | 12 SQL queries covering business performance and advanced analysis |
| `business_insights.md` | Detailed business findings and recommendations |
| `indian_ecommerce_sales.csv` | Cleaned transactional dataset |

## How to Run This Project

1. Install MySQL or use XAMPP with phpMyAdmin.
2. Create a database named `indian_ecommerce`.
3. Create the `sales` table using the dataset schema.
4. Import the cleaned CSV dataset into the table.
5. Open `ecommerce_analysis.sql` and execute the queries.

The project was developed using MySQL-compatible SQL and tested through phpMyAdmin.

## Conclusion

This project demonstrates how SQL can be used to analyse business performance, identify revenue concentration, compare regional operations and measure sales trends.

The findings provide a foundation for data-driven business reporting and further investigation into product performance, customer behaviour and operational efficiency.