
CREATE DATABASE adidas_sales_db;

USE adidas_sales_db;


CREATE TABLE adidas_sales (d
    Retailer VARCHAR(100),
    Retailer_ID INT,
    Invoice_Date DATE,
    Region VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    Product VARCHAR(100),
    Price_Per_Unit DECIMAL(10, 2),
    Units_Sold INT,
    Total_Sales DECIMAL(15, 2),
    Operating_Profit DECIMAL(15, 2),
    Operating_Margin DECIMAL(5, 2),
    Sales_Method VARCHAR(50)
);


SELECT * from adidas_sales;



-- Total Sales by Region
SELECT 
    Region, 
    SUM(Total_Sales) AS Total_Regional_Sales
FROM 
    adidas_sales
GROUP BY 
    Region
ORDER BY 
    Total_Regional_Sales DESC;
    
    
    
-- Invoice Count Per City
SELECT 
    City, 
    COUNT(DISTINCT Invoice_Date) AS Invoice_Count
FROM 
    adidas_sales
GROUP BY 
    City
ORDER BY 
    Invoice_Count DESC;



-- Top 5 Best-Selling Products
SELECT 
    Product, 
    SUM(Units_Sold) AS Total_Units_Sold
FROM 
    adidas_sales
GROUP BY 
    Product
ORDER BY 
    Total_Units_Sold DESC
LIMIT 5;



-- Average Price Per Unit by Product
SELECT 
    Product, 
    AVG(Price_Per_Unit) AS Average_Price
FROM 
    adidas_sales
GROUP BY 
    Product
ORDER BY 
    Average_Price DESC;




-- The month with the Highest Sales
SELECT 
    DATE_FORMAT(Invoice_Date, '%Y-%m') AS Sales_Month, 
    SUM(Total_Sales) AS Monthly_Sales
FROM 
    adidas_sales
GROUP BY 
    Sales_Month
ORDER BY 
    Monthly_Sales DESC
LIMIT 1;




-- Average Units Sold per Transaction
SELECT 
    AVG(Units_Sold) AS Avg_Units_Per_Transaction
FROM 
    adidas_sales;




-- Sales Performance by Retailer
SELECT 
    Retailer, 
    SUM(Total_Sales) AS Retailer_Sales
FROM 
    adidas_sales
GROUP BY 
    Retailer
ORDER BY 
    Retailer_Sales DESC;



-- Profit Margins by Region
SELECT 
    Region, 
    AVG(Operating_Margin) AS Average_Operating_Margin
FROM 
    adidas_sales
GROUP BY 
    Region
ORDER BY 
    Average_Operating_Margin DESC;




-- Regions with Sales Above a Threshold
SELECT 
    Region, 
    SUM(Total_Sales) AS Total_Sales
FROM 
    adidas_sales
GROUP BY 
    Region
HAVING 
    SUM(Total_Sales) > 1000000
ORDER BY 
    Total_Sales DESC;



-- Breakdown by Sales Method
SELECT 
    Sales_Method, 
    SUM(Total_Sales) AS Sales_By_Method
FROM 
    adidas_sales
GROUP BY 
    Sales_Method
ORDER BY 
    Sales_By_Method DESC;



-- Rank States by Profit
SELECT 
    State, 
    SUM(Operating_Profit) AS Total_Profit,
    RANK() OVER (ORDER BY SUM(Operating_Profit) DESC) AS Profit_Rank
FROM 
    adidas_sales
GROUP BY 
    State;




-- Yearly Trends in Units Sold
SELECT 
    YEAR(Invoice_Date) AS Sales_Year, 
    SUM(Units_Sold) AS Total_Units_Sold, 
    SUM(Total_Sales) AS Total_Sales
FROM 
    adidas_sales
GROUP BY 
    Sales_Year
ORDER BY 
    Sales_Year;
