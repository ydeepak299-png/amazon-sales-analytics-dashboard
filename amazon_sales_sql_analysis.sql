Use amazon_sales_analysis;
Select count(*)
From amazon_sales;
Describe amazon_sales;
Select count(*) As total_orders
from amazon_sales;
Select 
Sum(Cast(nullif(amount,'')As Decimal(10,2))) As total_revenue
From amazon_sales;
Select 
Sum(qty) As total_quantity
From amazon_sales;
Select
Count(*) As cancelled_orders
From amazon_sales
where status Like '%Cancelled%';
Select 
Round(
Count(Case When status like '%cancelled%' Then 1 End)
*100.0/
Count(*),2
) As cancellation_rate
from amazon_sales;
Select
Round(
Sum(
Cast(Nullif(amount,'')As Decimal(10,2))
),2) As total_revenue
from amazon_sales;

Select
Category,
Round(sum(cast(nullif(amount,'')As Decimal(10,2))),2) As revenue
from amazon_sales
Group By Category
Order  By Revenue Desc;

Select
Ship_state,
Round(Sum(Cast(NUllif(amount,'') As Decimal(10,2))),2) As revenue
from amazon_sales
Group By Ship_state
Order By revenue Desc
Limit 10;
Select 
Ship_city,
Round(Sum(cast(Nullif(amount,'') As Decimal(10,2))),2) As revenue
from amazon_sales
group by Ship_city
order by revenue Desc
Limit 10;

Select
fulfilment,
Round(Sum(Cast(Nullif(amount,'') As Decimal(10,2))),2) As revenue
from amazon_sales
Group By Fulfilment;

Select
Courier_status,
Count(*) As total_orders
from amazon_sales
Group By courier_status
Order By total_orders Desc;

Select
size,
count(*) As orders
From amazon_sales 
Group By Size
Order By Orders Desc;

Select 
Category,
Count(*) as total_orders
from amazon_sales 
Group By Category
Order By total_orders Desc;

Select
Category,
Sum(qty) As quantity_sold
from amazon_sales 
Group By Category
Order By quantity_sold Desc;

Select 
Size,
Round(Sum(Cast(Nullif(amount,'') As Decimal(10,2))),2) As revenue
From amazon_sales 
Group By Size
Order By revenue Desc;

Select
Category,
Round(Avg(Cast(nullif(amount,'') As Decimal(10,2))),2) As avg_order_value
from amazon_sales 
Group By Category
Order By avg_order_value Desc;

Select
Date_Format(
Str_to_date(order_date,'%d-%m-%y'),
'%y-%m'
) As month,

Round(
Sum(Cast(Nullif(amount,'') As decimal(10,2))),2
) As revenue
From amazon_sales 
Group By month
Order By month;

Select
Date_format(
Str_to_date(order_date,'%d-%m-%y'),
'%y-%m'
) As month,
count(*) As total_orders 
From amazon_sales 
Group By month
Order By month;

Select
sku,
Round(
Sum(cast(Nullif(amount,'')As Decimal(10,2))),2
) As revenue
From amazon_sales 
Group By Sku
Order By revenue Desc
Limit 10;

Select
Sales_Channel,
Round(
Sum(Cast(Nullif(amount,'') As decimal(10,2))),2
)As revenue
From Amazon_sales 
Group By Sales_channel;

Select 
b2b,
count(*) AS total_orders
from amazon_sales 
Group By b2b;

Select
Category,
Round(
Sum(cast(nullif(amount,'') As decimal(10,2))),2
) as revenue
From amazon_sales 
group by category
Having revenue > 10000000
Order by revenue Desc;

Select
Ship_state,
Round(
Avg(Cast(Nullif(amount,'') As decimal(10,2))),2
) As average_revenue
from amazon_sales 
group by ship_state
order by average_revenue Desc;

Select 
Ship_state,
sum(qty) As quantity_sold
from amazon_sales 
Group By ship_state
Order By quantity_sold desc
limit 5;

Select
Case
When courier_status='' Then 'Unknown'
Else Courier_status
End as courier,
Round(
Sum(cast(Nullif(amount,'') As decimal(10,2))),2
) as revenue 
from amazon_sales
group by courier;

Select
Category,
Round(
Sum(cast(nullif(amount,'') as decimal (10,2))),2
) As revenue
from amazon_sales
group by category
order by revenue desc
limit 1;

Select 
sku,
count(*)As total_orders
from amazon_sales 
group by sku
order by total_orders Desc
Limit 10;

SELECT
    category,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN status LIKE '%Cancelled%' THEN 1 END) AS cancelled_orders,
    ROUND(
        COUNT(CASE WHEN status LIKE '%Cancelled%' THEN 1 END) * 100.0 / COUNT(*),2
    ) AS cancellation_rate
FROM amazon_sales
GROUP BY category
ORDER BY cancellation_rate DESC;

Select 
fulfilment,
Count(*) As total_orders,
count(case when status like '%cancelled%' Then 1 end) as cancelled_orders,
Round(
count(case when status like '%cfancelled%' Then 1 end) * 100.0/ count(*),2
) As cancellation_rate
From amazon_sales 
Group By Fulfilment;

Select 
DATE_FORMAT(STR_TO_DATE(order_date,'%d-%m-%Y'),'%Y-%m') AS month,
count(*) As total_orders,
Count(case when status like '%cancelled%' Then 1 End) As cancelled_orders,
Round(
Count(Case when status like '%cancelled%' Then 1 End)* 100.0/count(*),2
)
As cancellation_rate
from amazon_sales 
group by month
order by month;

Select
category,
Round(sum(cast(nullif(amount,'')As Decimal(10,2))),2)As revenue,
Rank() Over (
Order by sum(cast(nullif(amount,'')as decimal(10,2))) Desc
)
AS revenue_rank
from amazon_sales 
group by category;








