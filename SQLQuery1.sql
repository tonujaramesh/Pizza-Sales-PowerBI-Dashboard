
SELECT * FROM pizza_sales ;

SELECT DATENAME (DW, order_date) as order_day , 
COUNT(DISTINCT order_id) AS Total_orders from pizza_sales 
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME (MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id)AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

SELECT pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100/(SELECT sum(total_price) from pizza_sales) AS PCT
from pizza_sales 
GROUP BY pizza_category

SELECT pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100/
(SELECT sum(total_price) from pizza_sales WHERE MONTH (order_date) = 1) AS PCT
from pizza_sales 
WHERE MONTH (order_date) =1
GROUP BY pizza_category

SELECT pizza_size, CAST (sum(total_price) AS DECIMAL (10,2))as Total_Sales,CAST( sum(total_price) * 100/
(SELECT sum(total_price) from pizza_sales ) AS DECIMAL(10,2)) AS PCT
from pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_name , SUM(total_price) AS Total_Revenue FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name , SUM(total_price) AS Total_Revenue FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


SELECT TOP 5 pizza_name , SUM(quantity) AS Total_Quantity FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

SELECT TOP 5 pizza_name , COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Orders ASC