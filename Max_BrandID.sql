use servify_assignment ;
select  BrandID,c1 from
 (
select cp.BrandID,count(sp.SoldPlanID) as c1 from consumer_product cp
left outer join sold_plan sp
on cp.ConsumerProductID=sp.ConsumerProductID group by BrandID order by count(sp.SoldPlanID) desc
 
) as v where c1 =(select max(c1)) limit 1

