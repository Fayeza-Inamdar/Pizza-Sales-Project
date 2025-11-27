USE pizzasales;

SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

SELECT SUM(total_price) /COUNT(DISTINCT order_id) AS Avg_Order_Value 
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

SELECT COUNT( DISTINCT order_id) AS Total_Orders_Placed
FROM pizza_sales;

-- AVG PIZZAS PER ORDER--
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_pizzas_per_order
FROM pizza_sales;

SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    pizza_sales
GROUP BY 
    order_day
ORDER BY 
    FIELD(order_day, 
           'Monday', 'Tuesday', 'Wednesday', 'Thursday', 
           'Friday', 'Saturday', 'Sunday');
           
SELECT monthname(STR_TO_DATE(order_date, '%d-%m-%Y')) As Order_Month, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY monthname(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY Total_orders desc;

-- PERCENTAGE OF SALES BY PIZZA CATEGORY --

SELECT pizza_category, SUM(Total_price) AS Total_Sales , SUM(Total_price) *100/ 
(SELECT SUM(Total_price) FROM pizza_sales ) AS PER_TOTAL_SALES
FROM pizza_sales
GROUP BY pizza_category;

-- PERCENTAGE OF SALES BY PIZZA SIZE --
SELECT pizza_size, CAST(SUM(Total_price) AS DECIMAL(10,2)) AS Total_Sales , cast( SUM(Total_price) *100/ (SELECT SUM(Total_price) FROM pizza_sales ) AS DECIMAL(10,2)) AS PER_TOTAL_SALES
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PER_TOTAL_SALES DESC;

-- TOP 5 PIZZAS --
SELECT pizza_name, SUM(Total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS --
SELECT pizza_name, SUM(Total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- TOP 5 PIZZAS BY QUANTITY --
SELECT pizza_name, SUM(quantity) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY QUANTITY --
SELECT pizza_name, SUM(quantity) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- TOP 5 (Best selling) PIZZAS BY ORDERS--
SELECT pizza_name, COUNT(DISTINCT Order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- Bottom 5 (Best selling) PIZZAS BY ORDERS--
SELECT pizza_name, COUNT(DISTINCT Order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders
LIMIT 5;

