select 
	c.customername,
	c.customernumber,
	sum(p.amount) as Total
	
from 
	customers c , payments p 
	

where c.customernumber = p.customernumber and c.customernumber in (
    select
	    o.customernumber
    from
	    orders o,
	    orderdetails o2,
	    products p2
    where
	    o2.ordernumber = o.ordernumber
	    and o2.productcode = p2.productcode
	    and p2.productname = '1940 Ford Pickup Truck')
group by
    c.customername,
    c.customernumber
order by
    Total desc