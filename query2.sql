select 
    p.productline,
    AVG(o1.shippeddate-o1.orderdate) as media
from 
    orders o1 join orderdetails o2 on o1.ordernumber=o2.ordernumber join products p on p.productcode=o2.productcode  
    
group by 
    p.productline