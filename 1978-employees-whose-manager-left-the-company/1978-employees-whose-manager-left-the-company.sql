

Select
e.employee_id
from  Employees e
    left join Employees b
        on e.manager_id = b.employee_id
where b.employee_id is null and e.salary <30000 and e.manager_id is not null
order by 1