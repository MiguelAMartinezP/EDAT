select 
    e3.employeenumber, e3.lastname 
from 
    employees e3
where 
    e3.reportsto in (

select 
    e2.employeenumber
from 
    employees e2 
where 
    e2.reportsto=(

select 
    e.employeenumber
from 
    employees e 
where 
    e.reportsto is NULL))

