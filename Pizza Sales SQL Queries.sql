
select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price)/count(distinct order_id)
as Avg_Order_Value from pizza_sales


select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(distinct order_id)
as Total_Orders from pizza_sales

select cast(cast(sum(quantity) 
as decimal (10,2))/
cast(count(distinct order_id)
as decimal (10,2)) as decimal (10,2))
as Avg_Pizza_per_order from pizza_sales




select datename(weekday, order_date) as order_day,
count(distinct order_id) as Total_orders
from pizza_sales group by datename(weekday, order_date)

select datename(month, order_date) as Month_Name,
count(distinct order_id) as Total_orders
from pizza_sales group by datename(month, order_date)
order by count(distinct order_id) desc


select pizza_category,
sum(total_price) * 100 /
(select sum(total_price)
from pizza_sales where MONTH(order_date) = 1) as Total_sales
from pizza_sales 
where MONTH(order_date) = 1
group by pizza_category


select pizza_size, sum(total_price) * 100
/ count(pizza_size) as percent_by_pizza_size
from pizza_sales group by pizza_size



select pizza_size,
cast(sum(total_price) as decimal (10,2)) as total_sales,
cast(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales
where datepart(Quarter, order_date) = 1) as decimal (10,2))as PCT
from pizza_sales
where datepart(QUARTER, order_date) = 1
group by pizza_size
order by PCT DESC

select top 5 pizza_name,
sum(total_price) as Total_revenue
from pizza_sales group by pizza_name
order by sum(total_price) Desc



select top 5 pizza_name,
sum(total_price) as Total_revenue
from pizza_sales group by pizza_name
order by sum(total_price) Asc


select top 5 pizza_name,
sum(quantity) as Total_Quantity
from pizza_sales group by pizza_name
order by sum(total_price) desc

select top 5 pizza_name,
count(distinct order_id) as Total_Orders
from pizza_sales group by pizza_name
order by count(distinct order_id) desc






select * from pizza_sales