
-- =====================================================
-- INDIAN E-COMMERCE SALES ANALYSIS
-- DATABASE SETUP SCRIPT
-- =====================================================

CREATE DATABASE IF NOT EXISTS indian_ecommerce;

USE indian_ecommerce;

CREATE TABLE IF NOT EXISTS sales (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Gender VARCHAR(10),
    Region VARCHAR(20),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Unit_Price DECIMAL(12,2),
    Quantity INT,
    Revenue DECIMAL(12,2),
    Payment_Method VARCHAR(30),
    Delivery_Time_Days INT,
    Rating INT
);

-- Import indian_ecommerce_sales.csv into the sales
-- table using phpMyAdmin after creating the table.

-- Validation: Expected 5,000 records.
SELECT COUNT(*) AS Total_Orders
FROM sales;

-- Validation: Expected revenue = 230887933.00
SELECT SUM(Revenue) AS Total_Revenue
FROM sales;
