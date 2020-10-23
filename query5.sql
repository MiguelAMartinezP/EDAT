select 
    o.country as Pais,
    Count(*) as NumOficinas
from 
    offices o 
where not exists(
    select 
        o2.ordernumber
    from 
        orders o2
        join customers c on c.customernumber = o2.customernumber
        join employees e on c.salesrepemployeenumber = e.employeenumber
    where 
        o2.orderdate >= '2003-01-01'
        and o2.orderdate <= '2003-12-31'
        and o2.status <> 'Cancelled' 
        and e.officecode = o.officecode
    )
group by 
    Pais 
order by 
    NumOficinas DESC;