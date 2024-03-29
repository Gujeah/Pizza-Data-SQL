select * from pizza_sales   
--finding total revenue---
select sum(total_price) as TotalRevenue from pizza_sales        
----finding average order value---     
select sum(total_price)/count(distinct order_id) as AverageOrderValues from pizza_sales    
---Finding total pizza sold----      
select sum(quantity) as Total_Pizza_Sold from pizza_sales 
---Total Orders-----
select count(distinct order_id) as Total_Orders from pizza_sales
---calculating average pizza per order---
select cast(cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as AveragePizzaPerOrder from pizza_sales
 -----Hourly trend for total pizza sold--
select  datepart(hour, order_time) as order_hour ,sum(quantity) as TotalPizzaSold from pizza_sales
group by datepart(hour, order_time)
order by datepart(hour, order_time)
----Weekely trend for total orders---
select  datepart(ISO_WEEK, order_time), year(order_date) as OrderYear,count(distinct order_id) as TotalOrders from pizza_sales
group by datepart(ISO_WEEK, order_time),year(order_date)
order by datepart(ISO_WEEK, order_time),year(order_date)
---calculating percentage of sales by pizza category depending on months--
SELECT 
  pizza_category,
  SUM(total_price) AS total_sales,
  SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales where month(order_date)=1)  AS percentage_of_total_sales
FROM 
  pizza_sales
  where month(order_date)=1
GROUP BY 

  pizza_category;

--Calculating percentage of pizza sales by pizza size
select * from pizza_sales
select pizza_size, sum(total_price) as total_sales, cast (sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size

--Finding 5 best sellers by revenue, total quality and total orders
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc

select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc

select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc
---Finding the 5 bottom seller by revenue, total quality and total orders
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue 

select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity 

select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders 
                           