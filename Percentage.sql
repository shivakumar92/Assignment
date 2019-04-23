use servify_assignment;
select PlanID,count(distinct(csrid)),count(*),count(distinct(csrid))*100/count(*) as Percentage from (
select sp.PlanID,sp.SoldPlanID,csrid from sold_plan sp
left outer join
(select ConsumerServiceRequestID as csrid,SoldPlanID from consumer_servicerequest) cr
on sp.SoldPlanID=cr.SoldPlanID) as C
group by PlanID



