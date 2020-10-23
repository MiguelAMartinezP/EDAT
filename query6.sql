select 
    o.productcode as Producto1,
    o2.productcode as Producto2,
    Count(o.ordernumber) as Carro
from 
    orderdetails o 
    join orderdetails o2 on o.ordernumber = o2.ordernumber
    and o.productcode < o2.productcode
group by 
    o.productcode,
    o2.productcode
having 
    Count(o.ordernumber) > 1;