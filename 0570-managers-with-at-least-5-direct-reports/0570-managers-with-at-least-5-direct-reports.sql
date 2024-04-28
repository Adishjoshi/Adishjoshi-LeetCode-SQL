


Select e1.name
from employee as e
inner join employee as e1
on e.managerId= e1.id #join on manager id from e table on the emp_id from the e1 table
group by e.managerId 
having count(e.id)>=5