select 
    o.officecode,
    sum(o3.quantityordered) as ProductosVendidos
from 
    employees e
    join offices o on e.officecode = o.officecode 
    join customers c on c.salesrepemployeenumber = e.employeenumber
    join orders o1 on o1.customernumber = c.customernumber
    join orderdetails o3 on o3.ordernumber = o1.ordernumber
group by 
    o.officecode
order by 
    ProductosVendidos DESC 
LIMIT 1;