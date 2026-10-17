
-- =====================================================
-- PROJECT: Indian E-Commerce Sales Analysis
-- DATABASE: indian_ecommerce
-- =====================================================

USE indian_ecommerce;

-- QUERY 01: OVERALL BUSINESS PERFORMANCE
-- Business Question:
-- What are the overall sales and delivery KPIs?

SELECT
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Revenue) AS Total_Revenue,
    ROUND(AVG(Revenue), 2) AS Average_Order_Value,
    ROUND(AVG(Delivery_Time_Days), 2) AS Average_Delivery_Days
FROM sales;



-- =====================================================
-- QUERY 02: REVENUE ANALYSIS BY PRODUCT CATEGORY
-- Business Question:
-- Which product categories generate the most revenue?
-- =====================================================

SELECT
    Category,
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC;



-- =====================================================
-- QUERY 03: REGIONAL SALES PERFORMANCE
-- Business Question:
-- Which regions generate the highest revenue,
-- and how does average order value differ?
-- =====================================================

SELECT
    Region,
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Revenue) AS Total_Revenue,
    ROUND(AVG(Revenue), 2) AS Average_Order_Value
FROM sales
GROUP BY Region
ORDER BY Total_Revenue DESC;



-- =====================================================
-- QUERY 04: MONTHLY REVENUE TREND
-- Business Question:
-- How does sales performance change month by month?
-- Which months generate the highest and lowest revenue?
-- =====================================================

SELECT
    MONTH(Order_Date) AS Month_Number,
    MONTHNAME(Order_Date) AS Month_Name,
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Revenue) AS Total_Revenue
FROM sales
GROUP BY
    MONTH(Order_Date),
    MONTHNAME(Order_Date)
ORDER BY Month_Number ASC;



-- =====================================================
-- QUERY 05: PAYMENT METHOD ANALYSIS
-- Business Question:
-- Which payment methods are used most frequently,
-- and which generate the highest revenue?
-- =====================================================

SELECT
    Payment_Method,
    COUNT(*) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue,
    ROUND(AVG(Revenue), 2) AS Average_Order_Value
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Orders DESC;



-- =====================================================
-- QUERY 06: REGIONAL DELIVERY PERFORMANCE
-- Business Question:
-- Which regions have the longest average delivery times?
-- =====================================================

SELECT
    Region,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Delivery_Time_Days), 2) AS Average_Delivery_Days,
    MIN(Delivery_Time_Days) AS Minimum_Delivery_Days,
    MAX(Delivery_Time_Days) AS Maximum_Delivery_Days
FROM sales
GROUP BY Region
ORDER BY Average_Delivery_Days DESC;



-- =====================================================
-- QUERY 07: CUSTOMER RATING ANALYSIS
-- Business Question:
-- Which product categories receive the highest
-- and lowest average customer ratings?
-- =====================================================

SELECT
    Category,
    COUNT(Rating) AS Total_Ratings,
    ROUND(AVG(Rating), 2) AS Average_Rating,
    MIN(Rating) AS Minimum_Rating,
    MAX(Rating) AS Maximum_Rating
FROM sales
GROUP BY Category
ORDER BY Average_Rating DESC;



-- =====================================================
-- QUERY 08: HIGH-VALUE ORDERS ANALYSIS
-- Business Question:
-- Which are the top 10 highest-revenue orders
-- exceeding the overall average order value?
-- =====================================================

SELECT
    Order_ID,
    Order_Date,
    Region,
    Category,
    Revenue
FROM sales
WHERE Revenue > (
    SELECT AVG(Revenue)
    FROM sales
)
ORDER BY Revenue DESC
LIMIT 10;



-- =====================================================
-- QUERY 09: REVENUE CONTRIBUTION BY CATEGORY
-- Business Question:
-- What percentage of overall business revenue
-- does each product category contribute?
-- =====================================================

SELECT
    Category,
    SUM(Revenue) AS Total_Revenue,
    ROUND(
        SUM(Revenue) * 100.0 /
        (SELECT SUM(Revenue) FROM sales),
        2
    ) AS Revenue_Contribution_Percentage
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC;



-- =====================================================
-- QUERY 10: PRODUCT CATEGORY REVENUE RANKING
-- Business Question:
-- How do product categories rank based on
-- their total revenue contribution?
-- =====================================================

WITH CategorySales AS (
    SELECT
        Category,
        SUM(Revenue) AS Total_Revenue
    FROM sales
    GROUP BY Category
)
SELECT
    Category,
    Total_Revenue,
    RANK() OVER (
        ORDER BY Total_Revenue DESC
    ) AS Revenue_Rank
FROM CategorySales
ORDER BY Total_Revenue DESC;



-- =====================================================
-- QUERY 11: MONTHLY REVENUE GROWTH ANALYSIS
-- Business Question:
-- How does monthly revenue change compared
-- with the previous month?
-- =====================================================

WITH MonthlySales AS (
    SELECT
        MONTH(Order_Date) AS Month_Number,
        MONTHNAME(Order_Date) AS Month_Name,
        SUM(Revenue) AS Total_Revenue
    FROM sales
    GROUP BY
        MONTH(Order_Date),
        MONTHNAME(Order_Date)
),

MonthlyComparison AS (
    SELECT
        Month_Number,
        Month_Name,
        Total_Revenue,
        LAG(Total_Revenue) OVER (
            ORDER BY Month_Number
        ) AS Previous_Month_Revenue
    FROM MonthlySales
)

SELECT
    Month_Number,
    Month_Name,
    Total_Revenue,
    Previous_Month_Revenue,
    ROUND(
        (Total_Revenue - Previous_Month_Revenue)
        * 100.0 /
        NULLIF(Previous_Month_Revenue, 0),
        2
    ) AS Growth_Percentage
FROM MonthlyComparison
ORDER BY Month_Number;



-- =====================================================
-- QUERY 12: REGIONAL PRODUCT PERFORMANCE
-- Business Question:
-- How do product categories rank by revenue
-- within each geographical region?
-- =====================================================

WITH RegionalSales AS (
    SELECT
        Region,
        Category,
        SUM(Revenue) AS Total_Revenue
    FROM sales
    GROUP BY
        Region,
        Category
)

SELECT
    Region,
    Category,
    Total_Revenue,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY Total_Revenue DESC
    ) AS Regional_Rank
FROM RegionalSales
ORDER BY
    Region,
    Regional_Rank;
