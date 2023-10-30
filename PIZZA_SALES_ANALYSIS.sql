-- KEY PERFORMANCE INDICATOR ----

-- 1. FIND THE TOTAL REVENUE --
SELECT SUM(unit_price * quantity) as Total_Revenue
FROM pizza_project.`pizza_sales excel file`;

-- 2. Average order value --
select SUM(unit_price * quantity)/count(distinct order_id) as Average_order_value
FROM pizza_project.`pizza_sales excel file`;

-- 3. Total pizzas sold --
select sum(quantity) as Total_pizza_sold
FROM pizza_project.`pizza_sales excel file`;

-- 4. Total orders --
select count(distinct order_id) as Total_orders
FROM pizza_project.`pizza_sales excel file`;

-- 5. Average pizzas per order -- 
select round(sum(quantity)/count(distinct order_id), 2) as Average_pizza_per_order
FROM pizza_project.`pizza_sales excel file`;

-- 6. Hourly Trend for pizzas sold --
select hour (order_time) as order_hour, sum(quantity) as Total_pizza_sold
FROM pizza_project.`pizza_sales excel file`
group by hour (order_time)
order by Total_pizza_sold desc;

-- 7. Percentage of sale by pizza category --
select pizza_category, sum(total_price)*100/ (select sum(total_price) from pizza_project.`pizza_sales excel file`) as Percent_of_sale
FROM pizza_project.`pizza_sales excel file`
group by pizza_category;

-- 7. Percentage of sale by pizza size--
select pizza_size,sum(total_price) as total_sale, sum(total_price)*100/ (select sum(total_price) from pizza_project.`pizza_sales excel file`) as Percent_of_sale
FROM pizza_project.`pizza_sales excel file`
group by pizza_size
order by percent_of_sale desc;

-- Top 5 best sellers by revenue and Total quantity --
select pizza_name_id, sum(total_price) as Revenue, count(quantity) as Total_quantity
from pizza_project.`pizza_sales excel file`
group by  pizza_name_id
order by Revenue desc




