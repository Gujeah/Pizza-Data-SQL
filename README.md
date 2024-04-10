<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
</head>
<body>

<h1>Pizza Sales Analysis</h1>

<p>Welcome to the Pizza Sales Analysis repository! In this project, I analyze pizza sales data to uncover insights into customer behavior and sales trends.</p>
<p>This project has been an invaluable learning experience for me. By working with real-world data and applying various SQL queries, I've gained hands-on experience in data analysis and visualization. Throughout the project, I've developed a deeper understanding of SQL querying, data aggregation, and trend analysis.</p>

<h2>Understanding the Data</h2>
<p>The dataset, <code>pizza_sales</code>, contains information about pizza orders, including details such as order ID, pizza name, quantity, total price, order time, and date.</p>

<h2>Analysis Queries</h2>

<h3>Total Revenue</h3>
<p>To find the total revenue generated from pizza sales:</p>
<pre><code>SELECT SUM(total_price) AS TotalRevenue FROM pizza_sales;</code></pre>

<h3>Average Order Value</h3>
<p>To calculate the average order value:</p>
<pre><code>SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS AverageOrderValue FROM pizza_sales;</code></pre>

<h3>Total Pizza Sold</h3>
<p>To determine the total number of pizzas sold:</p>
<pre><code>SELECT SUM(quantity) AS TotalPizzaSold FROM pizza_sales;</code></pre>

<h3>Total Orders</h3>
<p>To count the total number of orders:</p>
<pre><code>SELECT COUNT(DISTINCT order_id) AS TotalOrders FROM pizza_sales;</code></pre>

<h3>Average Pizza per Order</h3>
<p>To calculate the average number of pizzas per order:</p>
<pre><code>SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS AveragePizzaPerOrder FROM pizza_sales;</code></pre>

<h3>Hourly Trend for Total Pizza Sold</h3>
<p>To analyze the hourly trend for pizza sales:</p>
<pre><code>SELECT DATEPART(hour, order_time) AS order_hour, SUM(quantity) AS TotalPizzaSold FROM pizza_sales GROUP BY DATEPART(hour, order_time) ORDER BY order_hour;</code></pre>

<h3>Weekly Trend for Total Orders</h3>
<p>To examine the weekly trend for total orders:</p>
<pre><code>SELECT DATEPART(ISO_WEEK, order_time) AS WeekNumber, YEAR(order_date) AS OrderYear, COUNT(DISTINCT order_id) AS TotalOrders FROM pizza_sales GROUP BY DATEPART(ISO_WEEK, order_time), YEAR(order_date) ORDER BY OrderYear, WeekNumber;</code></pre>

<h3>Percentage of Sales by Pizza Category (Month-wise)</h3>
<p>To calculate the percentage of sales by pizza category for a specific month:</p>
<pre><code>SELECT pizza_category, SUM(total_price) AS total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS percentage_of_total_sales FROM pizza_sales WHERE MONTH(order_date) = 1 GROUP BY pizza_category;</code></pre>

<h3>Percentage of Pizza Sales by Pizza Size</h3>
<p>To analyze the percentage of pizza sales by pizza size:</p>
<pre><code>SELECT pizza_size, SUM(total_price) AS total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT FROM pizza_sales GROUP BY pizza_size;</code></pre>

<h3>Top and Bottom Sellers</h3>

<h4>Top 5 Best Sellers by Revenue</h4>
<pre><code>SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales GROUP BY pizza_name ORDER BY total_revenue DESC;</code></pre>

<h4>Top 5 Best Sellers by Total Quantity Sold</h4>
<pre><code>SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity FROM pizza_sales GROUP BY pizza_name ORDER BY total_quantity DESC;</code></pre>

<h4>Top 5 Best Sellers by Total Orders</h4>
<pre><code>SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY pizza_name ORDER BY total_orders DESC;</code></pre>

<h4>Bottom 5 Sellers by Revenue</h4>
<pre><code>SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales GROUP BY pizza_name ORDER BY total_revenue;</code></pre>

<h4>Bottom 5 Sellers by Total Quantity Sold</h4>
<pre><code>SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity FROM pizza_sales GROUP BY pizza_name ORDER BY total_quantity;</code></pre>

<h4>Bottom 5 Sellers by Total Orders</h4>
<pre><code>SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY pizza_name ORDER BY total_orders;</code></pre>




<h2>Conclusion</h2>
<p>Overall, this project has not only enhanced my technical skills but also taught me the importance of data-driven decision-making. Analyzing pizza sales data has provided valuable insights that can be utilized to optimize business strategies and improve customer satisfaction. I look forward to applying the knowledge and skills gained from this project to future data analysis endeavors.</p>

</body>
</html>
