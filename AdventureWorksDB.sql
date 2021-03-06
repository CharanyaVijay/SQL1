1.select firstName,EmailAddress,CompanyName from customer
where CompanyName = 'Bike World'

2.select c.CompanyName from customer c 
join customeraddress ca on c.customerid=ca.customerid
join address a on ca.addressid=a.addressid
where a.city='Dallas'

3.select count(*) from product
where listprice>1000

4.select c.companyname from customer c join salesorderheader s
on c.customerid=s.customerid
where (subtotal+taxamt+freight)>100000

5.select count(p.productid) from customer c join salesorderheader s 
on c.customerid=s.customerid
join salesorderdetail sd on s.salesorderid=sd.salesorderid
join product p on sd.productid=p.productid
where companyname='Riding Cycles'
and p.name='Racing Socks, L'


6.select sd.salesorderid,sd.unitprice from salesorderdetail sd
join salesorderheader so on sd.salesorderid=so.salesorderid
join customer c on so.customerid=c.customerid
where sd.orderqty=1


7.select p.name,c.companyname
from customer c join salesorderheader sh
on c.customerid=sh.customerid
join salesorderdetail sd
on sh.salesorderid=sd.salesorderid
join product p
on p.productid=sd.productid
join productmodel pm 
on pm.productmodelid=p.productmodelid
where pm.name = 'Racing Socks'


8.select description 
from productdescription pd join productmodelproductdescription pmpd
on pd.productdescriptionid=pmpd.productdescriptionid
join productmodel pmod 
on pmod.productmodelid=pmpd.productmodelid
join product p
on p.productmodelid=pmod.productmodelid
where p.productid=736

9.select c.companyname,sum(subtotal) Subtotal,sum(p.weight) Weight
from salesorderheader so join customer c
on so.customerid=c.customerid
join salesorderdetail sd
on sd.salesorderid=so.salesorderid
join product p
on p.productid=sd.productid
group by c.companyname
order by sum(subtotal) desc

10.select count(p.productid) from product p join productcategory pc
on p.productcategoryid=pc.productcategoryid
join salesorderdetail sd on sd.productid =p.productid
join salesorderheader sh 
on sh.salesorderid=sd.salesorderid
join address a
on a.addressid=sh.shiptoaddressid
where pc.name='Cranksets'

11.select c.companyname,
max(case when addresstype='Main Office' then Addressline1 else ' ' end) as 'Main Office address',
max(case when addresstype='Shipping' then Addressline1 else ' ' end) as 'Shipping address'
from customer c join customeraddress ca
on c.customerid=ca.customerid
join address a 
on ca.addressid=a.addressid
where a.city='Dallas'
group by c.companyname

12.select sh.salesorderid, subtotal,sum(unitprice) UnitPrice,sum(listprice) ListPrice
from salesorderheader sh join salesorderdetail sd
on sh.salesorderid=sd.salesorderid
join product p
on p.productid=sd.productid
group by sh.salesorderid,subtotal

13.select p.name,
sum(unitprice * orderqty) as Total_Sale_Value
from product p join salesorderdetail sd
on p.productid=sd.productid
group by p.name
order by Total_Sale_Value desc

14.select 
t.range as 'range',
count(t.total) as 'Num of orders',
sum(t.total) as 'total value'
from
(select
case when (salesorderdetail.unitprice*salesorderdetail.orderqty) between 0 and 99
then '0-99'
when (salesorderdetail.unitprice*salesorderdetail.orderqty) between 100 and 999
then '100-999'
when (salesorderdetail.unitprice*salesorderdetail.orderqty) between 1000 and 9999
then '1000-9999'
when (salesorderdetail.unitprice*salesorderdetail.orderqty) >10000
then '10000-'
else
'ERROR'
end as 'range',
(salesorderdetail.orderqty*salesorderdetail.unitprice) as total
from 
salesorderdetail
)t
group by t.range

15.DECLARE @counter int;
set @counter = 0;
select pc.name  as Catergory_name,
a.city  'City',
sum(sd.orderqty*sd.unitprice) as total
from address a join salesorderheader so
on a.addressid=so.shiptoaddressid
join salesorderdetail sd
on so.salesorderid=sd.salesorderid
join product p
on sd.productid=p.productid
join productcategory pc
on pc.productcategoryid=p.productcategoryid
where a.city in
( select t.city
from
(
select t.*,
@counter = @counter+1 as counter
from
(select 
@counter = 0)  as initvar,
(select address.city,
sum(sh.subtotal) as city_total
from address join salesorderheader sh
on address.addressid=sh.shiptoaddressid
group by address.city
order by city_total desc ) as t
)as t
where t.counter<=3
)
group by pc.name,a.city


RESIT QUESTIONS
1.
select salesorderid from salesorderheader right join customer
on salesorderheader.customerid=customer.customerid
where companyname like '%Good Toys%' or companyname like '%Bike World%'


2.select p.name,sd.Orderqty as Order_Quantity from
product p join salesorderdetail sd 
on p.productid=sd.productid
join salesorderheader sh
on sh.salesorderid=sd.salesorderid
join customer c 
on sh.customerid=c.customerid
where c.companyname = 'Futuristic Bikes'

3.select c.companyname,
a.addressline1,
a.addressline2,
a.city,
a.stateprovince,
a.CountyRegion,
a.postalcode
from (
SELECT DISTINCT
      CustomerID,
      CompanyName,
      1 AS 'Rank'
    FROM
      Customer
    WHERE
      lOWER(CompanyName) LIKE '%bike%'
    UNION
    SELECT DISTINCT
      CustomerID,
      CompanyName,
      2 AS 'Rank'
    FROM
      Customer
    WHERE
      LOWER(CompanyName) LIKE '%cycle%') As c 
join customeraddress ca
on c.customerid=ca.customerid
join address a
on a.addressid=ca.addressid
where c.companyname like '%bike%'
or c.companyname like '%cycle%'
order by  c.Rank,
  c.CompanyName;

4.select a.countyregion,
sum(sh.subtotal) as total
from address a join salesorderheader sh
on a.addressid=sh.shiptoaddressid
group by a.countyregion
order by total desc

5.select c.companyname,a.countyregion,sum(sd.unitprice*sd.orderqty) as Total
from customer c join customeraddress  ca on c.customerid=ca.customerid
join address a on a.addressid=ca.addressid
join salesorderheader so on so.customerid=c.customerid
join salesorderdetail sd on sd.salesorderid=so.salesorderid
group by c.companyname,
a.countyregion
order by total desc
