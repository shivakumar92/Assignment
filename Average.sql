use servify_assignment ;
select sv_year,sv_month,sv_week,avg(c_spid) from (
select year(DOP) as sv_year,month(DOP) as sv_month,week(DOP) as sv_week,count(spid) as c_spid from (
select cp.DateOfPurchase as DOP,cp.ConsumerProductID as cpid,sp.SoldPlanID as spid from consumer_product cp
left outer join
(select SoldPlanID,ConsumerProductID from sold_plan) sp
on cp.ConsumerProductID=sp.ConsumerProductID
#and year(DateOfPurchase)='2018' 
#and month(DateOfPurchase)='6'
#and week(DateOfPurchase)='20'
) as B
#where year(DOP)='2018' 
#and month(DOP)='6'
group by DOP,sv_year,sv_month,sv_week ) as v
group by sv_year,sv_month,sv_week