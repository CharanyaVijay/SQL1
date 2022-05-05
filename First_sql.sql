1)
select LEFT([ Name],(FIND([ Name],' '))) as first_name ,count(distinct order_id)
from aus_sales 
group by first_name;



Splitting the names  calculation
First name - LEFT([ Name],(FIND([ Name],' '))) 
Last name - MID([ Name],FIND([Name],' '),LEN([ Name]))

2)select customer_id,sum(sales) from orders
where customer_id=
(select customer_id from orders where
product_subcategory=''Paper")
group by customer_id

3)
select 100*(curr.population - prev.population)/prev.population As Percentdiff,country
from population AS curr
JOIN population AS prev
on prev.year=1960 and  curr.year=2016;


Calculate percentage difference using sql
SELECT  
    100.0*(curr.Val - prev.Val) / prev.Val As PercentDiff
FROM yourTable As curr
JOIN yourTable As prev
    ON  curr.MonthStr = 'Aug-2013' AND prev.MonthStr = 'July-2013'

4)
Avg sales by year

select region,avg(sales) as avg
from super_store
where order_date=2012
group by region
oder by avg


5)select borrower_name,sum(loan_amt)
from loan_sample
where borrower_name=(select borrower_name from loan_sample where business_type='cafe')
group by borrower_name;

6)select products,sum(sales)
from superstore
where order_date<>2011
group by product;

7)select job_sector,sum(points)
from points_used  u inner join points_data d
on  u.client_id=d.client_id
where points_used='yes'
group by job_sector

8)select order_id, (ship_date-order_date) as num_days,sum(profit)
from orders
where num_days>20
group by order_id

9)

